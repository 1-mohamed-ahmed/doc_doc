import 'package:doc_doc/clint_app.dart';
import 'package:doc_doc/core/api/api_keys.dart';
import 'package:doc_doc/core/cache/cache_helper.dart';
import 'package:doc_doc/core/di/server_locator.dart';
import 'package:doc_doc/core/routing/on_generate_route.dart';
import 'package:doc_doc/core/routing/routes.dart';
import 'package:doc_doc/core/theming/app_color.dart';
import 'package:doc_doc/cubit/internet_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColor.lighprimary,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // initialize the service locator for dependency injection
  await setupServiceLocator();

  // initialize the firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // To fix the error of disappearing texts that occurs due to ScreenUtil.
  await ScreenUtil.ensureScreenSize();

  // and settings
  checkInitialScreen();

  // ....
  FlutterNativeSplash.remove();

  runApp(BlocProvider(create: ((context) => InternetCubit()), child: DocApp()));
}

void checkInitialScreen() {
  //selected initial route
  bool isOnboardingVisited =
      getIt<CacheHelper>().getData(key: ApiKeys.isOnboardingVisited) ?? false;

  // Fetch token from cach
  String? token = getIt<CacheHelper>().getData(key: ApiKeys.token);

  // Fetch emailVerified from cach
  bool? emailVerified =
      getIt<FirebaseAuth>().currentUser?.emailVerified ?? false;

  if (!isOnboardingVisited) {
    OnGenerateRoute.initialRoute = Routes.onboarding;
  } else if (token != null && token.isNotEmpty && emailVerified) {
    OnGenerateRoute.initialRoute = Routes.homeScreen;
  } else {
    OnGenerateRoute.initialRoute = Routes.login;
  }
}
