import 'package:doc_doc/core/validation/name_validation.dart';
import 'package:doc_doc/core/validation/phone_validation.dart';
import 'package:doc_doc/core/widgets/app_form_text_field.dart';
import 'package:doc_doc/core/validation/email_validation.dart';
import 'package:doc_doc/core/validation/password_validation.dart';
import 'package:doc_doc/features/auth/signup/logic/cubit/signup_cubit.dart';
import 'package:doc_doc/features/auth/signup/presentation/widget/drop_down_gender.dart';
import 'package:doc_doc/features/auth/signup/presentation/widget/intel_phone_field.dart';
import 'package:doc_doc/features/auth/signup/presentation/widget/password_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormInputSignup extends StatefulWidget {
  const FormInputSignup({super.key});

  @override
  State<FormInputSignup> createState() => _FormInputSignupState();
}

class _FormInputSignupState extends State<FormInputSignup> {
  bool obscurePassword = true;
  bool obscureConfirm = true;
  int genderVal = 0;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmationController;
  late TextEditingController genderController;
  late GlobalKey<FormState> formKey;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = RegExp(
          r'^(?=.*[a-z])',
        ).hasMatch(passwordController.text);
        hasUpperCase = RegExp(
          r'^(?=.*[A-Z])',
        ).hasMatch(passwordController.text);
        hasSpecialCharacters = RegExp(
          r'^(?=.*?[#?!@$%^&*-])',
        ).hasMatch(passwordController.text);
        hasNumber = RegExp(r'^(?=.*[0-9])').hasMatch(passwordController.text);
        hasMinLength = passwordController.text.length >= 8;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          AppFormTextField(
            validator: (value) => NameValidation.name(value),
            hintText: 'Full Name',
            myContrller: emailController = context
                .read<SignupCubit>()
                .nameController,
            prefixIcon: Icon(Icons.person),
          ),
          SizedBox(height: 20.h),
          AppFormTextField(
            validator: (value) => EmailValidation.email(value),
            hintText: 'Email',
            myContrller: emailController = context
                .read<SignupCubit>()
                .emailController,
            prefixIcon: Icon(Icons.email),
          ),
          SizedBox(height: 20.h),

          password(
            obscure: obscurePassword,
            validator: (value) => PasswordValidation.passwordSignUp(value),
            hintText: 'Password',
            controller: passwordController = context
                .read<SignupCubit>()
                .passwordController,
            onPressed: () {
              setState(() {
                obscurePassword = !obscurePassword;
              });
            },
          ),

          PasswordValidationsWidget(
            hasLowerCase: hasLowerCase,
            hasMinLength: hasMinLength,
            hasNumber: hasNumber,
            hasSpecialCharacters: hasSpecialCharacters,
            hasUpperCase: hasUpperCase,
          ),
          SizedBox(height: 20.h),

          password(
            obscure: obscureConfirm,
            validator: (value) => PasswordValidation.confirmPassword(
              value,
              passwordController.text,
            ),
            hintText: 'Confirm Your Password',
            controller: passwordConfirmationController = context
                .read<SignupCubit>()
                .passwordConfirmationController,
            onPressed: () {
              setState(() {
                obscureConfirm = !obscureConfirm;
              });
            },
          ),
          SizedBox(height: 20.h),

          IntelPhoneField(
            controller: phoneController = context
                .read<SignupCubit>()
                .phoneController,
            validator: (value) => PhoneValidation.phone(value),
          ),
          SizedBox(height: 20.h),

          GenderDropdown(
            value: genderVal,
            onChanged: (value) {
              context.read<SignupCubit>().selectedGender(value);
            },
          ),
        ],
      ),
    );
  }

  Widget password({
    required bool obscure,
    required String? Function(String?)? validator,
    required String hintText,
    required TextEditingController controller,
    required void Function()? onPressed,
  }) {
    return AppFormTextField(
      validator: validator,
      obscureText: obscure,
      hintText: hintText,
      myContrller: controller,
      prefixIcon: Icon(Icons.lock),
      suffixIcon: IconButton(
        onPressed: onPressed,
        icon: obscure ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
      ),
    );
  }
}





// AppFormTextField(
//             validator: (value) => PasswordValidation.passwordSignIn(value),
//             obscureText: obscurePassword,
//             hintText: 'password',
//             myContrller: passwordController = context
//                 .read<LoginCubit>()
//                 .passwordController,
//             prefixIcon: Icon(Icons.lock),
//             suffixIcon: IconButton(
//               onPressed: () {
//                 setState(() {
//                   obscure = !obscure;
//                 });
//               },
//               icon: obscure
//                   ? Icon(Icons.visibility)
//                   : Icon(Icons.visibility_off),
//             ),
//           ),