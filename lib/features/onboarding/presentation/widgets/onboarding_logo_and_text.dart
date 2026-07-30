import 'package:doc_doc/core/theming/app_images.dart';
import 'package:doc_doc/core/theming/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingLogoAndText extends StatelessWidget {
  const OnboardingLogoAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppImages.frame),
        SizedBox(width: 10.w),
        Text('DocDoc', style: TextStyles.font24blackW700),
      ],
    );
  }
}
