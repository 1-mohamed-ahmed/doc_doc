import 'package:doc_doc/core/routing/routes.dart';
import 'package:doc_doc/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:doc_doc/features/auth/presentation/screens/login_screen.dart';
import 'package:doc_doc/features/auth/presentation/screens/signup_screen.dart';
import 'package:doc_doc/features/home/ui/home_screen.dart';
import 'package:doc_doc/features/onboarding/presentation/screens/on_boarding_Screen.dart';
import 'package:doc_doc/features/onboarding/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnGenerateRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const HomeScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
