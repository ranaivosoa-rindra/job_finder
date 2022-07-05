// ignore_for_file: avoid_print, use_build_context_synchronously, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:job_finder/common/utils/dialog.dart';
import 'package:job_finder/constants/global_variables.dart';
import 'package:job_finder/models/user.model.dart';
import 'package:job_finder/providers/user.provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // get user data
  void getUserData(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("x-auth-token");

      // set the x-auth-token to "" to get the new token for the new signed in user
      if (token == null) {
        prefs.setString("x-auth-token", "");
      }

      print(prefs.getString("x-auth-token"));
      http.Response tokenRes = await http.post(Uri.parse("$uri/login/$token"),
          headers: <String, String>{'accept': 'application/json'});

      User user = User(
          email: json.decode(tokenRes.body)['email'],
          password: "",
          token: "",
          username: json.decode(tokenRes.body)['username']);
      switch (tokenRes.statusCode) {
        case 200:
          print("STATUS CODE");
          print(tokenRes.statusCode);
          print(user.toJson());
          Provider.of<UserProvider>(context, listen: false)
              .setUser(user.toJson());
          // print(json.decode(tokenRes.body)['email']);
          // userProvider.setUser(user);
          break;

        case 401:
          print("ERROR 401");
          print('$uri/login/$token');
          break;

        default:
          print("ERROR Unknown Error");
          print(tokenRes.body);
          break;
      }

      // var userProvider = Provider.of<UserProvider>(context, listen: false);
      // userProvider.setUser(res.body);
    } catch (e) {
      dialog(context, "Error", e.toString(), () => Navigator.pop(context),
          'Got it');
    }
  }
}
