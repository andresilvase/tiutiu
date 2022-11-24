import 'package:tiutiu/features/auth/interface/auth_providers.dart';
import 'package:tiutiu/features/auth/service/whatsapp_service.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:tiutiu/core/Exceptions/tiutiu_exceptions.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

final String _googleClientId = '791022711249-jva0r9f0eddfo4skv18c0i1e26clq7pd.apps.googleusercontent.com';

class FirebaseAuthProvider implements AuthProviders {
  FirebaseAuthProvider._();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    serverClientId: Platform.isIOS ? null : _googleClientId,
    clientId: Platform.isIOS ? _googleClientId : null,
  );
  static FirebaseAuthProvider instance = FirebaseAuthProvider._();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get firebaseAuthUser => _firebaseAuth.currentUser;
  final FacebookAuth _facebookSignIn = FacebookAuth.i;

  Stream<User?> userStream() {
    return _firebaseAuth.authStateChanges();
  }

  Future sendWhatsAppCode(String phoneNumber, String code) async {
    final whatsappService = WhatsappService(code: code, phoneNumber: phoneNumber);

    try {
      await whatsappService.sendCodeVerification();
    } on Exception catch (error) {
      debugPrint('>> Error sending WhatsApp Message: $error');
      rethrow;
    }
  }

  @override
  Future<void> createUserWithEmailAndPassword({
    required String password,
    required String email,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        password: password,
        email: email,
      );

      await _sendEmailVerification(_firebaseAuth.currentUser);
    } on FirebaseAuthException catch (error) {
      throw TiuTiuAuthException(error.code);
    }
  }

  @override
  Future<void> loginWithEmailAndPassword({
    required String password,
    required String email,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        password: password,
        email: email,
      );
    } on FirebaseAuthException catch (error) {
      throw TiuTiuAuthException(error.code);
    }
  }

  Future<void> _sendEmailVerification(User? user) async {
    user?.sendEmailVerification();
    // Para quando a atualização já estiver na loja

    // if (user != null && !user.emailVerified) {
    //   var actionCodeSettings = ActionCodeSettings(
    //     url: 'https://tiutiu.page.link/verify-email?email=${user.email}',
    //     androidPackageName: 'com.anjasolutions.tiutiu',
    //     iOSBundleId: 'com.anjasolutions.tiutiu',
    //     androidMinimumVersion: '12',
    //     androidInstallApp: true,
    //     handleCodeInApp: true,
    //   );

    //   await user.sendEmailVerification(actionCodeSettings);
    // }
  }

  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
    await _signOutHosters();
  }

  Future<void> _signOutHosters() async {
    final facebookToken = await _facebookSignIn.accessToken;

    if (facebookToken != null) {
      _facebookSignIn.logOut();
    }

    if (await _googleSignIn.isSignedIn()) await _googleSignIn.signOut();
  }

  @override
  Future<bool> loginWithGoogle({bool autologin = false}) async {
    try {
      GoogleSignInAccount? _googleUser = _googleSignIn.currentUser;

      if (_googleUser == null) {
        if (autologin) {
          _googleUser ??= await _googleSignIn.signInSilently();
        } else {
          _googleUser ??= await _googleSignIn.signIn();
        }
      }

      if (_firebaseAuth.currentUser == null) {
        GoogleSignInAuthentication? googleAuth = await _googleUser?.authentication;

        if (googleAuth?.accessToken == null && googleAuth?.idToken == null) return false;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        await _firebaseAuth.signInWithCredential(credential);
      }
    } on Exception catch (error) {
      debugPrint('>> Erro ao realizar login com Google: $error');
    }

    return _firebaseAuth.currentUser != null;
  }

  @override
  Future<void> passwordReset(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<bool> loginWithFacebook({bool firstLogin = true}) async {
    try {
      OAuthCredential credential;

      debugPrint('>> Fisrt Login? $firstLogin');

      if (firstLogin) {
        final LoginResult result = await _facebookSignIn.login();

        debugPrint('>> Facebook LoginResul ${result.status}');

        if (result.status == LoginStatus.success) {
          AccessToken? accessToken = result.accessToken!;

          credential = FacebookAuthProvider.credential(accessToken.token);

          await _firebaseAuth.signInWithCredential(credential);
        } else {
          return false;
        }
      } else {
        final accessToken = await _facebookSignIn.accessToken;

        if (accessToken?.token != null) {
          credential = FacebookAuthProvider.credential(accessToken!.token);
          debugPrint('>> Facebook Credential $credential');
          await _firebaseAuth.signInWithCredential(credential);
        } else {
          return false;
        }
      }

      return _firebaseAuth.currentUser != null;
    } catch (exception) {
      debugPrint('An error ocurred when tryna to login with Facebook: $exception');
      throw TiuTiuAuthException('Error validating access token');
    }
  }

  @override
  Future<void> loginWithApple() async {
    await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
  }
}
