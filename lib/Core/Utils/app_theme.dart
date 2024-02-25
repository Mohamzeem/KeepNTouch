import 'package:flutter/material.dart';
import 'package:keep_n_touch/Core/App/app_info.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.kWhite,
    useMaterial3: false,
    fontFamily: MyApp.appFont,
  );
}
