import 'package:flutter/material.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import '../../../../Core/Utils/functions.dart';

class CustomFloatingButton extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String lable;
  final String buttonText;
  final IconData sheetIcon;
  final IconData prefixIcon;
  final IconData floatingIcon;
  final void Function() onPressedbutton;
  final void Function() onTapSheetIcon;
  const CustomFloatingButton({
    Key? key,
    required this.controller,
    required this.title,
    required this.lable,
    required this.buttonText,
    required this.sheetIcon,
    required this.prefixIcon,
    required this.onPressedbutton,
    required this.onTapSheetIcon,
    required this.floatingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => AppFunctions.showBtmSheetWithTextAndButton(
          context: context,
          controller: controller,
          title: title,
          lable: lable,
          buttonText: buttonText,
          sheetIcon: sheetIcon,
          prefixIcon: prefixIcon,
          onPressedbutton: onPressedbutton,
          onTapSheetIcon: onTapSheetIcon),
      backgroundColor: AppColors.secColor,
      child: Icon(
        floatingIcon,
        color: AppColors.mainColor,
        size: 50,
      ),
    );
  }
}
