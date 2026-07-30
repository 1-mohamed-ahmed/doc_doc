import 'package:doc_doc/features/auth/login/data/model/login_response_body.dart';

abstract class LgoinState {}

class InitState extends LgoinState {}

class LoginLoading extends LgoinState {}

class LoginSuccess extends LgoinState {
  final LoginResponseBody data;
  LoginSuccess(this.data);
}

class LoginFailuer extends LgoinState {
  final String error;
  LoginFailuer({required this.error});
}
