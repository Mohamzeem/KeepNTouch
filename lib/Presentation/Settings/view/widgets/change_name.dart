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

class ChangeName extends StatefulWidget {
  const ChangeName({
    super.key,
  });

  @override
  State<ChangeName> createState() => _ChangeNameState();
}

class _ChangeNameState extends State<ChangeName> {
  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SettingsItem(
      onTap: () => AppFunctions.showBtmSheet(
        context,
        [
          const CustomText(
            text: 'Enter your new user name',
            color: AppColors.mainColor,
          ),
          SizedBox(height: 10.h),
          CustomTextFormField(
            label: 'User Name',
            maxLength: 50,
            controller: nameController,
            keyBoard: TextInputType.name,
            prefixIcon: Icons.person,
          ),
          SizedBox(height: 10.h),
          CustomButton(
            onPressed: () {
              if (nameController.text.isEmpty) {
                CustomLoading.toast('Please enter a your user name');
              } else {
                SettingsData.changeUser(userName: nameController.text);
                Navigator.pop(context);
                nameController.clear();
              }
            },
            text: 'Change User Name',
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
            Icons.person_2_outlined,
            size: 30,
            color: AppColors.mainColor,
          ),
          SizedBox(width: 10.w),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'User Name',
                fontSize: 22,
                color: AppColors.mainColor,
              ),
              CustomText(
                text: 'You can change your User Name',
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
