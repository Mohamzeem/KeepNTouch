import 'dart:io';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Widgets/custom_button.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';
import 'package:keep_n_touch/Core/Widgets/loading.dart';
import 'package:keep_n_touch/Core/Widgets/text_form_field.dart';
import 'package:keep_n_touch/Presentation/Chat/data/chat_data.dart';
import '../Utils/functions.dart';

class CustomFloatingButton extends StatefulWidget {
  final IconData iconData;
  final String title;
  final String label;
  final String validator;
  final String button;
  const CustomFloatingButton({
    super.key,
    required this.title,
    required this.label,
    required this.validator,
    required this.button,
    required this.iconData,
  });

  @override
  State<CustomFloatingButton> createState() => _CustomFloatingButtonState();
}

class _CustomFloatingButtonState extends State<CustomFloatingButton> {
  final controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => AppFunctions.showBtmSheet(
        context,
        [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: widget.title,
                color: AppColors.mainColor,
              ),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.qr_code_scanner_sharp,
                  color: AppColors.mainColor,
                  size: 30,
                ),
              )
            ],
          ),
          SizedBox(height: 10.h),
          CustomTextFormField(
            label: widget.label,
            maxLength: 50,
            controller: controller,
            keyBoard: TextInputType.emailAddress,
            prefixIcon: Icons.email,
          ),
          SizedBox(height: 10.h),
          CustomButton(
            onPressed: () {
              if (controller.text.isEmpty) {
                CustomLoading.toast(widget.validator);
              } else {
                ChatData.createChatRoom(
                  context: context,
                  email: controller.text.trim(),
                );
                Navigator.pop(context);
                controller.clear();
              }
            },
            text: widget.button,
            width: double.infinity,
            height: 45,
            threeRadius: 10,
            lastRadius: 10,
            backgroundColor: AppColors.mainColor,
          ),
          SizedBox(height: Platform.isIOS ? 10.h : 0.h),
        ],
      ),
      backgroundColor: AppColors.secColor,
      child: Icon(
        widget.iconData,
        color: AppColors.mainColor,
        size: 50,
      ),
    );
  }
}
