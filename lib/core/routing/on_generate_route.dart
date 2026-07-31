import 'package:doc_doc/core/di/server_locator.dart';
import 'package:doc_doc/core/routing/routes.dart';
import 'package:doc_doc/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:doc_doc/features/auth/login/presentation/screens/login_screen.dart';
import 'package:doc_doc/features/auth/signup/presentation/cubit/signup_cubit.dart';
import 'package:doc_doc/features/auth/signup/presentation/screens/sign_up_screen.dart';
import 'package:doc_doc/features/home/presentation/home_screen.dart';
import 'package:doc_doc/features/onboarding/presentation/screens/on_boarding_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnGenerateRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signup:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignUpScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
