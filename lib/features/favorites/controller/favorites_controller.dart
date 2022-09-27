import 'package:tiutiu/features/pets/model/pet_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController {
  final RxList<QueryDocumentSnapshot> _favoritesListReference =
      <QueryDocumentSnapshot>[].obs;
  final RxList<String> _favoritesPETSIDList = <String>[].obs;
  final RxList<Pet> _favoritesPETSList = <Pet>[].obs;

  List<QueryDocumentSnapshot> get favoritesListReference =>
      _favoritesListReference;
  List<String> get favoritesPETSIDList => _favoritesPETSIDList;
  List<Pet> get favoritesPETSList => _favoritesPETSList;

  void set favoritesListReference(List<QueryDocumentSnapshot> list) {
    _favoritesListReference(list);
  }

  void set favoritesPETSIDList(List<String> list) {
    _favoritesPETSIDList(list);
  }

  void set favoritesPETSList(List<Pet> list) {
    _favoritesPETSList(list);
  }

  Future<void> loadFavoritesReference() async {}

  Future<void> loadPETsFavorites() async {
    List<Pet> petFavoritesList = [];
    List<String> petFavoritesID = [];

    for (int i = 0; i < favoritesListReference.length; i++) {
      DocumentSnapshot pet = await ((favoritesListReference[i].data()
              as Map<String, dynamic>)['id'] as DocumentReference)
          .get();
      if (pet.data() != null) {
        petFavoritesList.add(Pet.fromMap((pet.data() as Map<String, dynamic>)));
        petFavoritesID.add(pet.id);
      }
    }

    favoritesPETSList = petFavoritesList;
    favoritesPETSIDList = petFavoritesID;
  }

  bool handleFavorite(String id) {
    if (favoritesPETSIDList.contains(id)) {
      var tempList = favoritesPETSIDList;
      tempList.remove(id);
      print('removeu');
      favoritesPETSIDList = tempList;
    }
    return favoritesPETSIDList.contains(id);
  }
}
