import 'package:doc_doc/core/helpers/extention.dart';
import 'package:doc_doc/core/routing/routes.dart';
import 'package:doc_doc/core/theming/app_color.dart';
import 'package:doc_doc/core/theming/app_text_style.dart';
import 'package:doc_doc/core/widgets/app_button.dart';
import 'package:doc_doc/core/widgets/app_form_text_field.dart';
import 'package:doc_doc/features/auth/presentation/widget/login_footer_text.dart';
import 'package:doc_doc/features/auth/presentation/widget/login_header.dart';
import 'package:doc_doc/features/auth/presentation/widget/or_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscure = true;
  bool checkVal = false;
  GlobalKey<FormState> globalKey = GlobalKey();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
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
                  headerText: "Welcome Back",
                  description:
                      "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
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
                    ],
                  ),
                ),

                //TextFormField ends here
                SizedBox(height: 20.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          activeColor: AppColor.buttonColor,
                          value: checkVal,
                          onChanged: (val) {
                            setState(() {
                              checkVal = val!;
                            });
                          },
                        ),
                        Text(
                          "Remember me",
                          style: TextStyles.fontSize12grayW400,
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Forget Password ?",
                        style: TextStyles.fontSize12blueW400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),

                AppButton(
                  textButton: "Login",
                  onPressed: () {
                    context.pushNamed(Routes.homeScreen);
                  },
                ),
                SizedBox(height: 20.h),

                OrDivider(),

                SizedBox(height: 20.h),
                LoginFooterText(),
                SizedBox(height: 10.h),
                InkWell(
                  onTap: () {
                    context.pushReplacementNamed(Routes.signup);
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
                          text: "Sign Up",
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
