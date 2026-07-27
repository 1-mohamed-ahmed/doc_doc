import 'package:doc_doc/features/onboarding/presentation/widgets/onboarding_image_and_text.dart';
import 'package:doc_doc/features/onboarding/presentation/widgets/onboarding_logo_and_text.dart';
import 'package:doc_doc/features/onboarding/presentation/widgets/onboarding_button_and_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            const OnboardingLogoAndText(),
            SizedBox(height: 30.h),
            const OnboardingImageAndText(),
            const OnboardingButtonAndText(),
          ],
        ),
      ),
    );
  }
}
