import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tiutiu/core/constants/app_colors.dart';

class ButtonSocialLogin extends StatelessWidget {
  ButtonSocialLogin({
    this.imageUrl,
    this.text,
  });

  final String? imageUrl;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Row(
              children: [
                SizedBox(width: 58),
                Container(
                  margin: const EdgeInsets.only(top: 28),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 8,
                    ),
                    child: AutoSizeText(text!),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 12),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  imageUrl!,
                  width: 50,
                  height: 50,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
