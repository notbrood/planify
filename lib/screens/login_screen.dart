import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planify/methods/firebase_auth.dart';
import 'package:planify/widgets/show_snackbar.dart';
import 'package:planify/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuthentication firebaseAuthentication = FirebaseAuthentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              UserCredential? user =
                  await firebaseAuthentication.loginUsingGoogle(context);
              if (user != null) {
                context.go('/homeScreen');
                showSnackbar(
                  title: "Success",
                  message: "You are logged in now!",
                  contentType: ContentType.success,
                  context: context,
                );
              }
            },
            child: Text("LoginWithGoogle")),
      ),
    );
  }
}
