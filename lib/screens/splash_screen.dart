import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planify/methods/firebase_auth.dart';
import 'package:planify/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    splashScreenFunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  splashScreenFunction() {
    Timer(
      const Duration(seconds: 3),
      () {
        if (FirebaseAuthentication().getUID() != null) {
          context.go('/homeScreen');
        } else {
          context.go('/login');
        }
      },
    );
  }
}
