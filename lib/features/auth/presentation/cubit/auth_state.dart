abstract class AuthState {}

class InitialAuthState extends AuthState {}

class AuthStateLoading extends AuthState {}

class AuthStateSuccess extends AuthState {
  final data;
  AuthStateSuccess(this.data);
}

class AuthStateFailure extends AuthState {
  final dynamic message;
  AuthStateFailure(this.message);
}
