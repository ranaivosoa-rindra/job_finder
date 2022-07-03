// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_build_context_synchronously, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:job_finder/common/shared/loading.dart';
import 'package:job_finder/common/utils/dialog.dart';
import 'package:job_finder/common/widgets/global_button.dart';
import 'package:job_finder/constants/global_variables.dart';
import 'package:job_finder/features/auth/screens/forgot_password_screen.dart';
import 'package:job_finder/features/auth/screens/sign_in_screen.dart';
import 'package:job_finder/features/auth/widgets/custom_form_field.dart';
import 'package:job_finder/features/auth/widgets/header.dart';
import 'package:http/http.dart' as http;
import 'package:job_finder/models/user.model.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = "/signup";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isChecked = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final _signUpFormKey = GlobalKey<FormState>();

  bool isLoading = false;

  void signUpUser(
      {required BuildContext context,
      required String username,
      required String email,
      required String password}) async {
    setState(() {
      isLoading = true;
    });

    User user = User(
      email: email,
      password: password,
      username: username,
    );

    try {
      http.Response response = await http.post(
        Uri.parse('$uri/users/'),
        body: user.toJson(),
        headers: {
          "Content-Type": 'application/json; charset=UTF-8',
        },
      );

      switch (response.statusCode) {
        case 200:
          dialog(context, "Success", "User created sucessfully",
              () => Navigator.pushNamed(context, SignInScreen.routeName), "OK");
          break;

        default:
          final parsed = jsonDecode(response.body);
          dialog(
            context, 
            "Error ${response.statusCode}", 
            (parsed['detail'] == null || parsed['detail'] == "") 
            ? "Not Found"
            : parsed['detail']
            ,
              () => Navigator.pop(context), 
              'OK');
          break;
      }
    } catch (e) {
      dialog(
          context, "Error", e.toString(), () => Navigator.pop(context), 'OK');
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus
          ?.unfocus(), // set focus out when the user click anywhere else
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 30),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // header
                    Header(
                        headerTitle: "Create an Account",
                        headerText:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"),

                    SizedBox(
                      height: 50,
                    ),

                    // Form

                    Form(
                      key: _signUpFormKey,
                      child: Column(
                        children: [
                          Column(
                            children: [
                              ListTile(
                                title: Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: Text(
                                    "Full name",
                                    style: TextStyle(
                                      color: Color(0xFF0D0140),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                subtitle: CustomFormField(
                                  withSuffixIcon: false,
                                  hintText: "rindra",
                                  controller: _nameController,
                                  hint: 'fullname',
                                ),
                              ),
                              SizedBox(height: 15),
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
                                subtitle: CustomFormField(
                                    withSuffixIcon: false,
                                    hintText: "ranaivosoarindra3@gmail.com",
                                    controller: _emailController,
                                    hint: 'email',
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
                                subtitle: CustomFormField(
                                  withSuffixIcon: true,
                                  suffixIconHiden: Icon(Icons.visibility_off),
                                  suffixIconShown: Icon(Icons.visibility),
                                  controller: _passwordController,
                                  hint: 'password',
                                ),
                              ),

                              SizedBox(height: 10),

                              // form specific
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Transform.scale(
                                        scale: 1.50,
                                        child: Checkbox(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            checkColor:
                                                GlobalVariables.secondaryColor,
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
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context,
                                          ForgotPasswordScreen.routeName);
                                    },
                                    child: Text(
                                      "Forgot Password ?",
                                      style: TextStyle(
                                        color: Color(0xFF0D0140),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 37,
                          ),
                          Column(
                            children: [
                              /// Buttons
                              // login button

                              (isLoading)
                                  ? Loading()
                                  : GlobalButton(
                                      onTap: () {
                                        if (_signUpFormKey.currentState!
                                            .validate()) {
                                          signUpUser(
                                              context: context,
                                              username: _nameController.text,
                                              email: _emailController.text,
                                              password:
                                                  _passwordController.text);
                                        }
                                      },
                                      text: "sign up",
                                      backgroundColor:
                                          GlobalVariables.primaryColor,
                                      textColor: Colors.white,
                                      withIcon: false,
                                    ),

                              SizedBox(height: 20),

                              // google button
                              GlobalButton(
                                onTap: () {},
                                text: "sign up with google",
                                backgroundColor: GlobalVariables.tertiaryColor,
                                textColor: Colors.white,
                                withIcon: true,
                                imageAsset: "assets/icons/google_icon.png",
                              ),

                              SizedBox(height: 15),

                              // go to sign up
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Already have an account ?  ",
                                    style: TextStyle(
                                      color: Color(0xFF524B6B),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, SignInScreen.routeName);
                                    },
                                    child: Text(
                                      "Sign in",
                                      style: TextStyle(
                                          color: Color(0xFFFF9228),
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
