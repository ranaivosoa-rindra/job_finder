// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JobButton extends StatefulWidget {
  final String jobSpecificity;
  const JobButton({Key? key, required this.jobSpecificity}) : super(key: key);

  @override
  State<JobButton> createState() => _JobButtonState();
}

class _JobButtonState extends State<JobButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          child: Container(
            height: 30,
            color: Color(0xFFCBC9D4).withOpacity(0.15),
            padding: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
            child: Text(
              widget.jobSpecificity,
              style: GoogleFonts.dmSans(
                  color: Color(0xFF150B3D),
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      );
  }
}
