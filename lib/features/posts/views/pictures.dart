import 'package:tiutiu/features/posts/widgets/card_picture.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiutiu/features/system/controllers.dart';
import 'package:tiutiu/core/constants/app_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:tiutiu/core/constants/strings.dart';
import 'package:tiutiu/Widgets/one_line_text.dart';
import 'package:tiutiu/core/utils/pickers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pictures extends StatelessWidget with Pickers {
  const Pictures({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _insertPicturesLabel(),
          _picturesList(context),
          _addPicturesButton(),
          _divider(),
          _insertVideoLabel(),
          _video(),
        ],
      ),
    );
  }

  Obx _insertPicturesLabel() {
    return Obx(
      () {
        final centralize = postsController.postPhotosQty == 1;

        return OneLineText(
          alignment: centralize ? Alignment.center : Alignment(-0.95, 1),
          text: PostFlowStrings.insertAtLeastOnePicture,
          fontWeight: FontWeight.w500,
        );
      },
    );
  }

  Expanded _picturesList(BuildContext context) {
    return Expanded(
      child: Obx(
        () => ListView.builder(
          itemCount: postsController.postPhotosQty,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemBuilder: (ctx, index) {
            return Obx(
              () {
                final photos = postsController.post.photos;
                final isEmpty = photos.isEmpty;

                return AdPicture(
                  imagePath:
                      isEmpty ? null : photos[index > 0 ? index - 1 : index],
                  color: AppColors.primary,
                  onPicturedRemoved: () {
                    postsController.removePictureOnIndex(index);
                  },
                  onAddPicture: () {
                    pickAnAsset(
                      context: context,
                      onAssetPicked: (image) {
                        postsController.addPictureOnIndex(
                          image,
                          index,
                        );
                      },
                      pickerAssetType: PickerAssetType.photo,
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  Obx _addPicturesButton() {
    return Obx(() {
      final photosIsNotEmpty = postsController.post.photos.isNotEmpty;
      final postPhotosQtyLessThan6 = postsController.postPhotosQty;

      return AnimatedOpacity(
        duration: Duration(milliseconds: 1000),
        opacity: postPhotosQtyLessThan6 < 6 && photosIsNotEmpty ? 1 : 0,
        child: Visibility(
          visible: postPhotosQtyLessThan6 < 6 && photosIsNotEmpty,
          child: TextButton.icon(
            onPressed: () {
              postsController.increasePhotosQty();
            },
            label: AutoSizeText(
              PostFlowStrings.addMorePictures,
              maxFontSize: 13,
            ),
            icon: Icon(Icons.add),
          ),
        ),
      );
    });
  }

  OneLineText _insertVideoLabel() {
    return OneLineText(
      text: PostFlowStrings.insertVideo,
      alignment: Alignment(-0.93, 1),
      fontWeight: FontWeight.w500,
    );
  }

  Container _video() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      color: Colors.black,
      height: 140.0.h,
    );
  }

  Container _divider() {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0.h),
      color: AppColors.secondary,
      width: double.infinity,
      height: .3.h,
    );
  }
}
