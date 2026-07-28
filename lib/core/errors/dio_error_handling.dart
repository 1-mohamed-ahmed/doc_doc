import 'package:dio/dio.dart';
import 'package:doc_doc/core/networking/error_model.dart';
import 'package:doc_doc/core/errors/exception.dart';

class DioErrorHandling {
  static void errorHandling(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        throw ServerException(
          errorModel: ErrorModel.fromJson(e.response!.data),
        );
      case DioExceptionType.sendTimeout:
        throw ServerException(
          errorModel: ErrorModel.fromJson(e.response!.data),
        );

      case DioExceptionType.receiveTimeout:
        throw ServerException(
          errorModel: ErrorModel.fromJson(e.response!.data),
        );

      case DioExceptionType.badCertificate:
        throw ServerException(
          errorModel: ErrorModel.fromJson(e.response!.data),
        );
      case DioExceptionType.cancel:
        throw ServerException(
          errorModel: ErrorModel.fromJson(e.response!.data),
        );
      case DioExceptionType.connectionError:
        throw ServerException(
          errorModel: ErrorModel.fromJson(e.response!.data),
        );
      case DioExceptionType.unknown:
        throw ServerException(
          errorModel: ErrorModel.fromJson(e.response!.data),
        );
      case DioExceptionType.transformTimeout:
        throw ServerException(
          errorModel: ErrorModel.fromJson(e.response!.data),
        );
      case DioExceptionType.badResponse:
        throw badResponse(e);
    }
  }

  static badResponse(DioException? error) {
    switch (error!.response?.statusCode) {
      case 200: // success with data
        return ServerException(
          errorModel: ErrorModel.fromJson(error.response!.data),
        );
      case 201: // success with no data (no content)
        return ServerException(
          errorModel: ErrorModel.fromJson(error.response!.data),
        );
      case 400: // failure, API rejected request
        return ServerException(
          errorModel: ErrorModel.fromJson(error.response!.data),
        );
      case 401: // failure, user is not authorised
        return ServerException(
          errorModel: ErrorModel.fromJson(error.response!.data),
        );
      case 403: //  failure, API rejected request
        return ServerException(
          errorModel: ErrorModel.fromJson(error.response!.data),
        );
      case 500: // failure, crash in server side
        return ServerException(
          errorModel: ErrorModel.fromJson(error.response!.data),
        );
      case 404: // failure, not found
        return ServerException(
          errorModel: ErrorModel.fromJson(error.response!.data),
        );
      case 422: // API , lOGIC ERROR
        return ServerException(
          errorModel: ErrorModel.fromJson(error.response!.data),
        );
    }
  }
}
