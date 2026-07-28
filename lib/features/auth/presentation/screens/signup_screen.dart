import 'package:doc_doc/core/helpers/extention.dart';
import 'package:doc_doc/core/routing/routes.dart';
import 'package:doc_doc/core/theming/app_text_style.dart';
import 'package:doc_doc/core/widgets/app_button.dart';
import 'package:doc_doc/core/widgets/app_form_text_field.dart';
import 'package:doc_doc/features/auth/presentation/widget/login_footer_text.dart';
import 'package:doc_doc/features/auth/presentation/widget/login_header.dart';
import 'package:doc_doc/features/auth/presentation/widget/or_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool obscure = true;
  bool checkVal = false;
  GlobalKey<FormState> globalKey = GlobalKey();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final numberController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
    numberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.w),
                const LoginHeader(
                  headerText: "Create Account",
                  description:
                      "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                ),
                SizedBox(height: 40.h),
                //TextFormField starts here
                Form(
                  key: globalKey,

                  child: Column(
                    children: [
                      AppFormTextField(
                        hintText: 'Email',
                        myContrller: emailController,
                        prefixIcon: Icon(Icons.email),
                      ),
                      SizedBox(height: 20.h),

                      AppFormTextField(
                        obscureText: obscure,
                        hintText: 'password',
                        myContrller: passwordController,
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
                      SizedBox(height: 20.h),

                      AppFormTextField(
                        hintText: 'number',
                        myContrller: numberController,
                        prefixIcon: Icon(Icons.phone),
                      ),
                    ],
                  ),
                ),

                //TextFormField ends here
                SizedBox(height: 20.h),

                AppButton(textButton: "Login", onPressed: () {}),
                SizedBox(height: 20.h),

                OrDivider(),

                SizedBox(height: 20.h),
                LoginFooterText(),
                SizedBox(height: 10.h),
                InkWell(
                  onTap: () {
                    context.pushReplacementNamed(Routes.login);
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Already have an account yet?  ",
                          style: TextStyles.fontSize12blackW700,
                        ),
                        TextSpan(
                          text: "Sign In",
                          style: TextStyles.fontSize12blueW400,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
