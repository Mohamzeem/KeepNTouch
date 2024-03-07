import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Presentation/Settings/controller/settings_controller.dart';

class ProfileImage extends GetWidget<SettingsController> {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      init: SettingsController(),
      builder: (cont) => Container(
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
          child: CachedNetworkImage(
            imageUrl: cont.newPhoto,
            width: 150.w,
            height: 150.h,
            fit: BoxFit.fill,
            imageBuilder: (context, imageProvider) => Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // border: Border.all(width: 0.5, color: AppColors.mainColor),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
              size: 40,
              color: AppColors.kRed,
            ),
          ),
        ),
      ),
    );
  }
}
