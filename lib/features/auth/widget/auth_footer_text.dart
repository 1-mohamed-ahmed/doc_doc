import 'package:doc_doc/core/theming/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthFooterText extends StatelessWidget {
  const AuthFooterText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: "By logging, you agree to our",
              style: TextStyles.font15grayW400.copyWith(fontSize: 14.sp),
            ),
            TextSpan(
              text: "  Terms & Conditions",
              style: TextStyles.font12blackW700.copyWith(fontSize: 14.sp),
            ),
            TextSpan(
              text: " and ",
              style: TextStyles.font15grayW400.copyWith(fontSize: 14.sp),
            ),
            TextSpan(
              text: " PrivacyPolicy.",
              style: TextStyles.font12blackW700.copyWith(fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
