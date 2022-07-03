import 'package:flutter/material.dart';

Future dialog(
  BuildContext context, 
  String titleText, 
  String content, 
  VoidCallback onPress, 
  String buttonText
  ){
  return showDialog(
    context: context,
    builder: (BuildContext builder) {
      return AlertDialog(
        title: Text(titleText),
        content: Text(content),
        actions: [
          TextButton(
              onPressed: onPress,
              child: Text(buttonText),
          )
        ],
      );
    });
}