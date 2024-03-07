import 'package:flutter/material.dart';
import 'package:keep_n_touch/Presentation/Settings/view/widgets/setting_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: SettingsBody(),
    ));
  }
}
