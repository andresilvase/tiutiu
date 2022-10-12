import 'package:tiutiu/features/posts/widgets/location_selecter.dart';
import 'package:tiutiu/features/pets/model/pet_model.dart';
import 'package:tiutiu/core/data/states_and_cities.dart';
import 'package:tiutiu/features/system/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => LocationSelecter(
          fillFullAddress: postsController.isFullAddress,
          onFullAddressSelected: (value) {
            postsController.toggleFullAddress();
          },
          initialState: postsController.pet.state,
          initialCity: postsController.pet.city,
          onStateChanged: (state) {
            postsController.updatePet(PetEnum.state, state);
            postsController.updatePet(
              PetEnum.city,
              StatesAndCities()
                  .citiesOf(
                    stateName: postsController.pet.state,
                  )
                  .first,
            );
          },
          onCityChanged: (city) {
            postsController.updatePet(PetEnum.city, city);
          },
        ),
      ),
    );
  }
}
