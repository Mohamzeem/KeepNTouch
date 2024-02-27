import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';

class SettingsItem extends StatelessWidget {
  final Widget child;
  final void Function() onTap;
  const SettingsItem({
    super.key,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 60,
        child: Card(
          elevation: 5,
          color: AppColors.secColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: child,
          ),
        ),
      ),
    );
  }
}
