// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:job_finder/common/widgets/global_button.dart';
import 'package:job_finder/constants/global_variables.dart';
import 'package:job_finder/features/auth/screens/check_email_screen.dart';
import 'package:job_finder/features/auth/screens/sign_in_screen.dart';
import 'package:job_finder/features/auth/widgets/custom_form_field.dart';
import 'package:job_finder/features/auth/widgets/header.dart';

class ForgotPasswordScreen extends StatefulWidget {
 static const String routeName = "/forgotpassword";
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailontroller = TextEditingController();


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
                        "Type your email here to confirm your account",
                    headerTitle: "Confirm your Account",
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
                        controller: _emailontroller, 
                        hint: 'email',
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  // buttons
                  GlobalButton(
                      onTap: () {
                        // Navigator.pushNamed(context, CheckEmail.routeName);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CheckEmail()));
                      },
                      text: "Confirm email",
                      backgroundColor: GlobalVariables.primaryColor,
                      textColor: Colors.white,
                      withIcon: false),

                  SizedBox(
                    height: 30,
                  ),

                  GlobalButton(
                      onTap: () {
                        // Navigator.pushNamed(context, SignInScreen.routeName);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SignInScreen()));
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