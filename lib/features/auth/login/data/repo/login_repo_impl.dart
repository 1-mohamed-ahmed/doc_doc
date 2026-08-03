import 'package:dio/dio.dart';
import 'package:doc_doc/core/errors/dio_error_handling.dart';
import 'package:doc_doc/core/networking/api_result.dart';
import 'package:doc_doc/core/networking/api_service.dart';
import 'package:doc_doc/core/networking/error_model.dart';
import 'package:doc_doc/features/auth/login/domain/login_repo.dart';
import 'package:doc_doc/features/auth/login/data/model/login_request_body.dart';
import 'package:doc_doc/features/auth/login/data/model/login_response_body.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiService _apiService;
  const LoginRepoImpl({required this._apiService});

  @override
  Future<ApiResult<LoginResponseBody>> login(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } on DioException catch (e) {
      final errorHandler = ErrorHandler.handle(e);
      return ApiResult.failure(errorHandler.apiErrorModel);
    } catch (e) {
      return ApiResult.failure(ErrorModel(message: e.toString()));
    }
  }
}
