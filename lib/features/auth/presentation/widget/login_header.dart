import 'package:doc_doc/core/theming/app_color.dart';
import 'package:doc_doc/core/theming/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Welcome Back',
            textAlign: TextAlign.left,
            style: TextStyles.fontSize24W700.copyWith(
              color: AppColor.buttonColor,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
          style: TextStyles.fontSize12W400,
        ),
      ],
    );
  }
}
