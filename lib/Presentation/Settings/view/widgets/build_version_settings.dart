import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keep_n_touch/Core/App/app_info.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';
import 'package:keep_n_touch/Presentation/Settings/controller/settings_controller.dart';
import 'package:keep_n_touch/Presentation/Settings/view/widgets/settings_item.dart';

class BuildVerison extends GetWidget<SettingsController> {
  const BuildVerison({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsItem(
      onTap: () {
        print('1 ${controller.newName}');
        print('2 ${controller.states.userModel.value.id}');
        print('3 ${controller.states.userModel.value.isPhoto}');
      },
      icon: Icons.verified_user_outlined,
      mainText: 'Build Verison',
      suppText: '',
      withGoIcon: false,
      widget: FutureBuilder<String>(
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
    );
  }
}
