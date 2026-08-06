import 'package:doc_doc/features/auth/login/data/model/login_response_body.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LgoinState {}

class InitState extends LgoinState {}

class LoginLoading extends LgoinState {}

class LoginSuccess extends LgoinState {
  final LoginResponseBody apiData;
  final UserCredential firebaseData;
  LoginSuccess({required this.apiData, required this.firebaseData});
}

class LoginFailuer extends LgoinState {
  final String? apiError;
  final String? firebaseError;
  LoginFailuer({this.apiError, this.firebaseError});
}

class LoginEmailVerify extends LgoinState {}
