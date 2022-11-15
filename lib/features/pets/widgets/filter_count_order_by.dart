import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiutiu/Widgets/custom_input_search.dart';
import 'package:tiutiu/features/system/controllers.dart';
import 'package:tiutiu/core/data/states_and_cities.dart';
import 'package:tiutiu/core/constants/text_styles.dart';
import 'package:tiutiu/core/constants/app_colors.dart';
import 'package:tiutiu/core/models/filter_params.dart';
import 'package:tiutiu/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterResultCount extends StatelessWidget {
  const FilterResultCount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Divider(height: 8.0.h, color: AppColors.secondary),
          Container(
            height: 24.0.h,
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            margin: EdgeInsets.only(bottom: 4.0.h),
            child: Row(
              children: [
                Row(
                  children: [
                    AutoSizeTexts.autoSizeText12('${postsController.postsCount} '),
                    AutoSizeTexts.autoSizeText12(FilterStrings.foundAt),
                  ],
                ),
                Spacer(),
                DropdownButton<String>(
                  value: filterController.filterParams.value.state,
                  underline: SizedBox(),
                  onChanged: (value) {
                    filterController.updateParams(
                      FilterParamsEnum.state,
                      value,
                    );
                  },
                  items: StatesAndCities()
                      .stateInitials
                      .map(
                        (e) => DropdownMenuItem<String>(
                          child: AutoSizeTexts.autoSizeText12(e),
                          value: e,
                        ),
                      )
                      .toList(),
                ),
                Spacer(),
                Row(
                  children: [
                    AutoSizeTexts.autoSizeText12(FilterStrings.orderedBy),
                    CustomDropdownButtonSearch(
                      initialValue: filterController.getParams.orderBy,
                      itemList: filterController.orderTypeList,
                      onChange: (String value) {
                        filterController.updateParams(
                          FilterParamsEnum.orderBy,
                          value,
                        );
                      },
                      colorText: Colors.black54,
                      isExpanded: false,
                      withPipe: false,
                      fontSize: 12,
                      label: '',
                    )
                  ],
                ),
              ],
            ),
          ),
          Divider(height: 8.0.h, color: AppColors.secondary),
        ],
      ),
    );
  }
}
