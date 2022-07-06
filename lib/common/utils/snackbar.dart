import 'package:flutter/material.dart';
import 'package:job_finder/features/auth/screens/sign_in_screen.dart';

void snackBarHandler(
    {required BuildContext context,
    required String content,
    required String label}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
    action: SnackBarAction(
      label: label,
      onPressed: (content == "User created sucessfully")
      ? () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()))
      : (){},
    ),
  ));
}
