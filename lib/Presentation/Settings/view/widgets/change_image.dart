import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:keep_n_touch/Presentation/Settings/controller/settings_controller.dart';
import 'package:keep_n_touch/Presentation/Settings/view/widgets/settings_item.dart';

class ChangeImage extends GetWidget<SettingsController> {
  const ChangeImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsItem(
      onTap: () => controller.setProfileImage(
          userId: FirebaseAuth.instance.currentUser!.uid),
      icon: Icons.camera_alt_outlined,
      mainText: 'Change Image',
      suppText: 'You can change your image',
    );
  }
}
