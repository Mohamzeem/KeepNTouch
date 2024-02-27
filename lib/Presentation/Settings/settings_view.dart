import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/Widgets/custom_button.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';
import 'package:keep_n_touch/Presentation/Authentication/data/auth_data.dart';
import 'package:keep_n_touch/Presentation/Settings/widgets/build_version_settings.dart';
import 'package:keep_n_touch/Presentation/Settings/widgets/logout.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ListView(
        children: [
          const Center(child: CustomText(text: 'SettingsView')),
          SizedBox(height: 100.h),
          Center(
            child: CustomText(
                text:
                    'Hello, ${FirebaseAuth.instance.currentUser!.displayName}'),
          ),
          SizedBox(height: 20.h),
          const LogOut(),
          SizedBox(height: 20.h),
          const BuildVerison(),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
