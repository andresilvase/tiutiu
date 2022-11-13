import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiutiu/core/constants/text_styles.dart';

import 'package:flutter/material.dart';

class AdDistanceFromUser extends StatelessWidget {
  const AdDistanceFromUser({
    required this.distanceText,
    super.key,
  });

  final String distanceText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0.h),
      child: Row(
        children: [
          AutoSizeTexts.autoSizeText12(
            textOverflow: TextOverflow.fade,
            'Está a $distanceText de você',
            fontWeight: FontWeight.w700,
            color: Colors.grey,
          ),
          SizedBox(width: 8.0.w),
          Icon(
            FontAwesomeIcons.locationArrow,
            color: Colors.grey,
            size: 12.0.h,
          )
        ],
      ),
    );
  }
}
