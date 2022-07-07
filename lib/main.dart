// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:convert';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/constants/global_variables.dart';
import 'package:job_finder/features/auth/services/auth_service.dart';
import 'package:job_finder/features/home/screens/home_screen.dart';
import 'package:job_finder/features/splash/splashScreen.dart';
import 'package:job_finder/providers/user.provider.dart';
import 'package:job_finder/router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // AuthService auth = AuthService();
  bool lastUserExist = false;

  Future<http.Response> signUpResponse(String? token) {
    return http.post(Uri.parse("$uri/login/$token"),
        headers: <String, String>{'accept': 'application/json'});
  }

  void _loadLastUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("x-auth-token");
    print("GET last usr");
    print(token);

    // Check token validity
    // http.Response tokenRes = await http.post(Uri.parse("$uri/login/$token"),
    //     headers: <String, String>{'accept': 'application/json'});

    // http.Response tokenRes = await signUpResponse(token);
    // print("BODY IN THE MAIN");
    // print(tokenRes.body);
    // var response = json.decode(tokenRes.body);

    // if (response["detail"] == "Invalid token") {
    //   print("Token validity expired");
    //   return;
    // } else {
    //   if (token != null || token != "") {
    //     print("Token still valid");
    //     print("He exist");
    //     setState(() {
    //       lastUserExist = true;
    //     });
    //   }
    // }
    if (token != null || token != "") {
      print("He exist");
      setState(() {
        lastUserExist = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadLastUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => generateRoute(settings),
      home: AnimatedSplashScreen(
        backgroundColor: GlobalVariables.primaryColor,
        duration: 3000,
        splash: Column(
          children: [
            Expanded(
              child: Image.asset("assets/logo/Logo.png"),
            ),
            SizedBox(
              height: 6,
            ),
            Expanded(
              child: Text(
                "Jobspot",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ),
          ],
        ),
        nextScreen: (lastUserExist) ? HomeScreen() : SplashScreen(),
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
