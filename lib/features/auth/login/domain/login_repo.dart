import 'package:doc_doc/core/networking/api_result.dart';
import 'package:doc_doc/features/auth/login/data/model/login_request_body.dart';
import 'package:doc_doc/features/auth/login/data/model/login_response_body.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepo {
  Future<ApiResult<LoginResponseBody>> login(LoginRequestBody loginRequestBody);
}

abstract class FirebaseLoginRepo {
  Future<ApiResult<UserCredential>> firebaseLogin(
    String password,
    String email,
  );
}
