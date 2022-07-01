// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:job_finder/common/widgets/global_button.dart';
import 'package:job_finder/constants/global_variables.dart';
import 'package:job_finder/features/auth/screens/sign_in_screen.dart';
import 'package:job_finder/features/auth/screens/successfully_reset_password_screen.dart';
import 'package:job_finder/features/auth/widgets/header.dart';

class CheckEmail extends StatelessWidget {
  static const String routeName = "/checkemail";
  const CheckEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String email = "ranaivosoarindra3@gmail.com";

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17, vertical: 30),
            child: Column(
              children: [
                // header
                Header(
                  headerText:
                      "We have sent the reset password to the email address",
                  headerTitle: "Check Your Email",
                ),
                // email owner
                Text(
                  email,
                  style: TextStyle(
                      color: Color(0xFF150B3D),
                      fontWeight: FontWeight.w400,
                      height: 1.5),
                ),

                SizedBox(height: 45),

                // image
                Image.asset('assets/images/undraw_message_sent_re.png'),

                SizedBox(height: 65),

                // buttons
                GlobalButton(
                    onTap: () {
                      Navigator.pushNamed(context, SucceffullyResetPasswordScreen.routeName);
                    },
                    text: "Open Your Email",
                    backgroundColor: GlobalVariables.primaryColor,
                    textColor: Colors.white,
                    withIcon: false),

                SizedBox(height: 15),

                GlobalButton(
                    onTap: () {
                      Navigator.pushNamed(context, SignInScreen.routeName);
                    },
                    text: "back to login",
                    backgroundColor: GlobalVariables.tertiaryColor,
                    textColor: Colors.white,
                    withIcon: false),

                SizedBox(height: 25),

                // resend text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You have not received the email? ",
                      style: TextStyle(
                          color: Color(0xFF150B3D),
                          fontWeight: FontWeight.w400),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Resend",
                        style: TextStyle(
                            color: GlobalVariables.secondaryColor,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
