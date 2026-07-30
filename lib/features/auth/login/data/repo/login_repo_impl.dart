import 'package:dio/dio.dart';
import 'package:doc_doc/core/errors/dio_error_handling.dart';
import 'package:doc_doc/core/networking/api_result.dart';
import 'package:doc_doc/core/networking/api_service.dart';
import 'package:doc_doc/features/auth/login/data/model/login_request_body.dart';
import 'package:doc_doc/features/auth/login/data/model/login_response_body.dart';
import 'package:doc_doc/features/auth/login/domain/login_repo.dart';

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
      return ApiResult.failure(ErrorHandler.handle(e));
    } catch (e) {
      return ApiResult.failure(
        ErrorHandler.handle(
          DioException(
            requestOptions: RequestOptions(path: ''),
            error: e,
          ),
        ),
      );
    }
  }
}
