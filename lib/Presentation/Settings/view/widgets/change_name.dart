import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keep_n_touch/Core/Utils/functions.dart';
import 'package:keep_n_touch/Presentation/Settings/controller/settings_controller.dart';
import 'package:keep_n_touch/Presentation/Settings/view/widgets/settings_item.dart';

class ChangeName extends GetView<SettingsController> {
  const ChangeName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsItem(
      onTap: () => AppFunctions.showBtmSheetWithTextAndButton(
        context: context,
        controller: controller.nameController,
        title: 'Enter your new user name',
        lable: 'User Name',
        buttonText: 'Change User Name',
        sheetIcon: Icons.close,
        prefixIcon: Icons.person,
        onPressedbutton: () => controller.changeUserNameFunction(context),
        onTapSheetIcon: () => Get.back(),
      ),
      icon: Icons.person_2_outlined,
      mainText: 'User Name',
      suppText: 'You can change your User Name',
    );
  }
}
