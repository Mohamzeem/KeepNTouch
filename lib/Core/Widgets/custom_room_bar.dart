import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Widgets/custom_cached_image.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';

class CustomRoomBar extends StatelessWidget {
  final String title;
  final String photoUrl;
  final bool isGroup;
  final String names;
  final void Function() onTap;
  const CustomRoomBar({
    Key? key,
    required this.title,
    required this.photoUrl,
    this.isGroup = false,
    required this.names,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          //^ title
          InkWell(
            onTap: onTap,
            child: Column(
              children: [
                CustomText(
                  text: title,
                  fontSize: 25,
                  color: AppColors.mainColor,
                ),
                isGroup
                    ? SizedBox(
                        width: 260.w,
                        child: CustomText(
                          textAlign: TextAlign.center,
                          text: names,
                          fontSize: 16,
                          color: AppColors.kGrey,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          //^ image
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: CustomCachedImage(
              height: 45,
              width: 45,
              photoUrl: photoUrl,
            ),
          )
        ],
      ),
    );
  }
}
