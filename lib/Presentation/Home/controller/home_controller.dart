import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';

class HomeController extends GetxController {
  List<Widget> icons = const [
    Icon(
      FluentIcons.chat_32_regular,
      color: AppColors.mainColor,
      size: 27,
    ),
    Icon(
      FluentIcons.chat_multiple_32_regular,
      color: AppColors.mainColor,
      size: 27,
    ),
    Icon(
      FluentIcons.book_contacts_32_regular,
      color: AppColors.mainColor,
      size: 27,
    ),
    Icon(
      FluentIcons.settings_24_regular,
      color: AppColors.mainColor,
      size: 27,
    ),
  ];
  int index = 0;
}
