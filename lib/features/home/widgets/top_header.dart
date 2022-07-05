// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_finder/constants/global_variables.dart';
import 'package:job_finder/features/auth/screens/logout.dart';

class TopHeader extends StatelessWidget {
  final String username;
  final String circleAvatarImage;
  const TopHeader(
      {Key? key, required this.username, required this.circleAvatarImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello",
                style: GoogleFonts.dmSans(
                    fontSize: 22,
                    color: GlobalVariables.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "$username.",
                style: GoogleFonts.dmSans(
                    fontSize: 22,
                    color: GlobalVariables.primaryColor,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),

        // circle avatar
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LogoutPage()));
          },
          child: CircleAvatar(
            backgroundImage: AssetImage(circleAvatarImage),
          ),
        )
      ],
    );
  }
}
