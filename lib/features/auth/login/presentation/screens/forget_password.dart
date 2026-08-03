import 'package:doc_doc/core/helpers/extention.dart';
import 'package:doc_doc/core/theming/app_text_style.dart';
import 'package:doc_doc/core/validation/email_validation.dart';
import 'package:doc_doc/core/widgets/app_button.dart';
import 'package:doc_doc/core/widgets/app_form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Forgot Password",
                    style: TextStyles.font32blueBold,
                  ),
                ),
                SizedBox(height: 15.h),
                Align(
                  alignment: Alignment.centerLeft,

                  child: SizedBox(
                    width: 300,
                    child: Text(
                      "At our app, we take the security of your information seriously.",
                      style: TextStyles.font15grayW400.copyWith(height: 1.5),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                AppFormTextField(
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: "Email",
                  validator: (value) => EmailValidation.email(value),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: AppButton(
                isLoading: false,
                textButton: "Reset Passwors",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
