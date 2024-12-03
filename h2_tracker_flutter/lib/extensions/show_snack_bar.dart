import 'package:flutter/material.dart';

enum SnackBarStatus { success, error }

void showSnackBar(
    {required BuildContext context,
    required String message,
    required SnackBarStatus status}) {
  SnackBar snackBar;

  switch (status) {
    case SnackBarStatus.error:
      {
        snackBar = SnackBar(
          content: Text(message),
          backgroundColor: Colors.redAccent[400],
        );
        break;
      }
    case SnackBarStatus.success:
      {
        snackBar = SnackBar(
          content: Text(message),
          backgroundColor: Colors.greenAccent[400],
        );

        break;
      }
  }

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
