import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

showSnackbar({
  required String title,
  required String message,
  required ContentType contentType,
  required BuildContext context,
}) {
  final snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.fixed,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title,
      message: message,
      contentType: contentType,
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
