// import 'package:get_it/get_it.dart';
// import 'package:keep_n_touch/Core/App/app_info.dart';
// import 'package:keep_n_touch/Core/routes/app_navigation.dart';
// import 'package:keep_n_touch/Presentation/Authentication/data/repo/auth_api.dart';
// import 'package:keep_n_touch/Presentation/Authentication/data/repo/auth_repo_impl.dart';

// final sl = GetIt.instance;

// Future<void> setupInjector() async {
//   //~ Authentication
//   sl.registerLazySingleton<AuthApi>(() => AuthApi());
//   sl.registerLazySingleton<AuthRepoImpl>(() => AuthRepoImpl(api: sl()));

//   //register
//   // sl.registerLazySingleton<RegisterApi>(() => RegisterApi());
//   // sl.registerLazySingleton<RegisterRepoImpl>(() => RegisterRepoImpl(api: sl()));
//   // //! Api
//   // sl.registerLazySingleton<AuthApi>(() => AuthApi());
//   // sl.registerLazySingleton<ControlApi>(() => ControlApi());
//   // sl.registerLazySingleton<AiSearchApi>(() => AiSearchApi(api: sl()));

//   // //! Repository
//   // sl.registerLazySingleton<AppRepo>(() => AppRepo(appLocal: sl()));
//   // sl.registerLazySingleton<ControlRepoImpl>(() => ControlRepoImpl(api: sl()));
//   // sl.registerLazySingleton<AuthRepoImpl>(() => AuthRepoImpl(api: sl()));



//   //! Core
//   sl.registerLazySingleton(() => AppNavigation());
//   sl.registerLazySingleton(() => AppConfig());


// }
