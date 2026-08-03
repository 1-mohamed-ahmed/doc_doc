import 'package:doc_doc/clint_app.dart';
import 'package:doc_doc/core/di/server_locator.dart';
import 'package:doc_doc/features/onboarding/function/get_initial_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

bool isLoggedIn = false;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // To fix the error of disappearing texts that occurs due to ScreenUtil.
  await ScreenUtil.ensureScreenSize();
  // initialize the service locator for dependency injection
  await setupServiceLocator();

  // and settings

  // ....

  FlutterNativeSplash.remove();

  runApp(DocApp());
}
