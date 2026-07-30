import 'package:doc_doc/features/auth/signup/data/models/signup_response_body.dart';

abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  SignupResponseBody data;
  SignupSuccess(this.data);
}

class SignupFailure extends SignupState {
  String errorMessage;
  SignupFailure(this.errorMessage);
}
