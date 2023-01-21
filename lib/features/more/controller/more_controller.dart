import 'package:tiutiu/core/utils/routes/routes_name.dart';
import 'package:tiutiu/core/controllers/controllers.dart';
import 'package:tiutiu/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreController extends GetxController {
  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  void handleOptionHitted(String option) {
    switch (option) {
      case MyProfileOptionsTile.myPosts:
        postsController.openMypostsLists();
        break;
      case MyProfileOptionsTile.messages:
        Get.toNamed(Routes.contacts);
        break;
      case MyProfileOptionsTile.saveds:
        Get.toNamed(Routes.favorites);
        break;
      case MyProfileOptionsTile.settings:
        Get.toNamed(Routes.settings);
        break;
      case MyProfileOptionsTile.about:
        break;
      case MyProfileOptionsTile.talkWithUs:
        Get.toNamed(Routes.talkWithUs);
        break;
      case MyProfileOptionsTile.support:
        Get.toNamed(Routes.suportUs);
        break;
      case MyProfileOptionsTile.fillAdoptioinForm:
        Get.toNamed(Routes.adoptionForm);
        break;
      case MyProfileOptionsTile.ourNet:
        Get.toNamed(Routes.followUs);
        break;
    }
  }

  Future<void> save() async {
    _isLoading(true);

    await authController.updateUserInfo();
    tiutiuUserController.checkUserRegistered();

    _isLoading(false);
  }

  List<String> myProfileOptionsTile = _myProfileOptionsTile;

  static const List<String> _myProfileOptionsTile = [
    MyProfileOptionsTile.talkWithUs,
    MyProfileOptionsTile.ourNet,
    MyProfileOptionsTile.saveds,
    MyProfileOptionsTile.myPosts,
    MyProfileOptionsTile.messages,
    MyProfileOptionsTile.support,
    MyProfileOptionsTile.fillAdoptioinForm,
    MyProfileOptionsTile.settings,
    MyProfileOptionsTile.about,
  ];

  List<IconData> get myProfileOptionsIcon => _myProfileOptionsIcon;

  final List<IconData> _myProfileOptionsIcon = [
    Icons.headset_mic_outlined,
    Icons.groups_outlined,
    Icons.bookmark_border_rounded,
    Icons.photo_outlined,
    Icons.forum_outlined,
    Icons.volunteer_activism_outlined,
    Icons.list_alt_rounded,
    Icons.manage_accounts_outlined,
    Icons.info_outline,
  ];
}
