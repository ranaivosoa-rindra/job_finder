// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryCard extends StatelessWidget {
  final String annualSalary;
  final String jobType;
  final Color backgroundCardColor;
  final String cardType;
  const SummaryCard({
    Key? key,
    required this.annualSalary,
    required this.jobType,
    required this.backgroundCardColor,
    required this.cardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    final double heightDivider = (cardType == "small") ? 4.7 : 2.1;
    const double widthDivider = 2.5;

    final double height = screenWidth / heightDivider;
    final double width = screenWidth / widthDivider;

    final Color textColor = Color(0xFF0D0140);

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundCardColor,
        border: Border.all(
          width: 1,
          color: backgroundCardColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${annualSalary}k',
            style: GoogleFonts.dmSans(
                color: textColor, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            jobType,
            style: GoogleFonts.dmSans(
                color: textColor, fontSize: 15, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
