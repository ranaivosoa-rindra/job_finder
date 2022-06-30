// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:job_finder/constants/global_button.dart';
import 'package:job_finder/constants/global_variables.dart';
import 'package:job_finder/features/auth/screens/check_email_screen.dart';
import 'package:job_finder/features/auth/screens/sign_in_screen.dart';
import 'package:job_finder/features/auth/widgets/custom_form_field.dart';
import 'package:job_finder/features/auth/widgets/header.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String routeName = "/forgotpassword";
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 30),
              child: Column(
                children: [
                  // header
                  Header(
                    headerText:
                        "To reset your password, you need your email or mobile number that can be authenticated?",
                    headerTitle: "Forgot Password?",
                  ),

                  SizedBox(
                    height: 50,
                  ),

                  // image
                  Image.asset("assets/images/forgot_password_image.png"),

                  SizedBox(
                    height: 50,
                  ),

                  // form
                  ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        "Email",
                        style: TextStyle(
                          color: Color(0xFF0D0140),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: Form(
                      child: CustomFormField(
                        withSuffixIcon: false,
                        hintText: "ranaivosoarindra3@gmail.com",
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  // buttons
                  GlobalButton(
                      onTap: () {
                        Navigator.pushNamed(context, CheckEmail.routeName);
                      },
                      text: "reset password",
                      backgroundColor: GlobalVariables.primaryColor,
                      textColor: Colors.white,
                      withIcon: false),

                  SizedBox(
                    height: 30,
                  ),

                  GlobalButton(
                      onTap: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                      text: "back to login",
                      backgroundColor: GlobalVariables.tertiaryColor,
                      textColor: Colors.white,
                      withIcon: false),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
