import 'package:doc_doc/core/widgets/app_form_text_field.dart';
import 'package:doc_doc/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:doc_doc/core/validation/email_validation.dart';
import 'package:doc_doc/core/validation/password_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormEmailAndPassword extends StatefulWidget {
  const FormEmailAndPassword({super.key});

  @override
  State<FormEmailAndPassword> createState() => _FormEmailAndPasswordState();
}

class _FormEmailAndPasswordState extends State<FormEmailAndPassword> {
  bool obscure = true;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey formKey;

  @override
  void initState() {
    super.initState();
    emailController = context.read<LoginCubit>().emailController;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppFormTextField(
            validator: (value) => EmailValidation.email(value),
            hintText: 'Email',
            myContrller: emailController = context
                .read<LoginCubit>()
                .emailController,
            prefixIcon: Icon(Icons.email),
          ),
          SizedBox(height: 20.h),

          AppFormTextField(
            validator: (value) => PasswordValidation.passwordSignIn(value),
            obscureText: obscure,
            hintText: 'password',
            myContrller: passwordController = context
                .read<LoginCubit>()
                .passwordController,
            prefixIcon: Icon(Icons.lock),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscure = !obscure;
                });
              },
              icon: obscure
                  ? Icon(Icons.visibility)
                  : Icon(Icons.visibility_off),
            ),
          ),
        ],
      ),
    );
  }
}
