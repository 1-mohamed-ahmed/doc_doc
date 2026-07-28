import 'package:dio/dio.dart';
import 'package:doc_doc/core/api/api_constants.dart';
import 'package:doc_doc/core/errors/exception.dart';
import 'package:doc_doc/core/networking/error_model.dart';

class DioErrorHandling {
  static Never errorHandling(DioException e) {
    // 1. تصحيح الشرط المقارن بنوع الـ Exception وليس الـ Response
    if (e.type == DioExceptionType.badResponse) {
      throw _handleBadResponse(e);
    }

    if (e.response?.data != null && e.response!.data is Map<String, dynamic>) {
      throw ServerException(
        errorModel: ErrorModel.fromJson(
          e.response!.data as Map<String, dynamic>,
        ),
      );
    }

    throw ServerException(
      errorModel: ErrorModel(
        code: e.response?.statusCode ?? 0,
        message: _getNetworkErrorMessage(e),
      ),
    );
  }

  // handle badResponse
  static ServerException _handleBadResponse(DioException error) {
    final data = error.response?.statusCode;
    // error.response.statusCode
    switch (data) {
      case 400:
        throw ServerException(
          errorModel: ErrorModel(
            code: error.response?.statusCode ?? 0,
            message: ApiErrors.badRequestError,
          ),
        );
      case 401:
        throw ServerException(
          errorModel: ErrorModel(
            code: error.response?.statusCode ?? 0,
            message: ApiErrors.unauthorizedError,
          ),
        );
      case 403:
        throw ServerException(
          errorModel: ErrorModel(
            code: error.response?.statusCode ?? 0,
            message: ApiErrors.forbiddenError,
          ),
        );
      case 404:
        throw ServerException(
          errorModel: ErrorModel(
            code: error.response?.statusCode ?? 0,
            message: ApiErrors.notFoundError,
          ),
        );

      case 409:
        throw ServerException(
          errorModel: ErrorModel(
            code: error.response?.statusCode ?? 0,
            message: ApiErrors.badRequestError,
          ),
        );

      case 422:
        throw ServerException(
          errorModel: ErrorModel(
            code: error.response?.statusCode ?? 0,
            message: "Unprocessable Entity",
          ),
        );
      case 429:
        throw ServerException(
          errorModel: ErrorModel(
            code: error.response?.statusCode ?? 0,
            message: "Too Many Requests",
          ),
        );
      case 500:
        throw ServerException(
          errorModel: ErrorModel(
            code: error.response?.statusCode ?? 0,
            message: ApiErrors.internalServerError,
          ),
        );
      case 502:
        throw ServerException(
          errorModel: ErrorModel(
            code: error.response?.statusCode ?? 0,
            message: "Bad Gateway",
          ),
        );
      case 503:
        throw ServerException(
          errorModel: ErrorModel(
            code: error.response?.statusCode ?? 0,
            message: "Service Unavailable",
          ),
        );
      case 504:
        throw ServerException(
          errorModel: ErrorModel(
            code: error.response?.statusCode ?? 0,
            message: ApiErrors.timeoutError,
          ),
        );
      default:
        throw ServerException(
          errorModel: ErrorModel(
            code: error.response?.statusCode ?? 0,
            message: "${error.response!.statusCode}",
          ),
        );
    }
  }

  static String _getNetworkErrorMessage(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return "The connection to the server has timed out. Please try again later.";
      case DioExceptionType.connectionError:
        return "No internet connection. Check your network and try again.";
      case DioExceptionType.cancel:
        return "The order was cancelled.";
      default:
        return e.message ?? "UnKnown error";
    }
  }
}
