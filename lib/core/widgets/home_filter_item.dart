import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiutiu/core/constants/text_styles.dart';
import 'package:tiutiu/core/constants/app_colors.dart';
import 'package:tiutiu/core/utils/asset_handle.dart';
import 'package:tiutiu/core/utils/dimensions.dart';
import 'package:flutter/material.dart';

class HomeFilterItem extends StatelessWidget {
  const HomeFilterItem({
    this.isActive = false,
    required this.image,
    required this.type,
    this.onItemTap,
    super.key,
  });

  final Function()? onItemTap;
  final bool isActive;
  final String image;
  final String type;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemTap,
      child: Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.symmetric(horizontal: 3.0.w),
        decoration: BoxDecoration(
          border: Border.all(width: 1.0.w, color: AppColors.primary),
          color: isActive ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        height: 64.0.h,
        width: 64.0.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: Dimensions.getDimensBasedOnDeviceHeight(
                smaller: 50.0.h,
                bigger: 42.0.h,
                medium: 42.0.h,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: AssetHandle.getImage(
                  fit: BoxFit.cover,
                  image,
                ),
              ),
            ),
            // SizedBox(height: 16.0.h),
            AutoSizeTexts.autoSizeText10(
              color: isActive ? AppColors.white : AppColors.primary,
              fontWeight: FontWeight.w600,
              type,
            )
          ],
        ),
      ),
    );
  }
}
