import 'package:get_it/get_it.dart';
import 'package:keep_n_touch/Core/App/app_info.dart';
import 'package:keep_n_touch/Core/routes/app_navigation.dart';
import 'package:keep_n_touch/Presentation/Authentication/data/repo/auth_api.dart';
import 'package:keep_n_touch/Presentation/Authentication/data/repo/auth_repo_impl.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
  //~ Authentication
  sl.registerLazySingleton<AuthApi>(() => AuthApi());
  sl.registerLazySingleton<AuthRepoImpl>(() => AuthRepoImpl(api: sl()));

  //register
  // sl.registerLazySingleton<RegisterApi>(() => RegisterApi());
  // sl.registerLazySingleton<RegisterRepoImpl>(() => RegisterRepoImpl(api: sl()));
  // //! Api
  // sl.registerLazySingleton<AuthApi>(() => AuthApi());
  // sl.registerLazySingleton<ControlApi>(() => ControlApi());
  // sl.registerLazySingleton<AiSearchApi>(() => AiSearchApi(api: sl()));
  // sl.registerLazySingleton<UserProfileApi>(() => UserProfileApi());
  // sl.registerLazySingleton<CoachesSearchApi>(() => CoachesSearchApi());
  // sl.registerLazySingleton<CoachingSessionsApi>(() => CoachingSessionsApi());
  // sl.registerLazySingleton<CategoryApi>(() => CategoryApi());
  // sl.registerLazySingleton<CalenderApi>(() => CalenderApi());
  // sl.registerLazySingleton<NotificationsApi>(() => NotificationsApi());
  // sl.registerLazySingleton<RatingApi>(() => RatingApi());
  // sl.registerLazySingleton<GrowModelApi>(() => GrowModelApi());

  // //! Repository
  // sl.registerLazySingleton<AppRepo>(() => AppRepo(appLocal: sl()));
  // sl.registerLazySingleton<ControlRepoImpl>(() => ControlRepoImpl(api: sl()));
  // sl.registerLazySingleton<AuthRepoImpl>(() => AuthRepoImpl(api: sl()));
  // sl.registerLazySingleton<AiSearchRepoImpl>(
  //     () => AiSearchRepoImpl(searchApi: sl()));
  // sl.registerLazySingleton<UserProfileRepoImpl>(
  //     () => UserProfileRepoImpl(api: sl()));
  // sl.registerLazySingleton<CoachesSearchRepoImpl>(
  //     () => CoachesSearchRepoImpl(api: sl()));
  // sl.registerLazySingleton<CoachingSessionsRepoImpl>(
  //     () => CoachingSessionsRepoImpl(api: sl()));
  // sl.registerLazySingleton<CategoryRepoImpl>(() => CategoryRepoImpl(api: sl()));
  // sl.registerLazySingleton<CalenderRepoImpl>(() => CalenderRepoImpl(api: sl()));
  // sl.registerLazySingleton<NotificationsRepoImpl>(
  //     () => NotificationsRepoImpl(api: sl()));
  // sl.registerLazySingleton<RatingRepoImpl>(() => RatingRepoImpl(api: sl()));
  // sl.registerLazySingleton<GrowModelRepoImpl>(
  //     () => GrowModelRepoImpl(api: sl()));

  //! Core
  sl.registerLazySingleton(() => AppNavigation());
  sl.registerLazySingleton(() => AppConfig());

  // sl.registerLazySingleton<AppLocal>(() => AppLocal(sl()));
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton<ApiServices>(() => ApiServices(sl()));
  // sl.registerLazySingleton(() => ApiIntercepters());
  // sl.registerLazySingleton(() => LogInterceptor(
  //       request: false,
  //       requestBody: false,
  //       requestHeader: false,
  //       responseBody: false,
  //       responseHeader: false,
  //       error: false,
  //     ));
  // sl.registerLazySingleton(() => Dio());
}
