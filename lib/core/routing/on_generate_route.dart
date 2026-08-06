import 'package:doc_doc/core/di/server_locator.dart';
import 'package:doc_doc/core/routing/routes.dart';
import 'package:doc_doc/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:doc_doc/features/auth/login/presentation/screens/forget_password.dart';
import 'package:doc_doc/features/auth/login/presentation/screens/login_screen.dart';
import 'package:doc_doc/features/auth/signup/logic/cubit/signup_cubit.dart';
import 'package:doc_doc/features/auth/signup/presentation/screens/sign_up_screen.dart';
import 'package:doc_doc/features/auth/signup/presentation/screens/verify_email.dart';
import 'package:doc_doc/features/home/logic/home_cubit.dart';
import 'package:doc_doc/features/home/presentation/screens/appointment_screen.dart';
import 'package:doc_doc/features/home/presentation/screens/home_screen.dart';
import 'package:doc_doc/features/home/presentation/screens/message_screen.dart';
import 'package:doc_doc/features/home/presentation/screens/notification.dart';
import 'package:doc_doc/features/profileScreens/screens/personal_information.dart';
import 'package:doc_doc/features/profileScreens/screens/profile.dart';
import 'package:doc_doc/features/home/presentation/screens/search_doctors.dart';
import 'package:doc_doc/features/settingScreens/screens/settings_screen.dart';
import 'package:doc_doc/features/onboarding/presentation/screens/on_boarding_Screen.dart';
import 'package:doc_doc/features/settingScreens/screens/language_setting.dart';
import 'package:doc_doc/features/settingScreens/screens/notification_settings.dart';
import 'package:doc_doc/features/settingScreens/screens/security_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnGenerateRoute {
  static String initialRoute = Routes.onboarding;

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
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPassword());
      case Routes.verifyEmail:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const VerifyEmail(),
          ),
        );
      
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => 
        BlocProvider(create: (context)=> getIt<HomeCubit>() , child: const HomeScreen(), )
        
        );
      case Routes.notification:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case Routes.apointment:
        return MaterialPageRoute(builder: (_) => const AppointmentScreen());
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => const Profile());
      case Routes.message:
        return MaterialPageRoute(builder: (_) => const MessageScreen());
      case Routes.settingScreen:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case Routes.notificationSetting:
        return MaterialPageRoute(builder: (_) => const NotificationSettings());
      case Routes.securitySetting:
        return MaterialPageRoute(builder: (_) => const SecuritySetting());
      case Routes.language:
        return MaterialPageRoute(builder: (_) => const LanguageSetting());
      case Routes.personalInformation:
        return MaterialPageRoute(builder: (_) => const PersonalInformation());
      case Routes.search:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HomeCubit>(),
            child: const SearchScreen(),
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
