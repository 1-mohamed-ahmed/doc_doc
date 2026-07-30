import 'package:doc_doc/core/networking/api_result.dart';
import 'package:doc_doc/features/auth/signup/data/models/signup_request_body.dart';
import 'package:doc_doc/features/auth/signup/data/models/signup_response_body.dart';

abstract class SignupRepo {
  Future<ApiResult<SignupResponseBody>> signup(
    SignupRequestBody signupRequestBody,
  );
}
