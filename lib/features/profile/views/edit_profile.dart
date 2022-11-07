import 'package:tiutiu/features/tiutiu_user/model/tiutiu_user.dart';
import 'package:tiutiu/core/widgets/default_basic_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiutiu/core/constants/images_assets.dart';
import 'package:tiutiu/features/system/controllers.dart';
import 'package:tiutiu/core/constants/text_styles.dart';
import 'package:tiutiu/Widgets/column_button_bar.dart';
import 'package:tiutiu/core/constants/app_colors.dart';
import 'package:tiutiu/Widgets/load_dark_screen.dart';
import 'package:tiutiu/Widgets/underline_text.dart';
import 'package:tiutiu/Widgets/avatar_profile.dart';
import 'package:tiutiu/core/constants/strings.dart';
import 'package:tiutiu/core/utils/validators.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatefulWidget {
  EditProfile({
    this.isCompletingProfile = false,
    this.isEditingProfile = false,
  });

  final bool isCompletingProfile;
  final bool isEditingProfile;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TiutiuUser previousUser;

  @override
  void initState() {
    previousUser = tiutiuUserController.tiutiuUser;
    phoneNumberController.text = previousUser.phoneNumber ?? '';
    nameController.text = previousUser.displayName ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.isEditingProfile
        ? MyProfileStrings.editProfile
        : widget.isCompletingProfile
            ? MyProfileStrings.completeProfile
            : tiutiuUserController.tiutiuUser.displayName ?? '';

    return WillPopScope(
      onWillPop: () async {
        profileController.isSetting = false;
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: DefaultBasicAppBar(
            automaticallyImplyLeading: false,
            text: title,
          ),
          body: Form(
            key: _formKey,
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(8.0),
                height: Get.height,
                child: Stack(
                  children: [
                    Card(
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0.h),
                      ),
                      child: _cardContent(context),
                    ),
                    _loadingWidget()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _cardContent(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            _backgroundImage(),
            Positioned(
              right: 52.0,
              left: 52.0,
              top: 0.0.h,
              child: _roundedPicture(),
            ),
            Positioned(
              child: _errorImageNull(),
              right: 96.0.h,
              left: 96.0.h,
              top: 132.0.h,
            ),
          ],
        ),
        Container(
          height: Get.height / 2,
          margin: EdgeInsets.only(left: 8.0.w, top: 16.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              _userName(),
              Spacer(),
              _userPhoneNumber(),
              Spacer(),
              _buttons(context),
            ],
          ),
        )
      ],
    );
  }

  Widget _roundedPicture() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0.h),
      alignment: Alignment.center,
      child: Obx(
        () => AvatarProfile(
          hero: 'null',
          onAssetPicked: (file) {
            tiutiuUserController.updateTiutiuUser(
              TiutiuUserEnum.avatar,
              file,
            );
          },
          avatarPath: tiutiuUserController.tiutiuUser.avatar,
          radius: Get.width / 6,
          onAssetRemoved: () {
            tiutiuUserController.updateTiutiuUser(
              TiutiuUserEnum.avatar,
              null,
            );
          },
          viewOnly: false,
        ),
      ),
    );
  }

  Widget _errorImageNull() {
    return Obx(
      () => Visibility(
        visible: profileController.showErrorEmptyPic,
        child: AutoSizeTexts.autoSizeText16(
          MyProfileStrings.insertAPicture,
          fontWeight: FontWeight.w600,
          color: AppColors.danger,
        ),
      ),
    );
  }

  Opacity _backgroundImage() {
    return Opacity(
      opacity: .3,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12.0.h),
          topLeft: Radius.circular(12.0.h),
        ),
        child: Container(
          height: Get.width / 2,
          width: double.infinity,
          child: ClipRRect(
            child: Image.asset(
              ImageAssets.bones2,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }

  Widget _userName() {
    return UnderlineInputText(
      labelText: MyProfileStrings.howCallYou,
      validator: Validators.verifyEmpty,
      controller: nameController,
      fontSizeLabelText: 16.0.h,
      readOnly: false,
    );
  }

  Widget _userPhoneNumber() {
    return Column(
      children: [
        SizedBox(height: 16.0.h),
        UnderlineInputText(
          validator: (value) => Validators.verifyLength(value, length: 12, field: 'Telefone'),
          labelText: MyProfileStrings.whatsapp,
          keyboardType: TextInputType.number,
          controller: phoneNumberController,
          fontSizeLabelText: 16.0.h,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            TelefoneInputFormatter(),
          ],
        ),
      ],
    );
  }

  Widget _buttons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: ColumnButtonBar(
        onPrimaryPressed: () {
          if (_formIsValid()) {
            profileController.showErrorEmptyPic = false;
            FocusScope.of(context).unfocus();
            profileController.save().then((_) => profileController.isSetting = false);
          } else if (tiutiuUserController.tiutiuUser.avatar == null) {
            profileController.showErrorEmptyPic = true;
          }
        },
        onSecondaryPressed: () {
          tiutiuUserController.resetUserWithThisUser(user: previousUser);
          profileController.isSetting = false;
        },
      ),
    );
  }

  Widget _loadingWidget() {
    return Obx(
      () => LoadDarkScreen(
        message: MyProfileStrings.updatingProfile,
        visible: tiutiuUserController.isLoading,
        roundeCorners: true,
      ),
    );
  }

  bool _formIsValid() {
    return _formKey.currentState!.validate() && tiutiuUserController.tiutiuUser.avatar != null;
  }
}
