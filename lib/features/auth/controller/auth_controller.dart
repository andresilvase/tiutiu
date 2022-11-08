import 'package:tiutiu/features/auth/models/email_password_auth.dart';
import 'package:tiutiu/features/tiutiu_user/model/tiutiu_user.dart';
import 'package:tiutiu/core/local_storage/local_storage_keys.dart';
import 'package:tiutiu/features/auth/service/auth_service.dart';
import 'package:tiutiu/core/local_storage/local_storage.dart';
import 'package:tiutiu/core/constants/images_assets.dart';
import 'package:tiutiu/features/system/controllers.dart';
import 'package:tiutiu/core/models/whatsapp_token.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'dart:math';

enum AuthKeys {
  password,
  token,
  email,
}

class AuthController extends GetxController {
  AuthController({required AuthService authService}) : _authService = authService;

  final AuthService _authService;

  final Rx<EmailAndPasswordAuth> _emailAndPasswordAuth = EmailAndPasswordAuth().obs;
  final RxBool _isWhatsappTokenStillValid = true.obs;
  final RxBool _isCreatingNewAccount = false.obs;
  final RxBool _isShowingPassword = false.obs;
  final RxInt _secondsToExpireCode = 0.obs;
  final RxBool _isLoading = false.obs;

  EmailAndPasswordAuth get emailAndPasswordAuth => _emailAndPasswordAuth.value;
  bool get isWhatsappTokenStillValid => _isWhatsappTokenStillValid.value;
  bool get isCreatingNewAccount => _isCreatingNewAccount.value;
  int get secondsToExpireCode => _secondsToExpireCode.value;
  bool get isShowingPassword => _isShowingPassword.value;
  bool get userExists => _authService.userExists;
  bool get isLoading => _isLoading.value;

  User? get user => _authService.authUser;

  void set _setEmailAndPasswordAuth(EmailAndPasswordAuth newValue) {
    _emailAndPasswordAuth(newValue);
  }

  void set isCreatingNewAccount(bool value) => _isCreatingNewAccount(value);
  void set isShowingPassword(bool value) => _isShowingPassword(value);
  void set isLoading(bool value) => _isLoading(value);

  void clearEmailAndPassword() {
    _emailAndPasswordAuth(EmailAndPasswordAuth());
  }

  void updateEmailAndPasswordAuth(EmailAndPasswordAuthEnum property, dynamic data) {
    final map = emailAndPasswordAuth.toMap();
    map[property.name] = data;

    _setEmailAndPasswordAuth = EmailAndPasswordAuth().fromMap(map);
  }

  Future<void> verifyPhoneNumber() async {
    await _verifyIfWhatsappTokenStillValid();

    if (!isWhatsappTokenStillValid) {
      final code = _generateCode();
      final whatsappTokenData = WhatsAppToken(
        expirationDate: DateTime.now().add(Duration(minutes: 5)).toIso8601String(),
        code: code,
      );

      await LocalStorage.setDataUnderKey(
        key: LocalStorageKey.whatsappTokenData,
        data: whatsappTokenData.toMap(),
      );

      await _authService.verifyPhoneNumber('62994670169', code);
    }
  }

  String _generateCode() {
    debugPrint('>> Generating code..');
    String code = '';
    for (int i = 0; i < 6; i++) {
      final digit = Random().nextInt(9);
      code += '$digit';
    }

    debugPrint('>> Code generated $code..');
    return code;
  }

  Future<void> _verifyIfWhatsappTokenStillValid() async {
    final whatsAppTokenData = await LocalStorage.getDataUnderKey(
      key: LocalStorageKey.whatsappTokenData,
      mapper: WhatsAppToken(),
    );

    debugPrint('>> Whatsapp tokenData ${whatsAppTokenData?.toMap()}..');

    if (whatsAppTokenData == null) {
      _isWhatsappTokenStillValid(false);
    } else {
      final expirationDate = (whatsAppTokenData as WhatsAppToken).expirationDate!;
      final isTokenExpired = DateTime.now().isAfter(DateTime.parse(expirationDate));

      _isWhatsappTokenStillValid(!isTokenExpired);

      if (isWhatsappTokenStillValid) {
        final seconds = DateTime.parse(expirationDate).difference(DateTime.now()).inSeconds;
        _secondsToExpireCode(seconds);
      }
    }
  }

  Future<bool> createUserWithEmailAndPassword() async {
    bool success = false;

    if (emailAndPasswordAuth.password == emailAndPasswordAuth.repeatPassword) {
      isLoading = true;
      success = await _authService.createUserWithEmailAndPassword(
        password: emailAndPasswordAuth.password!,
        email: emailAndPasswordAuth.email!,
      );

      if (success) {
        await loadUserData();
        saveEmailAndPasswordAuthData();
      }

      isCreatingNewAccount = false;
      isShowingPassword = false;
      isLoading = false;
    }

    return success;
  }

  Future<bool> loginWithEmailAndPassword() async {
    isLoading = true;

    final bool success = await _authService.loginWithEmailAndPassword(
      password: emailAndPasswordAuth.password!,
      email: emailAndPasswordAuth.email!,
    );

    if (success) {
      await loadUserData();
      saveEmailAndPasswordAuthData();
    }

    isShowingPassword = false;
    isLoading = false;

    debugPrint('${success ? 'Successfully' : 'Not'} authenticated');

    return success;
  }

  Future<bool> loginWithFacebook({bool firstLogin = true}) async {
    isLoading = true;

    final bool success = await _authService.loginWithFacebook(
      firstLogin: firstLogin,
    );

    if (success) {
      await loadUserData();
      registerFirstLogin();
    }

    isLoading = false;

    return success;
  }

  Future<bool> loginWithApple() async {
    isLoading = true;

    await _authService.loginWithApple();

    if (isLoading) {
      await loadUserData();
      registerFirstLogin();
    }

    isLoading = false;

    return isLoading;
  }

  Future<void> passwordReset(String email) async {
    await _authService.passwordReset(email);
  }

  Future<bool> tryAutoLoginIn() async {
    bool success = user != null;
    debugPrint('>> trying automatically login...');

    if (user == null) {
      final hosters = [
        await trySignInWithEmailAndPassword(),
        await tryLoginWithFacebook(),
      ];

      int count = 0;
      while (!success && count < hosters.length) {
        success = hosters[count];
        count++;
      }
    } else {
      loadUserData();
    }

    debugPrint('>> Successfull login? $success');
    return success;
  }

  Future<bool> trySignInWithEmailAndPassword() async {
    debugPrint('>> trying log in using email and password');
    final emailPasswordAuthData = await LocalStorage.getDataUnderKey(
      key: LocalStorageKey.emailPasswordAuthData,
      mapper: EmailAndPasswordAuth(),
    ) as EmailAndPasswordAuth?;

    if (emailPasswordAuthData != null) {
      _setEmailAndPasswordAuth = EmailAndPasswordAuth(
        password: (emailPasswordAuthData).password,
        email: emailPasswordAuthData.email,
      );

      return loginWithEmailAndPassword();
    }

    debugPrint('>> trying log in using email and password failed');
    return false;
  }

  Future<bool> tryLoginWithFacebook() async {
    debugPrint('>> trying log in with facebook');

    final firstLogin = await LocalStorage.getBooleanKey(
      key: LocalStorageKey.facebookAuthData,
      standardValue: true,
    );

    debugPrint('>> First Login? $firstLogin');

    if (!firstLogin) {
      return loginWithFacebook(firstLogin: firstLogin);
    }

    debugPrint('>> trying log in with facebook failed');
    return false;
  }

  void saveEmailAndPasswordAuthData() {
    LocalStorage.setDataUnderKey(
      key: LocalStorageKey.emailPasswordAuthData,
      data: {
        AuthKeys.password.name: emailAndPasswordAuth.password!,
        AuthKeys.email.name: emailAndPasswordAuth.email!,
      },
    );
  }

  void registerFirstLogin() {
    LocalStorage.setBooleanUnderKey(
      key: LocalStorageKey.facebookAuthData,
      value: false,
    );
  }

  Future<void> loadUserData() async {
    await tiutiuUserController.updateLoggedUserData(
      authController.user!.uid,
    );

    updateUserInfo();
  }

  Future<void> updateUserInfo() async {
    final lastSignInTime = _authService.authUser?.metadata.lastSignInTime;
    final creationTime = _authService.authUser?.metadata.creationTime;
    final loggedUser = tiutiuUserController.tiutiuUser;

    await user?.reload();

    if (creationTime != null) {
      debugPrint('>> Updating createAt...');
      tiutiuUserController.updateTiutiuUser(
        TiutiuUserEnum.createdAt,
        creationTime.toIso8601String(),
      );
    }

    if (lastSignInTime != null) {
      debugPrint('>> Updating lastSeen...');
      tiutiuUserController.updateTiutiuUser(
        TiutiuUserEnum.lastLogin,
        lastSignInTime.toIso8601String(),
      );
    }

    if (user?.providerData.first.providerId != AuthKeys.password.name) {
      debugPrint('>> Updating emailVerified...');
      tiutiuUserController.updateTiutiuUser(
        TiutiuUserEnum.emailVerified,
        true,
      );
    } else {
      debugPrint('>> Updating password emailVerified... ${user?.emailVerified}');
      tiutiuUserController.updateTiutiuUser(
        TiutiuUserEnum.emailVerified,
        user?.emailVerified ?? false,
      );
    }

    if (loggedUser.displayName == null) {
      debugPrint('>> Updating displayName...');
      tiutiuUserController.updateTiutiuUser(
        TiutiuUserEnum.displayName,
        user?.displayName,
      );
    }

    if (loggedUser.avatar == null) {
      debugPrint('>> Updating avatar...');
      tiutiuUserController.updateTiutiuUser(
        TiutiuUserEnum.avatar,
        user?.photoURL,
      );
    }

    if (loggedUser.phoneNumber == null) {
      debugPrint('>> Updating phoneNumber...');
      tiutiuUserController.updateTiutiuUser(
        TiutiuUserEnum.phoneNumber,
        user?.phoneNumber,
      );
    }

    if (loggedUser.uid == null) {
      debugPrint('>> Updating uid...');
      tiutiuUserController.updateTiutiuUser(
        TiutiuUserEnum.uid,
        loggedUser.uid ?? user!.uid,
      );
    }

    if (loggedUser.email == null) {
      debugPrint('>> Updating email...');
      tiutiuUserController.updateTiutiuUser(
        TiutiuUserEnum.email,
        authController.user!.email,
      );
    }

    await tiutiuUserController.updateUserDataOnServer();
  }

  Future<void> signOut() async {
    debugPrint('>> Login out...');
    await _authService.logOut();
    debugPrint('>> User ${_authService.authUser}');
    clearAllAuthData();
    clearEmailAndPassword();
    debugPrint('>> Cleaning cache...');
    homeController.bottomBarIndex = 0;
    debugPrint('>> Logout done!');
  }

  void clearAllAuthData() {
    tiutiuUserController.resetUserWithThisUser();
    LocalStorage.clearStorage();
  }

  final _startScreenImages = [
    StartScreenAssets.whiteCat,
    StartScreenAssets.greyCat,
    StartScreenAssets.pinscher,
    StartScreenAssets.oldMel,
    StartScreenAssets.munkun,
    StartScreenAssets.liu,
    StartScreenAssets.husky,
    StartScreenAssets.hairy,
  ];

  List<String> get startScreenImages => _startScreenImages;
}
