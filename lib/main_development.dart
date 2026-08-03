import 'package:doc_doc/clint_app.dart';
import 'package:doc_doc/core/api/api_keys.dart';
import 'package:doc_doc/core/cache/cache_helper.dart';
import 'package:doc_doc/core/di/server_locator.dart';
import 'package:doc_doc/core/routing/on_generate_route.dart';
import 'package:doc_doc/core/routing/routes.dart';
import 'package:doc_doc/core/theming/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // To fix the error of disappearing texts that occurs due to ScreenUtil.
  await ScreenUtil.ensureScreenSize();
  // initialize the firebase

  await Firebase.initializeApp();

  // initialize the service locator for dependency injection
  await setupServiceLocator();

  // and settings

  //selected initial route
  bool isOnboardingVisited =
      getIt<CacheHelper>().getData(key: ApiKeys.isOnboardingVisited) ?? false;
  String? token = getIt<CacheHelper>().getData(key: ApiKeys.token);
  if (!isOnboardingVisited) {
    OnGenerateRoute.initialRoute = Routes.onboarding;
  } else if (token != null && token.isNotEmpty) {
    OnGenerateRoute.initialRoute = Routes.homeScreen;
  } else {
    OnGenerateRoute.initialRoute = Routes.login;
  }

  // ....
  FlutterNativeSplash.remove();

  runApp(DocApp());
}
