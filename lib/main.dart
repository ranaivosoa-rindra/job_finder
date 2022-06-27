// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/constants/global_variables.dart';
import 'package:job_finder/features/splash/splashScreen.dart';
import 'package:job_finder/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
                )
              ,),
            ),
          ],
        ),
        nextScreen: SplashScreen(),
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}