import 'package:tiutiu/features/posts/validators/form_validators.dart';
import 'package:tiutiu/core/extensions/string_extension.dart';
import 'package:tiutiu/features/posts/widgets/text_area.dart';
import 'package:tiutiu/core/widgets/underline_input_dropdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiutiu/core/pets/model/pet_model.dart';
import 'package:tiutiu/core/controllers/controllers.dart';
import 'package:tiutiu/core/constants/app_colors.dart';
import 'package:tiutiu/core/widgets/underline_text.dart';
import 'package:tiutiu/core/constants/strings.dart';
import 'package:tiutiu/core/utils/validators.dart';
import 'package:tiutiu/core/widgets/one_line_text.dart';
import 'package:tiutiu/core/data/dummy_data.dart';
import 'package:tiutiu/features/posts/model/post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final monthsList = List<String>.generate(13, (index) => '$index');
    final yearsList = List.generate(22, (index) => '$index');

    return Obx(
      () => ListView(
        padding: EdgeInsets.only(top: 8.0.h),
        children: [
          _petName(),
          _divider(),
          _petAge(yearsList, monthsList),
          _divider(),
          _petSize(),
          SizedBox(height: 32.0.h),
          _health(),
        ],
      ),
    );
  }

  SizedBox _divider() => SizedBox(height: 16.0.h);

  Padding _petName() {
    return Padding(
      padding: EdgeInsets.fromLTRB(3.0.w, 0.0.h, 3.0.w, 16.0.h),
      child: Form(
        key: nameKeyForm,
        child: Obx(
          () => UnderlineInputText(
            initialValue: postsController.post.name,
            validator: Validators.verifyEmpty,
            onChanged: (name) {
              nameKeyForm.currentState!.validate();
              postsController.updatePost(PostEnum.name.name, name.trim());
            },
            labelText: PostFlowStrings.petName,
            fontSizeLabelText: 14.0,
          ),
        ),
      ),
    );
  }

  Column _petAge(List<String> yearsList, List<String> monthsList) {
    return Column(
      children: [
        OneLineText(
          widgetAlignment: Alignment(-0.92, 1),
          fontWeight: FontWeight.w500,
          color: AppColors.secondary,
          text: PostFlowStrings.age,
          fontSize: 14,
        ),
        Row(
          children: [
            Expanded(
              child: UnderlineInputDropdown(
                initialValue: (postsController.post as Pet).ageYear.toString(),
                onChanged: (anos) {
                  postsController.updatePost(
                    PetEnum.ageYear.name,
                    int.parse(anos ?? '0'),
                  );
                },
                labelText: PostFlowStrings.years,
                fontSize: 14.0,
                items: yearsList,
              ),
            ),
            Expanded(
              child: UnderlineInputDropdown(
                initialValue: (postsController.post as Pet).ageMonth.toString(),
                onChanged: (meses) {
                  postsController.updatePost(
                    PetEnum.ageMonth.name,
                    int.parse(meses ?? '0'),
                  );
                },
                labelText: PostFlowStrings.months,
                fontSize: 14.0,
                items: monthsList,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Padding _petSize() {
    return Padding(
      padding: EdgeInsets.only(top: 32.0.h),
      child: UnderlineInputDropdown(
        isInErrorState: !(postsController.post as Pet).size.isNotEmptyNeighterNull() && !postsController.formIsValid,
        initialValue: (postsController.post as Pet).size.toString(),
        onChanged: (size) {
          postsController.updatePost(PetEnum.size.name, size);
        },
        labelText: PostFlowStrings.size,
        items: DummyData.size,
        fontSize: 14.0,
      ),
    );
  }

  Widget _health() {
    return AnimatedContainer(
      height: postsController.existChronicDisease ? 152.0.h : 80.0.h,
      margin: EdgeInsets.only(bottom: 8.0.h),
      duration: Duration(milliseconds: 500),
      child: ListView(
        children: [
          UnderlineInputDropdown(
            isInErrorState:
                !(postsController.post as Pet).health.isNotEmptyNeighterNull() && !postsController.formIsValid,
            initialValue: (postsController.post as Pet).health.toString(),
            onChanged: (health) {
              postsController.updatePost(PetEnum.health.name, health);
            },
            labelText: PostDetailsStrings.health,
            items: DummyData.health,
            fontSize: 14.0,
          ),
          _chronicDiseaseInfo(),
        ],
      ),
    );
  }

  Visibility _chronicDiseaseInfo() {
    return Visibility(
      visible: postsController.existChronicDisease,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0.h),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: diaseaseForm,
                child: TextArea(
                  isInErrorState: !(postsController.post as Pet).chronicDiseaseInfo.isNotEmptyNeighterNull() &&
                      !postsController.formIsValid,
                  maxLines: 1,
                  onChanged: (chronicDiseaseInfo) {
                    postsController.updatePost(
                      PetEnum.chronicDiseaseInfo.name,
                      chronicDiseaseInfo,
                    );
                  },
                  initialValue: (postsController.post as Pet).chronicDiseaseInfo,
                  validator: postsController.existChronicDisease ? Validators.verifyEmpty : null,
                  labelText: PostFlowStrings.describeDiseaseType,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
