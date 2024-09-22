import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:planify/widgets/show_snackbar.dart';

class FirebaseAuthentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  getUID() {
    return _auth.currentUser != null ? _auth.currentUser!.uid : null;
  }

  Future<UserCredential?> loginUsingGoogle(BuildContext context) async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication? googleAuth =
            await googleSignInAccount?.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        return await _auth.signInWithCredential(credential);
      } else {
        showSnackbar(
          title: "Failed Login",
          message: "Select an account",
          contentType: ContentType.failure,
          context: context,
        );
        return null;
      }
    } on Exception catch (e) {
      showSnackbar(
        title: "Failed Login",
        message: e.toString(),
        contentType: ContentType.failure,
        context: context,
      );
      return null;
    }
  }
}
