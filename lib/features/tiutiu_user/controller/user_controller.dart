import 'package:tiutiu/features/system/controllers.dart';
import 'package:tiutiu/features/tiutiu_user/services/tiutiu_user_service.dart';
import 'package:tiutiu/features/tiutiu_user/model/tiutiu_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class TiutiuUserController extends GetxController {
  TiutiuUserController(TiutiuUserService tiutiuUserService)
      : _tiutiuUserService = tiutiuUserService;

  final TiutiuUserService _tiutiuUserService;

  final Rx<TiutiuUser> _tiutiuUser = TiutiuUser().obs;
  final RxBool _isLoading = false.obs;

  TiutiuUserService get service => _tiutiuUserService;
  TiutiuUser get tiutiuUser => _tiutiuUser.value;
  bool get isLoading => _isLoading.value;

  void updateTiutiuUser(TiutiuUserEnum property, dynamic data) {
    Map<String, dynamic> map = _tiutiuUser.value.toMap();
    map[property.name] = data;

    TiutiuUser newTiutiuUser = TiutiuUser.fromMap(map);

    _tiutiuUser(newTiutiuUser);
  }

  void set isLoading(bool value) => _isLoading(value);

  Future<void> handleNotifications(data) async {}

  Stream<QuerySnapshot> loadNotifications() {
    return _tiutiuUserService.loadNotifications(tiutiuUser.uid!);
  }

  Future<TiutiuUser> getUserById(String id) async {
    return await _tiutiuUserService.getUserByID(id);
  }

  Future<void> updateUserDataOnServer() async {
    var avatarPath = tiutiuUser.avatar;

    isLoading = true;
    if (avatarPath != null && !avatarPath.toString().contains('http')) {
      var urlAvatar = await _tiutiuUserService.uploadAvatar(
        tiutiuUser.uid ?? authController.user!.uid,
        avatarPath,
      );

      updateTiutiuUser(TiutiuUserEnum.avatar, urlAvatar);
    }

    updateTiutiuUser(
      TiutiuUserEnum.uid,
      tiutiuUser.uid ?? authController.user!.uid,
    );

    updateTiutiuUser(
      TiutiuUserEnum.createdAt,
      DateTime.now().toIso8601String(),
    );

    await _tiutiuUserService.updateUser(userData: tiutiuUser);
    isLoading = false;
  }

  void resetUserData() {
    _tiutiuUser(TiutiuUser());
  }
}
