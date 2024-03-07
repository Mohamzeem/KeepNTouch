import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keep_n_touch/Core/Utils/functions.dart';
import 'package:keep_n_touch/Presentation/Settings/controller/settings_controller.dart';
import 'package:keep_n_touch/Presentation/Settings/view/widgets/settings_item.dart';

class ChangePassword extends GetView<SettingsController> {
  const ChangePassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsItem(
      onTap: () => AppFunctions.showBtmSheetWithTextAndButton(
        context: context,
        controller: controller.passwordController,
        title: 'Enter your new password',
        lable: 'Password',
        buttonText: 'Change User Name',
        sheetIcon: Icons.close,
        prefixIcon: Icons.lock,
        onPressedbutton: () => controller.changeUserNameFunction(context),
        onTapSheetIcon: () => Get.back(),
      ),
      icon: Icons.lock_outline,
      mainText: 'Password',
      suppText: 'You can change your password with new one',
    );
  }
}
