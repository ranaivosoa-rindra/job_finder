// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:job_finder/common/widgets/global_button.dart';
import 'package:job_finder/constants/global_variables.dart';
import 'package:job_finder/features/auth/screens/sign_in_screen.dart';
import 'package:job_finder/features/auth/widgets/header.dart';
import 'package:job_finder/features/home/screens/home_screen.dart';

class SucceffullyResetPasswordScreen extends StatelessWidget {
  static const String routeName = "/sucessfulyreset";
  const SucceffullyResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 17, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // header
                Header(
                  headerText:
                      "Your password has been updated, please change your password regularly to avoid this happening",
                  headerTitle: "Successfully",
                ),

                SizedBox(
                  height: 51,
                ),

                // image
                Image.asset('assets/images/undraw_message_sent_success.png'),

                SizedBox(
                  height: 80,
                ),

                // two button
                Column(
                  children: [
                    GlobalButton(
                        onTap: () {
                          Navigator.pushNamed(context, HomeScreen.routeName);
                        },
                        text: "continue",
                        backgroundColor: GlobalVariables.primaryColor,
                        textColor: Colors.white,
                        withIcon: false),
                    SizedBox(height: 18),
                    GlobalButton(
                        onTap: () {
                          Navigator.pushNamed(context, SignInScreen.routeName);
                        },
                        text: "back to login",
                        backgroundColor: GlobalVariables.tertiaryColor,
                        textColor: Colors.white,
                        withIcon: false),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
