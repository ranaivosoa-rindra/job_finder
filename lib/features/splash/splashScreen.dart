// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:job_finder/constants/global_variables.dart';
import 'package:job_finder/features/auth/screens/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/splash";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "Jobspot",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
              ),
              Image.asset("assets/images/splash_image.png"),
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Find Your",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35),
                      ),
                      Text(
                        "Dream Job",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: GlobalVariables.secondaryColor,
                            decoration: TextDecoration.underline),
                      ),
                      Text(
                        "Here!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 29.0, right: 62),
                child: Text(
                  "Explore all the most exciting job roles based your interest and study major.",
                  style: TextStyle(
                    fontSize: 15,
                    color: GlobalVariables.textIndigoColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 26.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    backgroundColor: GlobalVariables.primaryColor,
                    onPressed: () {
                      // Navigator.pushNamed(context, SignInScreen.routeName);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SignInScreen()));
                    },
                    child: Image.asset("assets/icons/forward_icon.png"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
