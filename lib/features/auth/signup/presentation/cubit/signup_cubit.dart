import 'package:bloc/bloc.dart';
import 'package:doc_doc/core/networking/api_result.dart';
import 'package:doc_doc/features/auth/signup/domain/signup_repo.dart';
import 'package:doc_doc/features/auth/signup/data/models/signup_request_body.dart';
import 'package:doc_doc/features/auth/signup/presentation/cubit/signup_state.dart';
import 'package:flutter/material.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;

  SignupCubit(this._signupRepo) : super(SignupInitial());

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
    emit(SignupLoading());

    final response = await _signupRepo.signup(
      SignupRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        confirmPassword: passwordConfirmationController.text,
        gender: _selectionGender ?? 0,
      ),
    );

    response.when(
      success: (signupResponse) {
        emit(SignupSuccess(signupResponse));
      },
      failure: (errorHandler) {
        final errorMessage = errorHandler.apiErrorModel.getAllErrorMessages();
        emit(SignupFailure(errorMessage));
      },
    );
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
