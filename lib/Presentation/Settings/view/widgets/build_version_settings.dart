import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/App/app_info.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';
import 'package:keep_n_touch/Presentation/Settings/view/widgets/settings_item.dart';

class BuildVerison extends StatelessWidget {
  const BuildVerison({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsItem(
      onTap: () {},
      child: Row(
        children: [
          const Icon(
            Icons.verified_user_outlined,
            size: 30,
            color: AppColors.mainColor,
          ),
          SizedBox(width: 10.w),
          const CustomText(
            text: 'Build Verison',
            color: AppColors.mainColor,
            fontSize: 22,
          ),
          const Spacer(),
          FutureBuilder<String>(
            future: AppInfoUtil().getAppVersion(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CustomText(
                  text: snapshot.data.toString(),
                  fontSize: 18,
                  color: AppColors.kGrey,
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
