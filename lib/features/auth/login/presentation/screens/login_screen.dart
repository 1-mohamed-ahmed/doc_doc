import 'package:doc_doc/core/helpers/extention.dart';
import 'package:doc_doc/core/routing/routes.dart';
import 'package:doc_doc/core/theming/app_text_style.dart';
import 'package:doc_doc/core/widgets/app_button.dart';
import 'package:doc_doc/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:doc_doc/features/auth/login/logic/cubit/login_state.dart';
import 'package:doc_doc/features/auth/login/presentation/widget/form_email_and_password.dart';
import 'package:doc_doc/features/auth/login/presentation/widget/show_dialog_indecator.dart';
import 'package:doc_doc/features/auth/widget/auth_footer_text.dart';
import 'package:doc_doc/features/auth/widget/auth_header.dart';
import 'package:doc_doc/features/auth/login/presentation/widget/or_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// top_snackbar_flutter
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                const AuthHeader(
                  headerText: "Welcome Back",
                  description:
                      "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                ),
                SizedBox(height: 40.h),
                //TextFormField starts here
                FormEmailAndPassword(),

                //TextFormField ends here
                SizedBox(height: 20.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        context.pushNamed(Routes.forgetPassword);
                      },
                      child: Text(
                        "Forget Password ?",
                        style: TextStyles.font15blueW400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),

                BlocConsumer<LoginCubit, LgoinState>(
                  listener: (context, state) {
                    if (state is LoginLoading) {
                      // ignore: void_checks
                      return ShowDialogIndecator.showIndicator(context);
                    } else if (state is LoginEmailVerify) {
                      Navigator.of(context, rootNavigator: true).pop();

                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.info(
                          message: "Please verify your email",
                        ),
                      );
                      context.pushNamed(Routes.verifyEmail);
                    } else if (state is LoginSuccess) {
                      // To close the loading dialog when login succeeds
                      Navigator.of(context, rootNavigator: true).pop();
                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.success(
                          message: "${state.apiData.message}",
                        ),
                      );
                      context.pushNamedAndRemoveUntil(Routes.homeScreen);
                    } else if (state is LoginFailuer) {
                      // To close the loading dialog when login fails
                      Navigator.of(context, rootNavigator: true).pop();
                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.error(
                          message:
                              "${state.apiError == null ? state.firebaseError : state.apiError ?? "undefiend Error"}",
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return AppButton(
                      textButton: "Login",
                      onPressed: () async {
                        context.read<LoginCubit>().emitLoginStates();
                        // context.read<LoginCubit>().verifyEmail();
                      },
                      isLoading: false,
                    );
                  },
                ),

                SizedBox(height: 20.h),

                OrDivider(),

                SizedBox(height: 50.h),
                AuthFooterText(),
                SizedBox(height: 50.h),

                InkWell(
                  onTap: () {
                    context.pushNamed(Routes.signup);
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Already have an account yet?  ",
                          style: TextStyles.font12blackW700,
                        ),
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyles.font15blueW400,
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
