import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Widgets/custom_dialog.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';
import 'package:keep_n_touch/Presentation/Authentication/data/auth_data.dart';
import 'package:keep_n_touch/Presentation/Settings/view/widgets/settings_item.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsItem(
      onTap: () {},
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
