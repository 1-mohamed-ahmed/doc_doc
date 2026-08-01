import 'package:doc_doc/clint_app.dart';
import 'package:doc_doc/core/di/server_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await ScreenUtil.ensureScreenSize();
  await setupServiceLocator();

  // and settings
  // ....

  FlutterNativeSplash.remove();

  runApp(const DocApp());
}
