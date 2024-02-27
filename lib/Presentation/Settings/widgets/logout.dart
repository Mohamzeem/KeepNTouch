import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Widgets/custom_dialog.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';
import 'package:keep_n_touch/Presentation/Authentication/data/auth_data.dart';

class LogOut extends StatelessWidget {
  const LogOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomText(
          text: 'Log Out',
          color: AppColors.kBlack,
        ),
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
              const CustomText(
                text: 'Logout',
                fontSize: 15,
                color: AppColors.kBlack,
              ),
              SizedBox(width: 5.w),
              const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.kBlue,
                size: 15,
              )
            ],
          ),
        ),
      ],
    );
  }
}
