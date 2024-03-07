import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Widgets/custom_button.dart';
import 'package:keep_n_touch/Core/Widgets/custom_snack_bar.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';
import 'package:keep_n_touch/Core/Widgets/text_form_field.dart';

class AppFunctions {
  AppFunctions._();

  static Future<dynamic> showBtmSheet(
      {required bool isDismissible,
      required BuildContext context,
      required List<Widget> body}) {
    return showModalBottomSheet(
      useSafeArea: true,
      barrierColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: isDismissible,
      elevation: 10,
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              color: AppColors.secColor,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                shrinkWrap: true,
                children: body,
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<dynamic> showBtmSheetWithTextAndButton({
    required BuildContext context,
    required TextEditingController controller,
    required String title,
    required String lable,
    required String buttonText,
    required IconData sheetIcon,
    required IconData prefixIcon,
    required void Function() onPressedbutton,
    required void Function() onTapSheetIcon,
  }) async {
    AppFunctions.showBtmSheet(
      isDismissible: true,
      context: context,
      body: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: title,
              color: AppColors.mainColor,
            ),
            InkWell(
              onTap: onTapSheetIcon,
              child: Icon(
                sheetIcon,
                color: AppColors.mainColor,
                size: 30,
              ),
            )
          ],
        ),
        SizedBox(height: 10.h),
        CustomTextFormField(
          label: lable,
          maxLength: 50,
          controller: controller,
          keyBoard: TextInputType.emailAddress,
          prefixIcon: prefixIcon,
        ),
        SizedBox(height: 10.h),
        CustomButton(
          onPressed: onPressedbutton,
          text: buttonText,
          width: double.infinity,
          height: 45,
          threeRadius: 10,
          lastRadius: 10,
          backgroundColor: AppColors.mainColor,
        ),
        SizedBox(height: Platform.isIOS ? 10.h : 0.h),
      ],
    );
  }

  static bool validateCredentials(BuildContext context, String? email) {
    String msg = '';
    if (email == null || email.isEmpty) {
      CustomSnackBar.showErrorSnackBar(
          context: context, message: 'Please enter email');
      return false;
    } else if (email.contains(' ')) {
      CustomSnackBar.showErrorSnackBar(
          context: context, message: 'Email should not contain spaces');
      return false;
    }
    CustomSnackBar.showErrorSnackBar(context: context, message: msg);

    // var status = validateEmail(email);
    // if (!status) {
    //   CustomSnackBar.showErrorSnackBar(
    //       context: context, message: 'Please enter a valid email id');
    //   return false;
    // }
    return true;
  }

  static bool validateEmail(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    var status = regExp.hasMatch(email);
    return status;
  }
}
