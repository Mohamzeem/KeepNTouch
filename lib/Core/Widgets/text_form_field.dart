import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  // final String hint;
  final IconData prefixIcon;
  final Function()? suffixIconFunction;
  final bool suffixIconShow;
  final bool obscureText;
  final TextInputType keyBoard;
  final int maxLength;
  const CustomTextFormField({
    super.key,
    this.controller,
    required this.label,
    // required this.hint,
    required this.keyBoard,
    this.suffixIconShow = false,
    this.maxLength = 6,
    this.obscureText = false,
    this.suffixIconFunction,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
          BoxShadow(
            color: Colors.white,
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keyBoard,
        inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
        cursorColor: AppColors.mainColor,
        textInputAction: TextInputAction.done,
        obscureText: obscureText,
        maxLines: 1,
        style: const TextStyle(
          fontSize: 22,
          color: AppColors.kBlack,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: AppColors.mainColor,
          ),
          suffixIcon: suffixIconShow
              ? InkWell(
                  onTap: suffixIconFunction,
                  child: obscureText
                      ? const Icon(
                          Icons.visibility_off,
                          color: AppColors.mainColor,
                        )
                      : const Icon(
                          Icons.visibility,
                          color: AppColors.mainColor,
                        ))
              : const SizedBox(),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
          label: CustomText(
            text: label,
            color: AppColors.kGrey,
            fontSize: 20,
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: AppColors.kGrey)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: AppColors.kGrey)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: AppColors.mainColor)),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: AppColors.mainColor)),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: AppColors.mainColor)),
        ),
      ),
    );
  }
}
