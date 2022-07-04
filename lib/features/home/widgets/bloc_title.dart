import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlocTitle extends StatelessWidget {
  final String title;
  const BlocTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: GoogleFonts.dmSans(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
