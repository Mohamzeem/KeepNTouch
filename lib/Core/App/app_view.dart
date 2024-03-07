import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:keep_n_touch/Core/App/app_info.dart';
import 'package:keep_n_touch/Core/Utils/app_theme.dart';
import 'package:keep_n_touch/Core/routes/app_pages.dart';
import 'package:keep_n_touch/Core/routes/app_routes.dart';
import 'package:keep_n_touch/Core/App/app_bindings.dart';

class AppView extends StatelessWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppConfig().designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: GetMaterialApp(
            builder: EasyLoading.init(),
            debugShowCheckedModeBanner: false,
            title: MyApp.appName,
            theme: appTheme(),
            defaultTransition: Transition.zoom,
            transitionDuration: const Duration(milliseconds: 300),
            initialRoute: AppRoute.initial,
            initialBinding: AppBinding(),
            getPages: AppPages.routes,
          ),
        );
      },
    );
  }
}
