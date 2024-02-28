import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Utils/functions.dart';
import 'package:keep_n_touch/Core/Widgets/custom_button.dart';
import 'package:keep_n_touch/Core/Widgets/custom_dialog.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';
import 'package:keep_n_touch/Core/Widgets/loading.dart';
import 'package:keep_n_touch/Core/Widgets/text_form_field.dart';
import 'package:keep_n_touch/Presentation/Authentication/data/auth_data.dart';
import 'package:keep_n_touch/Presentation/Settings/data/settings_data.dart';
import 'package:keep_n_touch/Presentation/Settings/view/widgets/settings_item.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({
    super.key,
  });

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SettingsItem(
      onTap: () => AppFunctions.showBtmSheet(
        context,
        [
          const CustomText(
            text: 'Enter your new password',
            color: AppColors.mainColor,
          ),
          SizedBox(height: 10.h),
          CustomTextFormField(
            label: 'Password',
            maxLength: 6,
            controller: passwordController,
            keyBoard: TextInputType.name,
            prefixIcon: Icons.person,
          ),
          SizedBox(height: 10.h),
          CustomButton(
            onPressed: () {
              if (passwordController.text.isEmpty) {
                CustomLoading.toast('Please enter a your password');
              } else {
                SettingsData.changePassword(
                    password: passwordController.text, context);
                Navigator.pop(context);
                passwordController.clear();
              }
            },
            text: 'Change Password',
            width: double.infinity,
            height: 45,
            threeRadius: 10,
            lastRadius: 10,
            backgroundColor: AppColors.mainColor,
          ),
          SizedBox(height: Platform.isIOS ? 10.h : 0.h),
        ],
      ),
      child: Row(
        children: [
          const Icon(
            Icons.lock_outline,
            size: 30,
            color: AppColors.mainColor,
          ),
          SizedBox(width: 10.w),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Password',
                fontSize: 22,
                color: AppColors.mainColor,
              ),
              CustomText(
                text: 'You can change your password with new one',
                fontSize: 16,
                color: AppColors.kGrey,
              ),
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              CustomDialog.twoButtonDialog(
                context: context,
                textBody: 'You want to log out',
                textButton1: 'Yes',
                textButton2: 'No',
                onPressed: () {
                  AuthData.signOut(context: context);
                },
              );
            },
            child: Row(
              children: [
                SizedBox(width: 5.w),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.mainColor,
                  size: 25,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
