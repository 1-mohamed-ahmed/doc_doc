import 'package:doc_doc/core/networking/api_result.dart';
import 'package:doc_doc/features/auth/signup/data/models/signup_request_body.dart';
import 'package:doc_doc/features/auth/signup/data/models/signup_response_body.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignupRepo {
  Future<ApiResult<SignupResponseBody>> signup(
    SignupRequestBody signupRequestBody,
  );
}

abstract class FirebaseSignupRepo {
  Future<ApiResult<UserCredential>> firebaseSignUp(
    String email,
    String password,
  );
}
