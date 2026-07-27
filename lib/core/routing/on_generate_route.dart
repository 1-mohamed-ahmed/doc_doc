import 'package:doc_doc/core/routing/routes_app.dart';
import 'package:doc_doc/features/auth/presentation/login_screen.dart';
import 'package:doc_doc/features/onboarding/presentation/on_boarding_Screen.dart';
import 'package:doc_doc/features/onboarding/presentation/splash_screen.dart';
import 'package:flutter/material.dart';

class OnGenerateRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      // case Routes.signup:
      //   return MaterialPageRoute(builder: (_) => const SignupScreen());
      // case Routes.home:
      //   return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
