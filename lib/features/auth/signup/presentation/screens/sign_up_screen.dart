import 'package:doc_doc/core/helpers/extention.dart';
import 'package:doc_doc/core/routing/routes.dart';
import 'package:doc_doc/core/theming/app_text_style.dart';
import 'package:doc_doc/core/widgets/app_button.dart';
import 'package:doc_doc/features/auth/signup/logic/cubit/signup_cubit.dart';
import 'package:doc_doc/features/auth/signup/logic/cubit/signup_state.dart';
import 'package:doc_doc/features/auth/signup/presentation/widget/form_input_signup.dart';
import 'package:doc_doc/features/auth/widget/auth_footer_text.dart';
import 'package:doc_doc/features/auth/widget/auth_header.dart';
import 'package:doc_doc/features/auth/login/presentation/widget/or_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                  headerText: "Create Account",
                  description:
                      "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                ),
                SizedBox(height: 40.h),
                //TextFormField starts here
                FormInputSignup(),

                //TextFormField ends here
                SizedBox(height: 20.h),

                BlocConsumer<SignupCubit, SignupState>(
                  listener: (context, state) {
                    if (state is SignupSuccess) {
                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.success(
                          message: "Account created successfully!",
                        ),
                      );
                      context.pushNamedAndRemoveUntil(Routes.homeScreen);
                    }
                    if (state is SignupFailure) {
                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.error(
                          message:
                              "${state.apiErrorMessage == null ? state.firebaseErrorMessage : state.apiErrorMessage ?? "undefiend Error"}",
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return AppButton(
                      textButton: "Create Account",
                      onPressed: () {
                        context.read<SignupCubit>().emitSignupStates();
                      },
                      isLoading: state is SignupLoading,
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
                    context.pushReplacementNamed(Routes.login);
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "I have an account ",
                          style: TextStyles.font12blackW700,
                        ),
                        TextSpan(
                          text: "Sign In",
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
