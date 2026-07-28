import 'package:doc_doc/clint_app.dart';
import 'package:doc_doc/core/di/server_locator.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(DocApp());
}
