import 'package:flutter/material.dart';
import 'package:keep_n_touch/Core/App/app_info.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';

class BuildVerison extends StatelessWidget {
  const BuildVerison({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomText(
          text: 'Build Verison',
          color: AppColors.kBlack,
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
    );
  }
}
