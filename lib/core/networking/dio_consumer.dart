import 'package:dio/dio.dart';
import 'package:doc_doc/core/networking/api_consuemr.dart';
import 'package:doc_doc/core/errors/dio_error_handling.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;
  DioConsumer(this.dio);

  @override
  Future<dynamic> get(
    String path, {
    dynamic? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.get(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      DioErrorHandling.errorHandling(e);
    }
  }

  @override
  Future<dynamic> patch(
    String path, {
    dynamic? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      DioErrorHandling.errorHandling(e);
    }
  }

  @override
  Future<dynamic> post(
    String path, {
    dynamic? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      DioErrorHandling.errorHandling(e);
    }
  }

  @override
  Future<dynamic> delete(
    String path, {
    dynamic? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      DioErrorHandling.errorHandling(e);
    }
  }
}
