// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplyButton extends StatelessWidget {
  const ApplyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Material(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          child: Container(
            height: 30,
            color: Color(0xFFFF6B2C).withOpacity(0.2),
            padding: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
            child: Text(
              "Apply",
              style: GoogleFonts.dmSans(
                  color: Color(0xFF524B6B),
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
