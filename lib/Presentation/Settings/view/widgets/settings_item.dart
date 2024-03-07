import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';

class SettingsItem extends StatelessWidget {
  final String mainText;
  final String suppText;
  final IconData icon;
  final bool withGoIcon;
  final void Function() onTap;
  final Widget? widget;
  const SettingsItem({
    super.key,
    required this.mainText,
    required this.suppText,
    required this.icon,
    this.withGoIcon = true,
    required this.onTap,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 60,
        child: Card(
          surfaceTintColor: Colors.transparent,
          elevation: 5,
          color: AppColors.secColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 30,
                  color: AppColors.mainColor,
                ),
                SizedBox(width: 10.w),
                withGoIcon
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: mainText,
                            fontSize: 22,
                            color: AppColors.mainColor,
                          ),
                          CustomText(
                            text: suppText,
                            fontSize: 16,
                            color: AppColors.kGrey,
                          ),
                        ],
                      )
                    : CustomText(
                        text: mainText,
                        fontSize: 22,
                        color: AppColors.mainColor,
                      ),
                const Spacer(),
                withGoIcon
                    ? Row(
                        children: [
                          SizedBox(width: 5.w),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.mainColor,
                            size: 25,
                          )
                        ],
                      )
                    : widget!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
