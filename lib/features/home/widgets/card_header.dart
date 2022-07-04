// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_finder/constants/global_variables.dart';

class CardHeader extends StatelessWidget {
  final String percentRemise;
  final VoidCallback onPress;
  final String imageAsset;
  const CardHeader({Key? key, required this.percentRemise, required this.onPress, required this.imageAsset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Text + button
        Container(
          margin: EdgeInsets.only(top: 28),
          width: double.infinity,
          padding: EdgeInsets.only(left: 17),
          height: 143,
          decoration: BoxDecoration(
            color: GlobalVariables.primaryColor,
            border: Border.all(width: 1, color: GlobalVariables.primaryColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$percentRemise % off',
                    style: GoogleFonts.dmSans(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "take any courses",
                    style:
                        GoogleFonts.dmSans(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: onPress,
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFFFF9228))),
                child: Text(
                  "Join Now",
                  style: GoogleFonts.dmSans(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),

        Container(
          padding: EdgeInsets.only(right: 16),
          child: Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              imageAsset,
            ),
          ),
        ),
      ],
    );
  }
}
