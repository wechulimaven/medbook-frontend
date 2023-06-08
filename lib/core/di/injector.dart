import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/signup/signup_cubit.dart';
import '../local_storage/shared_preference_helper.dart';
import '../network/api_provider.dart';
import '../network/dio_client.dart';
import '../network/interceptors/auth_interceptor.dart';
import '../repository/user_repository.dart';

GetIt inject = GetIt.instance;

Future<void> setUpLocator() async {
  // local
  final preferences = await SharedPreferences.getInstance();
  inject.registerLazySingleton(() => preferences);
  inject.registerSingleton<SharedHelper>(
      SharedHelperImpl(sharedPreferences: inject()));

  inject.registerLazySingleton(
    () => AuthInterceptor(
      inject(),
    ),
  );
  inject.registerLazySingleton(() => inject<DioClient>().dio);
  inject.registerLazySingleton<ApiProvider>(
    () => ApiProvider(
      dio: inject(),
    ),
  );
  inject.registerLazySingleton<DioClient>(
    () => DioClient(
      inject(),
      inject(),
      inject(),
    ),
  );

  inject.registerLazySingleton<PatientRepository>(() =>
      PatientRepositoryImpl(apiProvider: inject(), sharedHelper: inject()));

// //   // blocs
  inject.registerFactory<SignupCubit>(
      () => SignupCubit(userRepository: inject()));
}
