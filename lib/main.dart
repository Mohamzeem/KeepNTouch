import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_n_touch/Core/App/app_injector.dart';
import 'package:keep_n_touch/Core/App/app_view.dart';
import 'package:keep_n_touch/Core/App/app_info.dart';
import 'package:keep_n_touch/Core/App/bloc_observer.dart';
import 'package:keep_n_touch/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MyApp.setSystemUi();
  await setupInjector();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = AppBlocObserver();
  runApp(const AppView());
}
