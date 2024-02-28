import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Widgets/custom_dialog.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';
import 'package:keep_n_touch/Presentation/Authentication/data/auth_data.dart';
import 'package:keep_n_touch/Presentation/Settings/view/widgets/settings_item.dart';

class LogOut extends StatelessWidget {
  const LogOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsItem(
      onTap: () async => CustomDialog.twoButtonDialog(
        context: context,
        textBody: 'You want to log out',
        textButton1: 'Yes',
        textButton2: 'No',
        onPressed: () {
          AuthData.signOut(context: context);
        },
      ),
      child: Row(
        children: [
          const Icon(
            Icons.logout_outlined,
            size: 30,
            color: AppColors.mainColor,
          ),
          SizedBox(width: 10.w),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Log Out',
                fontSize: 22,
                color: AppColors.mainColor,
              ),
              CustomText(
                text: 'You can log out',
                fontSize: 16,
                color: AppColors.kGrey,
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              SizedBox(width: 5.w),
              const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.mainColor,
                size: 25,
              )
            ],
          ),
        ],
      ),
    );
  }
}
