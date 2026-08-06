import 'package:doc_doc/core/helpers/extention.dart';
import 'package:doc_doc/core/routing/routes.dart';
import 'package:doc_doc/core/theming/app_color.dart';
import 'package:doc_doc/core/theming/app_text_style.dart';
import 'package:doc_doc/core/widgets/app_button.dart';
import 'package:doc_doc/features/auth/signup/logic/cubit/signup_cubit.dart';
import 'package:doc_doc/features/auth/signup/logic/cubit/signup_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.arrow_back_ios_new, color: AppColor.secondary),
          ),
        ),
        title: Text(
          "Verify Your Email",
          style: TextStyles.font24blackW700.copyWith(color: AppColor.priamry),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.mark_email_read_outlined,
                size: 100,
                color: AppColor.priamry,
              ),
              SizedBox(height: 24.h),
              const Text(
                "Verify your email",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.h),
              const Text(
                "We've sent a verification link to your email address.\n"
                "Please open your inbox and verify your account.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF767676)),
              ),
              SizedBox(height: 40.h),

              AppButton(
                textButton: "Resend Email",
                isLoading: false,
                onPressed: () async {
                  await FirebaseAuth.instance.currentUser!
                      .sendEmailVerification()
                      .then((value) {
                        showTopSnackBar(
                          // ignore: use_build_context_synchronously
                          Overlay.of(context),
                          CustomSnackBar.info(
                            message: "Verification email sent successfully",
                          ),
                        );
                      });
                },
              ),

              const SizedBox(height: 16),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.priamry),
                  borderRadius: BorderRadius.circular(15.r),
                ),

                child: BlocBuilder<SignupCubit, SignupState>(
                  builder: (context, state) => AppButton(
                    textButton: "I've Verified",
                    isLoading: false,
                    color: Colors.white,
                    textColor: AppColor.priamry,
                    onPressed: () async {
                      await FirebaseAuth.instance.currentUser?.reload();
                      
                      if (!context.mounted) return;

                      var isEmailVerified = await context
                          .read<SignupCubit>()
                          .isEmailVefified();

                      if (!context.mounted) return;

                      if (isEmailVerified) {
                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.success(
                            message: "Logged in successful!",
                          ),
                        );

                        context.pushNamedAndRemoveUntil(Routes.homeScreen);
                      } else {
                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.error(
                            message:
                                "Email not verified yet. Please verify your email and try again",
                          ),
                        );
                      }
                    },
                    
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




// await FirebaseAuth.instance.currentUser?.reload();

//                     final user = FirebaseAuth.instance.currentUser;

//                     if (user != null && user.emailVerified) {
//                       await getIt<CacheHelper>().setData(
//                         key: ApiKeys.isEmailVerified,
//                         value: true,
//                       );
//                       showTopSnackBar(
//                         Overlay.of(context),
//                         CustomSnackBar.success(
//                           message: "Logged in successful!",
//                         ),
//                       );
//                       context.pushNamedAndRemoveUntil(Routes.mainScreen);
//                     } else {
//                       showTopSnackBar(
//                         Overlay.of(context),
//                         CustomSnackBar.error(
//                           message:
//                               "Email not verified yet. Please verify your email and try again",
//                         ),
//                       );
//                     }