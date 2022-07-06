import 'package:flutter/material.dart';
import 'package:job_finder/features/auth/screens/sign_in_screen.dart';

// class SnackBarHandler extends StatelessWidget {
//   final String label;
//   final String content;
//   const SnackBarHandler({Key? key, required this.label, required this.content}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
// return SnackBar(
//   content: Text(content),
//   action: SnackBarAction(
//     label: label,
//     onPressed: () => Navigator.of(context).pop(),
//   ),
// );
//   }
// }

void snackBarHandler(
    {required BuildContext context,
    required String content,
    required String label}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
    action: SnackBarAction(
      label: label,
      onPressed: (content == "User created sucessfully")
      ? () => Navigator.pushNamed(context, SignInScreen.routeName)
      : (){},
    ),
  ));
}
