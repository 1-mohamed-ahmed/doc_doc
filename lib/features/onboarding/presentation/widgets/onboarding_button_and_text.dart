import 'package:doc_doc/core/helpers/extention.dart';
import 'package:doc_doc/core/theming/app_color.dart';
import 'package:doc_doc/core/theming/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingButtonAndText extends StatelessWidget {
  const OnboardingButtonAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
          style: TextStyles.fontSize12W400,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30.h),

        ElevatedButton(
          onPressed: () {
            context.pushReplacementNamed("/login");
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(300.w, 50.h),

            backgroundColor: AppColor.buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 15.h),
          ),
          child: Text(
            'Get Started',
            style: TextStyles.fontSize12W400.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
