import 'package:tiutiu/features/location/controller/current_location_controller.dart';
import 'package:tiutiu/features/refine_search/controller/filter_controller.dart';
import 'package:tiutiu/features/favorites/controller/favorites_controller.dart';
import 'package:tiutiu/features/tiutiu_user/controller/user_controller.dart';
import 'package:tiutiu/features/my_pets/controller/my_pets_controller.dart';
import 'package:tiutiu/features/system/controller/system_controller.dart';
import 'package:tiutiu/features/auth/controller/auth_controller.dart';
import 'package:tiutiu/features/chat/controller/chat_controller.dart';
import 'package:tiutiu/features/home/controller/home_controller.dart';
import 'package:tiutiu/features/pets/controller/pets_controller.dart';
import 'package:get/get.dart';

final CurrentLocationController currentLocationController = Get.find();
final TiutiuUserController tiutiuUserController = Get.find();
final FavoritesController favoritesController = Get.find();
final FilterController filterController = Get.find();
final MyPetsController myPetsController = Get.find();
final PetsController petsController = Get.find();
final HomeController homeController = Get.find();
final ChatController chatController = Get.find();
final AuthController authController = Get.find();
final SystemController system = Get.find();
