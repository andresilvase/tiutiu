import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiutiu/l10n/app_localizations.dart';
import 'package:tiutiu/features/auth/widgets/headline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiutiu/core/utils/routes/routes_name.dart';
import 'package:tiutiu/core/controllers/controllers.dart';
import 'package:tiutiu/core/views/load_dark_screen.dart';
import 'package:tiutiu/core/constants/text_styles.dart';
import 'package:tiutiu/core/mixins/tiu_tiu_pop_up.dart';
import 'package:tiutiu/core/constants/app_colors.dart';
import 'package:tiutiu/core/widgets/tiutiu_logo.dart';
import 'package:tiutiu/core/widgets/button_wide.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class AuthHosters extends StatelessWidget with TiuTiuPopUp {
  const AuthHosters({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _backgroundImage(),
            _gradient(),
            _appLogo(),
            _adoptionForm(context),
            Positioned(
              bottom: MediaQuery.of(context).viewInsets.bottom + 56.0.h,
              left: 8.0,
              right: 8.0,
              child: Column(
                children: [
                  _headline(context),
                  SizedBox(height: 16.0.h),
                  _authButtons(context),
                ],
              ),
            ),
            _loadingWidget(context),
          ],
        ),
      ),
    );
  }

  Container _backgroundImage() {
    final photos = authController.startScreenImages;
    final nextImage = Random().nextInt(photos.length);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            photos[nextImage],
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Container _gradient() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            AppColors.black.withValues(alpha: .9),
            AppColors.black.withValues(alpha: .4),
          ],
        ),
      ),
    );
  }

  Positioned _appLogo() {
    return Positioned(
      left: Get.width * .325,
      top: 40.0.h,
      child: SizedBox(
        child: TiutiuLogo(),
        width: Get.width,
      ),
    );
  }

  Positioned _adoptionForm(BuildContext context) {
    return Positioned(
      top: 124.0.h,
      right: 16,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.white,
          disabledForegroundColor: Colors.grey,
          padding: EdgeInsets.zero,
        ),
        onPressed: () {
          Get.toNamed(Routes.infoAdoptionForm);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.list_alt_outlined, color: AppColors.white, size: 16.0.h),
            SizedBox(width: 4.0.w),
            AutoSizeTexts.autoSizeText12(
              AppLocalizations.of(context)!.adoptionForm,
              color: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _headline(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0.w),
      child: Headline(
        text: AppLocalizations.of(context)!.authentique,
        textColor: AppColors.white,
      ),
    );
  }

  Widget _authButtons(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Social login UI is intentionally disabled.
        /*
        Visibility(
          visible: Platform.isIOS,
          child: ButtonWide(
            icon: FontAwesomeIcons.apple.data,
            onPressed: () => _loginWithApple(context),
            textColor: AppColors.black,
            text: AppLocalizations.of(context)!.apple,
            color: AppColors.white,
            isToExpand: true,
          ),
        ),
        */
        ButtonWide(
          icon: FontAwesomeIcons.envelope.data,
          text: AppLocalizations.of(context)!.email,
          color: Colors.grey,
          isToExpand: true,
          onPressed: () {
            Get.toNamed(Routes.emailAndPassword);
          },
        ),
        /*
        ButtonWide(
          icon: FontAwesomeIcons.google.data,
          text: AppLocalizations.of(context)!.google,
          onPressed: () => _loginWithGoogle(context),
          color: AppColors.danger,
          isToExpand: true,
        ),
        */
        _continueAnonButton(context),
      ],
    );
  }

  Widget _continueAnonButton(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        splashFactory: InkRipple.splashFactory,
        foregroundColor: Colors.transparent,
        padding: EdgeInsets.zero,
      ),
      child: AutoSizeTexts.autoSizeText18(
        fontWeight: FontWeight.bold,
        textAlign: TextAlign.center,
        AppLocalizations.of(context)!.continueAnon,
        color: AppColors.white,
      ),
      onPressed: () {
        filterController.reset();
        goToHome();
      },
    );
  }

  Widget _loadingWidget(BuildContext context) {
    return Obx(
      () => LoadDarkScreen(
        message: AppLocalizations.of(context)!.loginInProgress,
        visible: authController.isLoading,
      ),
    );
  }

  // ignore: unused_element
  void _loginWithGoogle(BuildContext context) async {
    try {
      await authController.loginWithGoogle().then(
        (success) {
          if (success) {
            goToHome();
            authController.isLoading = false;
          }
        },
      );
    } catch (exception) {
      authController.isLoading = false;
      crashlyticsController.reportAnError(
        message: 'Error Logining with Google: $exception',
        exception: exception,
        stackTrace: StackTrace.current,
      );

      showPopUp(
        backGroundColor: AppColors.danger,
        title: AppLocalizations.of(context)!.authFailure,
        message: exception.toString(),
      );
    }
  }

  // ignore: unused_element
  void _loginWithApple(BuildContext context) async {
    try {
      await authController.loginWithApple().then(
        (success) {
          if (success) {
            goToHome();
            authController.isLoading = false;
          }
        },
      );
    } catch (exception) {
      authController.isLoading = false;

      crashlyticsController.reportAnError(
        message: 'Error Logining with Apple: $exception',
        exception: exception,
        stackTrace: StackTrace.current,
      );

      showPopUp(
        message: AppLocalizations.of(context)!.loginCouldNotProceed,
        title: AppLocalizations.of(context)!.authFailure,
        backGroundColor: AppColors.danger,
      );
    }
  }

  void goToHome() {
    final bottomIndex = homeController.bottomBarIndex;
    if (kDebugMode)
      debugPrint('TiuTiuApp: Bottom Index == 0? ${bottomIndex == 0}');

    if (systemController.properties.internetConnected) {
      Get.offAndToNamed(Routes.home);
    } else {
      Get.offAndToNamed(Routes.root);
    }

    homeController.setDonateIndex();
  }
}
