// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/constants/global_variables.dart';
import 'package:job_finder/features/auth/screens/check_email_screen.dart';
import 'package:job_finder/features/auth/screens/forgot_password_screen.dart';
import 'package:job_finder/features/auth/screens/sign_in_screen.dart';
import 'package:job_finder/features/auth/screens/sign_up_screen.dart';
import 'package:job_finder/features/auth/screens/successfully_reset_password_screen.dart';
import 'package:job_finder/features/auth/services/auth_service.dart';
import 'package:job_finder/features/splash/splashScreen.dart';
import 'package:job_finder/providers/user.provider.dart';
import 'package:job_finder/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    home: MultiProvider(
        providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
        child: const MyApp()),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
   // authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => generateRoute(settings),
      home: AnimatedSplashScreen(
        backgroundColor: GlobalVariables.primaryColor,
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
                  fontSize: 22
                ),
              ),
            ),
          ],
        ),
        nextScreen: SplashScreen(),
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
