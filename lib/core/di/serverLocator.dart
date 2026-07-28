import 'package:dio/dio.dart';
import 'package:doc_doc/core/networking/api_constants.dart';
import 'package:doc_doc/core/networking/api_consuemr.dart';
import 'package:doc_doc/core/networking/api_interceptors.dart';
import 'package:doc_doc/core/networking/dio_consumer.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
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

  // 2. تسجيل الـ DioConsumer وتمرير كائن الـ Dio له
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(getIt<Dio>()));
}
