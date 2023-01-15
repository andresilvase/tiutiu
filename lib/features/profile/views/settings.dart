import 'package:tiutiu/core/widgets/default_basic_app_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiutiu/core/utils/routes/routes_name.dart';
import 'package:tiutiu/core/controllers/controllers.dart';
import 'package:tiutiu/core/widgets/my_account_card.dart';
import 'package:tiutiu/core/mixins/tiu_tiu_pop_up.dart';
import 'package:tiutiu/core/constants/app_colors.dart';
import 'package:tiutiu/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> with TiuTiuPopUp {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: DefaultBasicAppBar(text: MyProfileOptionsTile.settings),
        body: Card(
          child: ListView(
            children: [
              SizedBox(height: 6.0.h),
              MoreCardOption(
                icon: FontAwesomeIcons.penToSquare,
                onPressed: () {
                  Get.toNamed(Routes.editProfile);
                },
                text: SettingsStrings.editProfile,
              ),
              Divider(),
              MoreCardOption(
                icon: FontAwesomeIcons.earthAmericas,
                text: SettingsStrings.setMyProfileAsONG,
                badgeText: AppStrings.commingSoon,
                onPressed: () {},
                showBadge: true,
              ),
              Divider(),
              MoreCardOption(
                icon: Icons.person_off,
                onPressed: () {
                  _deleteAccount();
                },
                text: MyProfileOptionsTile.deleteAccount,
              ),
              Divider(),
              MoreCardOption(
                icon: FontAwesomeIcons.arrowRightFromBracket,
                onPressed: () {
                  _exitApp();
                },
                text: MyProfileOptionsTile.leave,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _deleteAccount() async {
    final canDeleteAccount = await deleteAccountController.canDeleteAccount();

    if (!canDeleteAccount)
      await deleteAccountController.showDeleteAccountLogoutWarningPopup();
    else
      Get.toNamed(Routes.deleteAccount);
  }

  Future<void> _exitApp() async {
    await showPopUp(
      message: AppStrings.wannaLeave,
      confirmText: AppStrings.yes,
      textColor: AppColors.black,
      mainAction: () {
        Get.back();
      },
      secondaryAction: () {
        Get.back();
        authController.signOut().then((value) => Get.offAllNamed(Routes.startScreen));
      },
      backGroundColor: AppColors.warning,
      barrierDismissible: false,
      title: AppStrings.leave,
      denyText: AppStrings.no,
    );
  }
}
