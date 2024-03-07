import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keep_n_touch/Presentation/Settings/controller/settings_controller.dart';
import 'package:keep_n_touch/Presentation/Settings/view/widgets/setting_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<SettingsController>(
        init: SettingsController(),
        builder: (controller) => const Scaffold(
          body: SettingsBody(),
        ),
      ),
    );
  }
}
