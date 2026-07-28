import 'package:dio/dio.dart';
import 'package:doc_doc/core/cache/cache_helper.dart';
import 'package:doc_doc/core/api/api_constants.dart';
import 'package:doc_doc/core/networking/api_consuemr.dart';
import 'package:doc_doc/core/networking/api_interceptors.dart';
import 'package:doc_doc/core/networking/dio_consumer.dart';
import 'package:doc_doc/features/auth/login_locator.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
      ),
    );

    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true, error: true),
    );
    return dio;
  });
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(getIt<Dio>()));
  // setup SharedPrefrences
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => prefs);
  getIt.registerLazySingleton<CacheHelper>(
    () => CacheHelper(sharedPreferences: getIt<SharedPreferences>()),
  );

  // All di Locators
  initAuthLocator();
}
