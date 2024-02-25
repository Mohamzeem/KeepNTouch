import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Widgets/custom_circular_loading.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double width;
  final double height;
  final double? threeRadius;
  final double? lastRadius;
  final double? fontSize;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isLoading;
  final TextAlign? textAlign;
  final double? loadingWidth;
  final double? loadingHeight;
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.width,
    required this.height,
    this.lastRadius,
    this.threeRadius,
    this.fontSize = 20,
    this.backgroundColor,
    this.textColor,
    this.textAlign,
    this.isLoading = false,
    this.loadingWidth = 25,
    this.loadingHeight = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: width.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.kBlack,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(threeRadius ?? 20),
              topRight: Radius.circular(threeRadius ?? 20),
              bottomRight: Radius.circular(threeRadius ?? 20),
              bottomLeft: Radius.circular(lastRadius ?? 0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: isLoading
            ? CustomCircularLoading(
                color: AppColors.kWhite,
                height: loadingHeight!,
                width: loadingWidth!,
                strokeWidth: 3,
              )
            : CustomText(
                fontSize: fontSize,
                text: text,
                color: textColor ?? AppColors.kWhite,
                textAlign: textAlign,
              ),
      ),
    );
  }
}
