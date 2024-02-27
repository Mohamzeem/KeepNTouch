import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keep_n_touch/Core/App/app_view.dart';
import 'package:keep_n_touch/Core/App/app_info.dart';
import 'package:keep_n_touch/Core/Widgets/loading.dart';
import 'package:keep_n_touch/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MyApp.setSystemUi();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]).then((_) {
    runApp(const AppView());
  });
  CustomLoading();
}
