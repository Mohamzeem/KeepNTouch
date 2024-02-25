import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/App/app_bloc_providers.dart';
import 'package:keep_n_touch/Core/App/app_info.dart';
import 'package:keep_n_touch/Core/App/app_injector.dart';
import 'package:keep_n_touch/Core/Utils/app_theme.dart';
import 'package:keep_n_touch/Core/routes/app_navigation.dart';
import 'package:keep_n_touch/Core/routes/app_routes.dart';
import 'package:keep_n_touch/Presentation/Authentication/view/auth_page_view.dart';

class AppView extends StatelessWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProvider,
      child: ScreenUtilInit(
        designSize: AppConfig().designSize,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: MyApp.appName,
              theme: appTheme(),
              navigatorKey: sl.get<AppNavigation>().navigatorKey,
              onGenerateRoute: AppRouter.onGenerateRoute,
              home: const AuthPageView(),
            ),
          );
        },
      ),
    );
  }
}
