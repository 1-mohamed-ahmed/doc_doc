import 'package:dio/dio.dart';
import 'package:doc_doc/core/api/api_constants.dart';
import 'package:doc_doc/core/networking/error_model.dart';

enum DataSource {
  // ignore: constant_identifier_names
  NO_CONTENT,
  // ignore: constant_identifier_names
  BAD_REQUEST,
  // ignore: constant_identifier_names
  FORBIDDEN,
  // ignore: constant_identifier_names
  UNAUTORISED,
  // ignore: constant_identifier_names
  NOT_FOUND,
  // ignore: constant_identifier_names
  INTERNAL_SERVER_ERROR,
  // ignore: constant_identifier_names
  CONNECT_TIMEOUT,
  // ignore: constant_identifier_names
  CANCEL,
  // ignore: constant_identifier_names
  RECIEVE_TIMEOUT,
  // ignore: constant_identifier_names
  SEND_TIMEOUT,
  // ignore: constant_identifier_names
  CACHE_ERROR,
  // ignore: constant_identifier_names
  NO_INTERNET_CONNECTION,
  // API_LOGIC_ERROR,
  // ignore: constant_identifier_names
  DEFAULT,
}

class ResponseCode {
  // ignore: constant_identifier_names
  static const int SUCCESS = 200; // success with data
  // ignore: constant_identifier_names
  static const int NO_CONTENT = 201; // success with no data (no content)
  // ignore: constant_identifier_names
  static const int BAD_REQUEST = 400; // failure, API rejected request
  // ignore: constant_identifier_names
  static const int UNAUTORISED = 401; // failure, user is not authorised
  // ignore: constant_identifier_names
  static const int FORBIDDEN = 403; //  failure, API rejected request
  // ignore: constant_identifier_names
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  // ignore: constant_identifier_names
  static const int NOT_FOUND = 404; // failure, not found
  // ignore: constant_identifier_names
  static const int API_LOGIC_ERROR = 422; // API , lOGIC ERROR

  // local status code
  // ignore: constant_identifier_names
  static const int CONNECT_TIMEOUT = -1;
  // ignore: constant_identifier_names
  static const int CANCEL = -2;
  // ignore: constant_identifier_names
  static const int RECIEVE_TIMEOUT = -3;
  // ignore: constant_identifier_names
  static const int SEND_TIMEOUT = -4;
  // ignore: constant_identifier_names
  static const int CACHE_ERROR = -5;
  // ignore: constant_identifier_names
  static const int NO_INTERNET_CONNECTION = -6;
  // ignore: constant_identifier_names
  static const int DEFAULT = -7;
}

class ResponseMessage {
  // ignore: constant_identifier_names
  static const String NO_CONTENT =
      ApiErrors.noContent; // success with no data (no content)
  // ignore: constant_identifier_names
  static const String BAD_REQUEST =
      ApiErrors.badRequestError; // failure, API rejected request
  // ignore: constant_identifier_names
  static const String UNAUTORISED =
      ApiErrors.unauthorizedError; // failure, user is not authorised
  // ignore: constant_identifier_names
  static const String FORBIDDEN =
      ApiErrors.forbiddenError; //  failure, API rejected request
  // ignore: constant_identifier_names
  static const String INTERNAL_SERVER_ERROR =
      ApiErrors.internalServerError; // failure, crash in server side
  // ignore: constant_identifier_names
  static const String NOT_FOUND =
      ApiErrors.notFoundError; // failure, crash in server side

  // local status code
  // ignore: non_constant_identifier_names, constant_identifier_names
  static String CONNECT_TIMEOUT = ApiErrors.timeoutError;
  // ignore: non_constant_identifier_names, constant_identifier_names
  static String CANCEL = ApiErrors.defaultError;
  // ignore: non_constant_identifier_names, constant_identifier_names
  static String RECIEVE_TIMEOUT = ApiErrors.timeoutError;
  // ignore: non_constant_identifier_names, constant_identifier_names
  static String SEND_TIMEOUT = ApiErrors.timeoutError;
  // ignore: non_constant_identifier_names, constant_identifier_names
  static String CACHE_ERROR = ApiErrors.cacheError;
  // ignore: non_constant_identifier_names, constant_identifier_names
  static String NO_INTERNET_CONNECTION = ApiErrors.noInternetError;
  // ignore: non_constant_identifier_names, constant_identifier_names
  static String DEFAULT = ApiErrors.defaultError;
}

extension DataSourceExtension on DataSource {
  ErrorModel getFailure() {
    switch (this) {
      case DataSource.NO_CONTENT:
        return ErrorModel(
          code: ResponseCode.NO_CONTENT,
          message: ResponseMessage.NO_CONTENT,
        );
      case DataSource.BAD_REQUEST:
        return ErrorModel(
          code: ResponseCode.BAD_REQUEST,
          message: ResponseMessage.BAD_REQUEST,
        );
      case DataSource.FORBIDDEN:
        return ErrorModel(
          code: ResponseCode.FORBIDDEN,
          message: ResponseMessage.FORBIDDEN,
        );
      case DataSource.UNAUTORISED:
        return ErrorModel(
          code: ResponseCode.UNAUTORISED,
          message: ResponseMessage.UNAUTORISED,
        );
      case DataSource.NOT_FOUND:
        return ErrorModel(
          code: ResponseCode.NOT_FOUND,
          message: ResponseMessage.NOT_FOUND,
        );
      case DataSource.INTERNAL_SERVER_ERROR:
        return ErrorModel(
          code: ResponseCode.INTERNAL_SERVER_ERROR,
          message: ResponseMessage.INTERNAL_SERVER_ERROR,
        );
      case DataSource.CONNECT_TIMEOUT:
        return ErrorModel(
          code: ResponseCode.CONNECT_TIMEOUT,
          message: ResponseMessage.CONNECT_TIMEOUT,
        );
      case DataSource.CANCEL:
        return ErrorModel(
          code: ResponseCode.CANCEL,
          message: ResponseMessage.CANCEL,
        );
      case DataSource.RECIEVE_TIMEOUT:
        return ErrorModel(
          code: ResponseCode.RECIEVE_TIMEOUT,
          message: ResponseMessage.RECIEVE_TIMEOUT,
        );
      case DataSource.SEND_TIMEOUT:
        return ErrorModel(
          code: ResponseCode.SEND_TIMEOUT,
          message: ResponseMessage.SEND_TIMEOUT,
        );
      case DataSource.CACHE_ERROR:
        return ErrorModel(
          code: ResponseCode.CACHE_ERROR,
          message: ResponseMessage.CACHE_ERROR,
        );
      case DataSource.NO_INTERNET_CONNECTION:
        return ErrorModel(
          code: ResponseCode.NO_INTERNET_CONNECTION,
          message: ResponseMessage.NO_INTERNET_CONNECTION,
        );
      case DataSource.DEFAULT:
        return ErrorModel(
          code: ResponseCode.DEFAULT,
          message: ResponseMessage.DEFAULT,
        );
    }
  }
}

class ErrorHandler implements Exception {
  late ErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      apiErrorModel = _handleError(error);
    } else {
      // default error
      apiErrorModel = DataSource.DEFAULT.getFailure();
    }
  }
}

ErrorModel _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        final code = error.response?.statusCode;
        return badResponse(code);
        // return ErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.unknown:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.DEFAULT.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.DEFAULT.getFailure();
    case DioExceptionType.transformTimeout:
      return DataSource.DEFAULT.getFailure();
  }
}

class ApiInternalStatus {
  // ignore: constant_identifier_names
  static const int SUCCESS = 0;
  // ignore: constant_identifier_names
  static const int FAILURE = 1;
}

// ignore: strict_top_level_inference
ErrorModel badResponse( statusCode) { 
  switch (statusCode) {
    case 400:
      return ErrorModel(
        code: 400,
        message: "Bad request. Please check your input.",
      );
    case 401:
      return ErrorModel(
        code: 401,
        message: "Unauthorized. Invalid credentials or expired session.",
      );
    case 403:
      return ErrorModel(
        code: 403,
        message:
            "Forbidden. You do not have permission to access this resource.",
      );
    case 404:
      return ErrorModel(code: 404, message: "Resource not found.");
    case 422:
      return ErrorModel(
        code: 422,
        message:
            "Please check your input data. Email or phone might already exist.",
      );
    case 500:
    case 502:
    case 503:
      return ErrorModel(
        code: 500,
        message: "Internal server error. Please try again later.",
      );
    default:
      return ErrorModel(
        code: statusCode ?? 500,
        message: "Server error occurred ($statusCode).",
      );
  }
}
