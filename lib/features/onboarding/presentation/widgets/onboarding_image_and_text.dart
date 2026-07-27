import 'package:doc_doc/core/theming/app_images.dart';
import 'package:doc_doc/core/theming/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingImageAndText extends StatelessWidget {
  const OnboardingImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(AppImages.splashLogo),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.white, Colors.white.withValues(alpha: 0.0)],
              stops: const [0.0, 0.6],
            ),
          ),
          child: Image.asset(AppImages.doctor),
        ),
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Text(
            'Best Doctor\nAppointment App',
            textAlign: TextAlign.center,
            style: TextStyles.fontSize32Wbold,
          ),
        ),
      ],
    );
  }
}
