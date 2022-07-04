// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:job_finder/features/home/widgets/summary_card.dart';

class SummaryCardsList extends StatelessWidget {
  const SummaryCardsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SummaryCard(
            annualSalary: "44.5",
            jobType: "Remote Job",
            backgroundCardColor: Color(0xFFAFECFE),
            cardType: "big"),
        Column(
          children: [
            SummaryCard(
              annualSalary: "66.5",
              jobType: "Full Time",
              backgroundCardColor: Color(0xFFBEAFFE),
              cardType: "small",
            ),
            SizedBox(
              height: 20,
            ),
            SummaryCard(
              annualSalary: "38.9",
              jobType: "Part Time",
              backgroundCardColor: Color(0xFFFFD6AD),
              cardType: "small",
            ),
          ],
        ),
      ],
    );
  }
}
