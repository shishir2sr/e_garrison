import 'package:firebase_auth_with_riverpod_tutorial/core/presentation/widgets/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const AppWidget());
}
