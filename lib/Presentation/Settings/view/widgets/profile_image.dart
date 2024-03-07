import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Widgets/custom_cached_image.dart';
import 'package:keep_n_touch/Presentation/Settings/controller/settings_controller.dart';

class ProfileImage extends GetWidget<SettingsController> {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.secColor.withOpacity(0.4),
            blurRadius: 5,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Card(
        elevation: 5,
        color: AppColors.kWhite,
        surfaceTintColor: AppColors.kWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
          side: BorderSide(color: AppColors.secColor),
        ),
        child: GetBuilder<SettingsController>(
          init: SettingsController(),
          builder: (cont) => CustomCachedImage(
            photoUrl: cont.auth.currentUser!.photoURL!,
            // photoUrl: cont.profile.photo!,
            height: 150,
            width: 150,
          ),
        ),
      ),
    );
  }
}
