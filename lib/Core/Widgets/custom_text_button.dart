import 'package:flutter/material.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextDecoration? underline;
  final double? fontSize;
  final Color? color;
  const CustomTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.underline = TextDecoration.underline,
    this.fontSize = 24,
    this.color = AppColors.mainColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: CustomText(
        text: text,
        fontSize: fontSize,
        textDecoration: underline,
        color: color,
      ),
    );
  }
}
