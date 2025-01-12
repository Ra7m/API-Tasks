// ignore_for_file: unused_import

import 'package:category/feature/auth/view/screens/authscreen.dart';
import 'package:category/feature/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthScreen(),
    );
  }
}
