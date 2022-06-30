// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:job_finder/constants/global_variables.dart';

class Header extends StatelessWidget {
  final String headerTitle;
  final String headerText;
  const Header({Key? key, required this.headerTitle, required this.headerText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Welcome
        Text(
          headerTitle,
          style: TextStyle(
              color: GlobalVariables.primaryColor,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),

        SizedBox(
          height: 10,
        ),

        // top text
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
              headerText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  height: 1.5,
                  color: Color(0xFF524B6B),
                  fontWeight: FontWeight.w400)),
        ),
      ],
    );
  }
}
