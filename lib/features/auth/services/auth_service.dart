// ignore_for_file: avoid_print, use_build_context_synchronously, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:job_finder/constants/global_variables.dart';
import 'package:job_finder/features/home/screens/homescreen.dart';

class AuthService {
  // Sign in a user
  void signInUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    http.Response response = await http.post(
      Uri.parse('$uri/login/token'),
      body: {'username': email, 'password': password},
      headers: {
        "Content-Type": 'application/x-www-form-urlencoded; charset=UTF-8',
      },
    );

    print(response);

    switch (response.statusCode) {
      case 200:
        Navigator.pushNamed(context, HomeScreen.routeName);
        break;

      case 401:
        final parsed = jsonDecode(response.body);
        print("hello 401");
        showDialog(
            context: context,
            builder: (BuildContext builder) {
              return AlertDialog(
                title: Text("Error"),
                content: Text(parsed['detail']),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('OK'))
                ],
              );
            });
        break;

      default:
        final parsed = jsonDecode(response.body);
        showDialog(
            context: context,
            builder: (BuildContext builder) {
              return AlertDialog(
                title: Text("Error"),
                content: (parsed['detail'] == null || parsed['detail'] == "")
                    ? Text("Not found")
                    : Text(parsed['detail']),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('OK'))
                ],
              );
            });
        break;
    }
  }
}
