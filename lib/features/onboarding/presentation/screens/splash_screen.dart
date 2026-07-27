import 'package:doc_doc/core/helpers/extention.dart';
import 'package:doc_doc/core/theming/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      context.pushNamedAndRemoveUntil("/onboarding");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(child: SvgPicture.asset(AppImages.splashLogo)),
          Center(child: Image.asset(AppImages.splashLogo2)),
        ],
      ),
    );
  }
}
