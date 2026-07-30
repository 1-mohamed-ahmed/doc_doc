// import 'package:doc_doc/core/widgets/app_form_text_field.dart';
// import 'package:doc_doc/features/auth/login/presentation/cubit/login_cubit.dart';
// import 'package:doc_doc/features/auth/signup/presentation/cubit/signup_cubit.dart';
// import 'package:doc_doc/features/auth/signup/presentation/widget/password_validation.dart';
// import 'package:doc_doc/core/validation/password_validation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class PasswordField extends StatefulWidget {
//   const PasswordField({super.key});

//   @override
//   State<PasswordField> createState() => _PasswordFieldState();
// }

// class _PasswordFieldState extends State<PasswordField> {
//   bool obscure = true;
//   late TextEditingController passwordController;
//   // متغيرة للتحقق من الشروط
//   bool hasLowerCase = false;
//   bool hasUpperCase = false;
//   bool hasSpecialCharacters = false;
//   bool hasNumber = false;
//   bool hasMinLength = false;

//   @override
//   void initState() {
//     super.initState();
//     setupPasswordControllerListener();
//   }

//   void setupPasswordControllerListener() {
//     passwordController.addListener(() {
//       setState(() {
//         hasLowerCase = RegExp(
//           r'^(?=.*[a-z])',
//         ).hasMatch(passwordController.text);
//         hasUpperCase = RegExp(
//           r'^(?=.*[A-Z])',
//         ).hasMatch(passwordController.text);
//         hasSpecialCharacters = RegExp(
//           r'^(?=.*?[#?!@$%^&*-])',
//         ).hasMatch(passwordController.text);
//         hasNumber = RegExp(r'^(?=.*[0-9])').hasMatch(passwordController.text);
//         hasMinLength = passwordController.text.length >= 8;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       // key: context.read<LoginCubit>().formKey,
//       child: Column(
//         children: [
//           AppFormTextField(
//             validator: (value) => PasswordValidation.passwordSignIn(value),
//             obscureText: obscure,
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
//           PasswordValidationsWidget(
//             hasLowerCase: hasLowerCase,
//             hasMinLength: hasMinLength,
//             hasNumber: hasNumber,
//             hasSpecialCharacters: hasSpecialCharacters,
//             hasUpperCase: hasUpperCase,
//           ),
//         ],
//       ),
//     );
//   }
// }
