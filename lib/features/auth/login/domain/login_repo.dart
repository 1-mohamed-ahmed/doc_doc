import 'package:doc_doc/core/networking/api_result.dart';
import 'package:doc_doc/features/auth/login/data/model/login_request_body.dart';
import 'package:doc_doc/features/auth/login/data/model/login_response_body.dart';

abstract class LoginRepo {
  Future<ApiResult<LoginResponseBody>> login(LoginRequestBody loginRequestBody);
}
