import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';

class CustomLoading {
  CustomLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 40.0
      ..lineWidth = 2
      ..radius = 10.0
      ..progressColor = AppColors.kBlack
      ..backgroundColor = AppColors.mainColor
      ..indicatorColor = AppColors.kBlack
      ..textColor = AppColors.kBlack
      ..maskColor = Colors.black.withOpacity(0.6)
      ..userInteractions = true
      ..dismissOnTap = true
      ..fontSize = 20
      ..maskType = EasyLoadingMaskType.custom;
  }

  static void show({String? text}) {
    EasyLoading.instance.userInteractions = true;
    EasyLoading.show(status: text ?? 'Loading...');
  }

  static void toast(
      {required String text, EasyLoadingToastPosition? toastPosition}) {
    EasyLoading.showToast(
      text,
      dismissOnTap: true,
      maskType: EasyLoadingMaskType.none,
      toastPosition: toastPosition,
    );
  }

  static void dismiss() {
    EasyLoading.instance.userInteractions = true;
    EasyLoading.dismiss();
  }
}
