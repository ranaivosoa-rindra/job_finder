// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void errorHandler({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;

    case 401:
      print('-----------------HELLO 401------------');
      final parsed = jsonDecode(response.body);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(response.statusCode.toString()),
          content: Text(parsed['detail']),
          actions: [
            TextButton(
              onPressed: () =>  Navigator.pop(context),
              child: Text('Go back'),
            ),
          ],
        )
      );
      break;

    default:
      final parsed = jsonDecode(response.body);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(response.statusCode.toString()),
          content: (parsed['detail'] == null || parsed['detail'] == "")
            ? Text("Not Found")
            : Text(parsed['detail']),
          actions: [
            TextButton(
              onPressed: () =>  Navigator.pop(context),
              child: Text('Got it'),
            ),
          ],
        )
      );
      break;
  }
}
