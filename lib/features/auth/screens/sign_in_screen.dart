// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:job_finder/constants/global_button.dart';
import 'package:job_finder/constants/global_variables.dart';
import 'package:job_finder/features/auth/screens/sign_up_screen.dart';
import 'package:job_finder/features/auth/widgets/custom_form_field.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = "/signin";
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Welcome
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: GlobalVariables.primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),  
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  // top text
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height:1.5,
                        color: Color(0xFF524B6B),
                        fontWeight: FontWeight.w400
                      )
                    ),
                  ),
                ],
              ),
              // Form
              Column(
                children: [
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
                      child: CustomFormField(withSuffixIcon: false,),
                    ),
                  ),
                  SizedBox(height: 15),
                  ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        "Password",
                        style: TextStyle(
                          color: Color(0xFF0D0140),
                          fontWeight: FontWeight.bold,
                        ),  
                      ),
                    ),
                    subtitle: Form(
                      child: CustomFormField(
                        withSuffixIcon: true,
                        suffixIconHiden: Icon(Icons.visibility_off),
                        suffixIconShown: Icon(Icons.visibility)
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  // form specific
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Transform.scale(
                            scale: 1.50,
                            child: Checkbox(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                                checkColor: GlobalVariables.secondaryColor,
                                activeColor: Color(0xFFE6E1FF),
                                value: isChecked,
                                onChanged: (bool? val) {
                                  setState(() {
                                    isChecked = val!;
                                  });
                                }),
                          ),
                          Text(
                            "Remember me",
                            style: TextStyle(
                              color: Color(0xFFAAA6B9),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),  
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Forgot Password ?",
                          style: TextStyle(
                            color: Color(0xFF0D0140),
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),  
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Column(
                children: [
                  /// Buttons
                  // login button
                  GlobalButton(
                    onTap: () {},
                    text: "login",
                    backgroundColor: GlobalVariables.primaryColor,
                    textColor: Colors.white,
                    withIcon: false,
                  ),

                  SizedBox(height: 20),

                  // google button
                  GlobalButton(
                    onTap: () {},
                    text: "sign in with google",
                    backgroundColor: GlobalVariables.tertiaryColor,
                    textColor: GlobalVariables.primaryColor,
                    withIcon: true,
                    imageAsset: "assets/icons/google_icon.png",
                  ),

                  SizedBox(height: 15),

                  // go to sign up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You don't have an account yet ?  ",
                        style: TextStyle(
                          color: Color(0xFF524B6B),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, SignUpScreen.routeName);
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: Color(0xFFFF9228),
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}