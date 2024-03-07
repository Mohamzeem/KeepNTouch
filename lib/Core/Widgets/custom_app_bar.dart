import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Widgets/custom_cached_image.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';

class CustomAppBar extends StatefulWidget {
  final String title;
  final String photoUrl;
  final String searchLabel;
  final void Function() onTap;
  final bool isLeftPhoto;
  const CustomAppBar({
    Key? key,
    required this.title,
    required this.onTap,
    this.isLeftPhoto = true,
    required this.photoUrl,
    required this.searchLabel,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final controller = TextEditingController();
  bool isSearch = false;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.isLeftPhoto
              ? CustomCachedImage(
                  height: 45,
                  width: 45,
                  photoUrl: widget.photoUrl,
                )
              : InkWell(
                  onTap: () {
                    Get.back();
                    controller.clear();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: AppColors.mainColor,
                  )),
          isSearch
              ? Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 5.w),
                    child: TextFormField(
                      controller: controller,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 20,
                        color: AppColors.kBlack,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: widget.onTap,
                          child: const Icon(
                            FluentIcons.search_12_regular,
                            color: AppColors.kGrey,
                          ),
                        ),
                        label: CustomText(
                          text: widget.searchLabel,
                          color: AppColors.kGrey,
                          fontSize: 20,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 0.h, horizontal: 10.w),
                        border: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.5, color: AppColors.kGrey),
                        ),
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 0.5, color: AppColors.kGrey)),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 0.5, color: AppColors.mainColor),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 0.5, color: AppColors.mainColor),
                        ),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 0.5, color: AppColors.mainColor),
                        ),
                      ),
                    ),
                  ),
                )
              : CustomText(
                  text: widget.title,
                  fontSize: 28,
                  color: AppColors.mainColor,
                  textAlign: TextAlign.center,
                ),
          InkWell(
            onTap: () {
              setState(() {
                isSearch = !isSearch;
              });
            },
            child: Icon(
              !isSearch ? FluentIcons.search_24_regular : Icons.close,
              color: AppColors.mainColor,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
