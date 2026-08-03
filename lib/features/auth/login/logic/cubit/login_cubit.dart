import 'package:doc_doc/core/api/api_keys.dart';
import 'package:doc_doc/core/cache/cache_helper.dart';
import 'package:doc_doc/core/di/server_locator.dart';
import 'package:doc_doc/core/networking/api_result.dart';
import 'package:doc_doc/features/auth/login/domain/login_repo.dart';
import 'package:doc_doc/features/auth/login/data/model/login_request_body.dart';
import 'package:doc_doc/features/auth/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LgoinState> {
  final LoginRepo _loginRepo;
  final FirebaseLoginRepo _firebaseLoginRepo;

  LoginCubit({required this._loginRepo, required this._firebaseLoginRepo})
    : super(InitState());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());

      // login with API
      final apiResponse = await _loginRepo.login(
        LoginRequestBody(
          email: emailController.text.trim(),
          password: passwordController.text,
        ),
      );

      await apiResponse.when(
        success: (loginResponse) async {
          // Save token
          final token = loginResponse.data?.token;
          await getIt<CacheHelper>().setData(key: ApiKeys.token, value: token);

          // login with Firebase
          final firebaseResponse = await _firebaseLoginRepo.firebaseLogin(
            emailController.text.trim(),
            passwordController.text,
          );

          firebaseResponse.when(
            success: (userCredential) {
              emit(
                LoginSuccess(
                  apiData: loginResponse,
                  firebaseData: userCredential,
                ),
              );
            },
            failure: (errorModel) {
              // Firebase Error
              emit(LoginFailuer(firebaseError: errorModel.message.toString()));
            },
          );
        },
        failure: (errorModel) {
          // API Error

          emit(LoginFailuer(apiError: errorModel.message));
        },
      );
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
