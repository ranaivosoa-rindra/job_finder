// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:job_finder/constants/global_variables.dart';
import 'package:job_finder/features/auth/screens/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logout"),
        actions: [
          GestureDetector(
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove("x-auth-token");
                print(prefs.getString("x-auth-token"));
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
                GlobalVariables.loadingOnce = false;
              },
              child: Icon(Icons.logout))
        ],
      ),
    );
  }
}
