import 'package:dio/dio.dart';
import 'package:doc_doc/core/errors/dio_error_handling.dart';
import 'package:doc_doc/core/networking/api_result.dart';
import 'package:doc_doc/core/networking/api_service.dart';
import 'package:doc_doc/features/auth/signup/domain/signup_repo.dart';
import 'package:doc_doc/features/auth/signup/data/models/signup_request_body.dart';
import 'package:doc_doc/features/auth/signup/data/models/signup_response_body.dart';

class SignupRepoImpl implements SignupRepo {
  final ApiService _apiService;
  const SignupRepoImpl({required this._apiService});

  @override
  Future<ApiResult<SignupResponseBody>> signup(
    SignupRequestBody signupRequestBody,
  ) async {
    try {
      final response = await _apiService.signUp(signupRequestBody);
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
