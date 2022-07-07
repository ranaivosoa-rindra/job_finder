// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, dead_code, use_build_context_synchronously, avoid_print, no_leading_underscores_for_local_identifiers
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:job_finder/common/shared/loading.dart';
import 'package:job_finder/common/utils/dialog.dart';
import 'package:job_finder/common/utils/error_handler.dart';
import 'package:job_finder/common/utils/snackbar.dart';
import 'package:job_finder/common/widgets/global_button.dart';
import 'package:job_finder/constants/global_variables.dart';
import 'package:job_finder/features/auth/screens/forgot_password_screen.dart';
import 'package:job_finder/features/auth/screens/sign_up_screen.dart';
import 'package:job_finder/features/auth/services/auth_service.dart';
import 'package:job_finder/features/auth/widgets/custom_form_field.dart';
import 'package:job_finder/features/auth/widgets/header.dart';
import 'package:http/http.dart' as http;
import 'package:job_finder/features/home/screens/home_screen.dart';
import 'package:job_finder/features/home/screens/main_home_screen.dart';
import 'package:job_finder/providers/user.provider.dart';
import 'package:job_finder/router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = "/signin";
  static bool isLoading = false;
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // final AuthService authService = AuthService();
  bool isChecked = false;
  bool isLoading = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _signInFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _loadUserEmailPassword();
  }

  void signInUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    setState(() {
      isLoading = true;
    });
    try {
      AuthService auth = AuthService();
      http.Response response =
          await auth.signInResponse(email: email, password: password);

      errorHandler(
          response: response,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false)
                .setUser(response.body);
            await prefs.setString(
                'x-auth-token', jsonDecode(response.body)['access_token']);
            print(await prefs.setString(
                'x-auth-token', jsonDecode(response.body)['access_token']));
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        HomeScreen()));
          });
    } catch (e) {
      snackBarHandler(context: context, content: e.toString(), label: "Got it");
    }

    setState(() {
      isLoading = false;
    });
  }

  void handleRememberMe(bool? value) async {
    print("Remember me");

    print("the value");
    print(value);
    isChecked = value!;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("remember_me", value);
    prefs.setString("email", _emailController.text);
    prefs.setString("password", _passwordController.text);

    setState(() {
      isChecked = value;
    });
  }

  void _loadUserEmailPassword() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();

      var _email = _prefs.getString("email") ?? "";
      var _password = _prefs.getString("password") ?? "";
      var _rememberMe = _prefs.getBool("remember_me") ?? false;

      if (_rememberMe) {
        setState(() {
          isChecked = true;
        });
        _emailController.text = _email;
        _passwordController.text = _password;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: ((settings) => generateRoute(settings)),
      home: signInWidget(),
    );
  }

  Widget signInWidget() {
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
                        headerTitle: "Welcome Back",
                        headerText:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"),

                    SizedBox(
                      height: 50,
                    ),

                    Form(
                      key: _signInFormKey,
                      child: Column(
                        children: [
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
                                  hint: 'Password',
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
                                            onChanged: handleRememberMe),
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
                                      // Navigator.pushNamed(context,
                                      //     ForgotPasswordScreen.routeName);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ForgotPasswordScreen()));
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
                              SizedBox(
                                height: 10,
                              ),

                              (isLoading)
                                  ? Loading()
                                  : GlobalButton(
                                      onTap: () {
                                        if (_signInFormKey.currentState!
                                            .validate()) {
                                          signInUser(
                                              context: context,
                                              email: _emailController.text,
                                              password:
                                                  _passwordController.text);
                                        }
                                      },
                                      text: "login",
                                      backgroundColor:
                                          GlobalVariables.primaryColor,
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
                                      // Navigator.pushNamed(context, SignUpScreen.routeName);
                                      // Navigator.pushNamed(
                                      //     context, SignUpScreen.routeName);
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SignUpScreen()));
                                    },
                                    child: Text(
                                      "Sign up",
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
