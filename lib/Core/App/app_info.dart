import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:package_info_plus/package_info_plus.dart';

class MyApp {
  MyApp._();
  // static AppNavigation get navigation => sl.get<AppNavigation>();
  // static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // static BuildContext get context =>
  //     sl.get<AppNavigation>().navigatorKey.currentContext!;

  // static AppConfig get config => sl.get<AppConfig>();

  static String appName = 'Call Me';
  static String appFont = 'MouseMemoirs';

//~ appbar states
  static void setSystemUi() {
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        statusBarColor: AppColors.kWhite,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}

//~ screen utiles size
class AppConfig {
  AppConfig();
  final Size designSize = const Size(411.42857142857144, 867.4285714285714);
}

//~ to get system app info and app version build
class AppInfoUtil {
  Future<String> getAppVersion(BuildContext context) async {
    String buildNumberText = "";
    var packageInfo = await PackageInfo.fromPlatform();
    buildNumberText = '${packageInfo.version} (${packageInfo.buildNumber})';
    return buildNumberText;
  }
}
