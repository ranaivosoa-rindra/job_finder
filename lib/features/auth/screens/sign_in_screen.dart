// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:job_finder/constants/global_variables.dart';
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
        child: Column(
          children: [
            // Welcome
            Text("Welcome Back"),

            // top text
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor'),

            // Form
            Column(
              children: [
                ListTile(
                  title: Text("Email"),
                  subtitle: Form(
                    child: CustomFormField(),
                  ),
                ),
                ListTile(
                  title: Text("Password"),
                  subtitle: Form(
                    child: CustomFormField(),
                  ),
                ),
              ],
            ),

            // form specific
            Row(
              children: [
                  Transform.scale(
                    scale: 1.75,
                    child:  Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                    checkColor: GlobalVariables.secondaryColor,
                    activeColor: Color(0xFFE6E1FF),
                    value: isChecked,
                    onChanged: (bool? val) {
                      setState(() {
                        isChecked = val!;
                      });
                    }
                  ),
                ),
              ],
            ),

            // Buttons

            // go to sign up
          ],
        ),
      ),
    );
  }
}
