import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';

class CustomDetailsBar extends StatelessWidget {
  final String photoUrl;
  final bool isGroup;
  final void Function() onTapDots;
  const CustomDetailsBar({
    Key? key,
    required this.photoUrl,
    this.isGroup = false,
    required this.onTapDots,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //^ arrow back
          InkWell(
            onTap: () => Get.back(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: const Icon(
                Icons.arrow_back_ios,
                size: 30,
                color: AppColors.mainColor,
              ),
            ),
          ),
          //^ photo
          InkWell(
            onTap: () {},
            child: CachedNetworkImage(
              imageUrl: photoUrl,
              fit: BoxFit.fill,
              imageBuilder: (context, imageProvider) => Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // border: Border.all(width: 0.5, color: AppColors.mainColor),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
                child: const Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    FluentIcons.camera_16_regular,
                    color: AppColors.kBlack,
                    size: 30,
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
          //^ more icon
          InkWell(
            onTap: onTapDots,
            child: const Icon(
              FluentIcons.more_vertical_20_filled,
              color: AppColors.mainColor,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
