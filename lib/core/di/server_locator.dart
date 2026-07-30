import 'package:dio/dio.dart';
import 'package:doc_doc/core/cache/cache_helper.dart';
import 'package:doc_doc/core/networking/api_service.dart';
import 'package:doc_doc/core/networking/dio_factory.dart';
import 'package:doc_doc/features/auth/login/domain/login_repo.dart';
import 'package:doc_doc/features/auth/login/data/repo/login_repo_impl.dart';
import 'package:doc_doc/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:doc_doc/features/auth/signup/domain/signup_repo.dart';
import 'package:doc_doc/features/auth/signup/data/repository/signuo_repo_impl.dart';
import 'package:doc_doc/features/auth/signup/presentation/cubit/signup_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // cach
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => prefs);
  getIt.registerLazySingleton<CacheHelper>(
    () => CacheHelper(sharedPreferences: getIt<SharedPreferences>()),
  );
  // Dio & ApiService
  Dio dio = await DioFactory.getDio();

  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // feature / Login
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));

  // feature / signUp
  getIt.registerLazySingleton<SignupRepo>(
    () => SignupRepoImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt<SignupRepo>()));
}
