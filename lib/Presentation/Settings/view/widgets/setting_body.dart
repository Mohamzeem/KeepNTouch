import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';
import 'package:keep_n_touch/Presentation/Settings/controller/settings_controller.dart';
import 'package:keep_n_touch/Presentation/Settings/view/widgets/build_version_settings.dart';
import 'package:keep_n_touch/Presentation/Settings/view/widgets/change_image.dart';
import 'package:keep_n_touch/Presentation/Settings/view/widgets/change_name.dart';
import 'package:keep_n_touch/Presentation/Settings/view/widgets/change_password.dart';
import 'package:keep_n_touch/Presentation/Settings/view/widgets/logout.dart';
import 'package:keep_n_touch/Presentation/Settings/view/widgets/profile_image.dart';

class SettingsBody extends GetWidget<SettingsController> {
  const SettingsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //^ hello + user name
            GetBuilder<SettingsController>(
              init: SettingsController(),
              builder: (cont) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                  text: 'Hello, ${cont.newName}',
                  fontSize: 25,
                  color: AppColors.mainColor,
                ),
              ),
            ),

            SizedBox(height: 20.h),
            const ProfileImage(),
            SizedBox(height: 20.h),
            const ChangeName(),
            SizedBox(height: 5.h),
            const ChangePassword(),
            SizedBox(height: 5.h),
            const ChangeImage(),
            SizedBox(height: 5.h),
            const LogOut(),
            SizedBox(height: 5.h),
            const BuildVerison(),
          ],
        ),
      ),
    );
  }
}
