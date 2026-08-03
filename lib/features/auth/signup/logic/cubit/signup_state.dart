import 'package:doc_doc/features/auth/signup/data/models/signup_response_body.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  SignupResponseBody apiResponseData;
  UserCredential firebaseResponseData;
  SignupSuccess({
    required this.apiResponseData,
    required this.firebaseResponseData,
  });
}

class SignupFailure extends SignupState {
  final String? apiErrorMessage;
  final String? firebaseErrorMessage;
  SignupFailure({this.apiErrorMessage, this.firebaseErrorMessage});
}
