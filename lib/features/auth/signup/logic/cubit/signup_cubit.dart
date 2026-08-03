import 'package:bloc/bloc.dart';
import 'package:doc_doc/core/api/api_keys.dart';
import 'package:doc_doc/core/cache/cache_helper.dart';
import 'package:doc_doc/core/di/server_locator.dart';
import 'package:doc_doc/core/networking/api_result.dart';
import 'package:doc_doc/features/auth/signup/domain/signup_repo.dart';
import 'package:doc_doc/features/auth/signup/data/models/signup_request_body.dart';
import 'package:doc_doc/features/auth/signup/logic/cubit/signup_state.dart';
import 'package:flutter/material.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  final FirebaseSignupRepo _firebaseSignupRepo;

  SignupCubit({required this._signupRepo, required this._firebaseSignupRepo})
    : super(SignupInitial());

  // TextControllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  int? _selectionGender;

  void selectedGender(int? gender) {
    _selectionGender = gender;
  }

  void emitSignupStates() async {
    if (formKey.currentState!.validate()) {
      emit(SignupLoading());

      // Api request
      final apiResponse = await _signupRepo.signup(
        SignupRequestBody(
          name: nameController.text,
          email: emailController.text,
          phone: phoneController.text,
          password: passwordController.text,
          confirmPassword: passwordConfirmationController.text,
          gender: _selectionGender ?? 0,
        ),
      );

      await apiResponse.when(
        success: (loginResponse) async {
          // Save token
          final token = loginResponse.data?.token;
          await getIt<CacheHelper>().setData(key: ApiKeys.token, value: token);

          // login with Firebase
          final firebaseResponse = await _firebaseSignupRepo.firebaseSignUp(
            emailController.text.trim(),
            passwordController.text,
          );

          firebaseResponse.when(
            success: (userCredential) {
              emit(
                SignupSuccess(
                  apiResponseData: loginResponse,
                  firebaseResponseData: userCredential,
                ),
              );
            },
            failure: (errorModel) {
              // Firebase Error
              emit(
                SignupFailure(
                  firebaseErrorMessage: errorModel.message.toString(),
                ),
              );
            },
          );
        },
        failure: (errorModel) {
          // API Error

          emit(SignupFailure(apiErrorMessage: errorModel.message));
        },
      );
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    return super.close();
  }
}
