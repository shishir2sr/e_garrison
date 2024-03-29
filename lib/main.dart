import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/presentation/widgets/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ProviderScope(
      child: AppWidget(),
      // child: MaterialApp(
      //   home: HomePage(),
      //   debugShowCheckedModeBanner: false,
      // ),
    ),
  );
}
