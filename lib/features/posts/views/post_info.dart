import 'package:tiutiu/Widgets/underline_input_dropdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiutiu/features/pets/model/pet_model.dart';
import 'package:tiutiu/features/system/controllers.dart';
import 'package:tiutiu/core/constants/strings.dart';
import 'package:tiutiu/Widgets/underline_text.dart';
import 'package:tiutiu/core/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final petType = [
      FilterStrings.dog,
      FilterStrings.cat,
      FilterStrings.bird,
      FilterStrings.exotic,
    ];

    final monthsList = List.generate(13, (index) => '$index');
    final yearsList = List.generate(22, (index) => '$index');

    return Scaffold(
      body: Obx(
        () => ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0.w),
              child: Form(
                key: postsController.nameKeyForm,
                child: UnderlineInputText(
                  initialValue: postsController.pet.name,
                  validator: Validators.verifyEmpty,
                  onChanged: (name) {
                    postsController.updatePet(PetEnum.name, name);
                  },
                  labelText: PostFlowStrings.petName,
                  fontSizeLabelText: 14.0.sp,
                ),
              ),
            ),
            _spacer(),
            UnderlineInputDropdown(
              initialValue: postsController.pet.type,
              onChanged: (type) {
                postsController.updatePet(PetEnum.type, type);
              },
              labelText: AppStrings.type,
              fontSize: 14.0.sp,
              items: petType,
            ),
            _spacer(),
            Row(
              children: [
                Expanded(
                  child: UnderlineInputDropdown(
                    initialValue: postsController.pet.ageYear.toString(),
                    onChanged: (anos) {
                      postsController.updatePet(
                        PetEnum.ageYear,
                        int.parse(anos ?? '0'),
                      );
                    },
                    labelText: PostFlowStrings.years,
                    fontSize: 14.0.sp,
                    items: yearsList,
                  ),
                ),
                SizedBox(width: 32.0.h),
                Expanded(
                  child: UnderlineInputDropdown(
                    initialValue: postsController.pet.ageMonth.toString(),
                    onChanged: (meses) {
                      postsController.updatePet(
                        PetEnum.ageMonth,
                        int.parse(meses ?? '0'),
                      );
                    },
                    labelText: PostFlowStrings.months,
                    fontSize: 14.0.sp,
                    items: monthsList,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  SizedBox _spacer() => SizedBox(height: 24.0.h);
}
