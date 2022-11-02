import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:tiutiu/core/constants/strings.dart';
import 'package:tiutiu/core/constants/text_styles.dart';

enum PickerAssetType {
  photo,
  video,
}

mixin Pickers {
  Future<void> pickAnAsset({
    required void Function(File?) onAssetPicked,
    required PickerAssetType pickerAssetType,
    required BuildContext context,
  }) async {
    final ImagePicker _picker = ImagePicker();

    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            TextButton(
              child: AutoSizeTexts.autoSizeText12(
                pickerAssetType == PickerAssetType.photo ? AppStrings.takeApicture : AppStrings.recordVideo,
                color: Colors.black,
              ),
              onPressed: () async {
                Get.back();
                var pic;
                switch (pickerAssetType) {
                  case PickerAssetType.photo:
                    pic = await _picker.pickImage(source: ImageSource.camera);
                    break;
                  case PickerAssetType.video:
                    pic = await _picker.pickVideo(source: ImageSource.camera);
                }

                if (pic != null) onAssetPicked(File(pic.path));
              },
            ),
            Divider(),
            TextButton(
              child: AutoSizeTexts.autoSizeText12(AppStrings.openGallery),
              onPressed: () async {
                Get.back();
                var pic;
                switch (pickerAssetType) {
                  case PickerAssetType.photo:
                    pic = await _picker.pickImage(source: ImageSource.gallery);
                    break;
                  case PickerAssetType.video:
                    pic = await _picker.pickVideo(source: ImageSource.gallery);
                }

                if (pic != null) onAssetPicked(File(pic.path));
              },
            ),
          ],
        );
      },
    );
  }
}
