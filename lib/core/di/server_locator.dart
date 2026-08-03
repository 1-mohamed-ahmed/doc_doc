import 'package:dio/dio.dart';
import 'package:doc_doc/core/cache/cache_helper.dart';
import 'package:doc_doc/core/networking/api_service.dart';
import 'package:doc_doc/core/networking/dio_factory.dart';
import 'package:doc_doc/features/auth/login/data/apiService/firebase_login_service.dart';
import 'package:doc_doc/features/auth/login/data/repo/firebase_login_repo_impl.dart';
import 'package:doc_doc/features/auth/login/domain/login_repo.dart';
import 'package:doc_doc/features/auth/login/data/repo/login_repo_impl.dart';
import 'package:doc_doc/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:doc_doc/features/auth/signup/data/dataSource/firebase_signup_service.dart';
import 'package:doc_doc/features/auth/signup/data/repository/firebase_signup_repo_impl.dart';
import 'package:doc_doc/features/auth/signup/domain/signup_repo.dart';
import 'package:doc_doc/features/auth/signup/data/repository/signuo_repo_impl.dart';
import 'package:doc_doc/features/auth/signup/logic/cubit/signup_cubit.dart';
import 'package:doc_doc/features/home/data/apiService/home_api_service.dart';
import 'package:doc_doc/features/home/data/repository/home_repo.dart';
import 'package:doc_doc/features/home/data/repository/home_repo_impl.dart';
import 'package:doc_doc/features/home/logic/home_cubit.dart';
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
  // Dio & ApiService & FirebaseLoginService & FirebaseSignupService
  Dio dio = await DioFactory.getDio();

  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<FirebaseLoginService>(
    () => FirebaseLoginService(),
  );
  getIt.registerLazySingleton<FirebaseSignupService>(
    () => FirebaseSignupService(),
  );

  // feature / Login
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<FirebaseLoginRepo>(
    () => FirebaseLoginRepoImpl(
      firebaseLoginService: getIt<FirebaseLoginService>(),
    ),
  );
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(
      firebaseLoginRepo: getIt<FirebaseLoginRepo>(),
      loginRepo: getIt<LoginRepo>(),
    ),
  );

  // feature / signUp
  getIt.registerLazySingleton<SignupRepo>(
    () => SignupRepoImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<FirebaseSignupRepo>(
    () => FirebaseSignupRepoImpl(
      firebaseSignupService: getIt<FirebaseSignupService>(),
    ),
  );
  getIt.registerFactory<SignupCubit>(
    () => SignupCubit(
      firebaseSignupRepo: getIt<FirebaseSignupRepo>(),
      signupRepo: getIt<SignupRepo>(),
    ),
  );

  // feature / Home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(homeApiService: getIt<HomeApiService>()),
  );
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));
}
