// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_finder/common/utils/dialog.dart';
import 'package:job_finder/common/widgets/global_bottom_bar.dart';
import 'package:job_finder/constants/global_variables.dart';
import 'package:job_finder/features/home/widgets/bloc_title.dart';
import 'package:job_finder/features/home/widgets/card.dart';
import 'package:job_finder/features/home/widgets/summary_card.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F6),
      bottomNavigationBar: GlobalBottomBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                /// header
                // hello text
                Row(
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
                            "Gérald Rindra.",
                            style: GoogleFonts.dmSans(
                                fontSize: 22,
                                color: GlobalVariables.primaryColor,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),

                    // circle avatar
                    CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/rindra-photo.png"),
                    )
                  ],
                ),

                Stack(
                  children: [
                    // Text + button
                    Container(
                      margin: EdgeInsets.only(top: 28),
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 17),
                      height: 143,
                      decoration: BoxDecoration(
                        color: GlobalVariables.primaryColor,
                        border: Border.all(
                            width: 1, color: GlobalVariables.primaryColor),
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
                                "50 % off",
                                style: GoogleFonts.dmSans(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "take any courses",
                                style: GoogleFonts.dmSans(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFFFF9228))),
                            child: Text(
                              "Join Now",
                              style: GoogleFonts.dmSans(
                                  color: Colors.white, fontSize: 18),
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
                          "assets/images/office-girl-image.png",
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 27,
                ),

                BlocTitle(title: "Find Your Job"),

                SizedBox(
                  height: 25,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SummaryCard(
                      annualSalary: "44.5", 
                      jobType: "Remote Job", 
                      backgroundCardColor: Color(0xFFAFECFE), 
                      cardType: "big"
                    ),

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
                ),

                SizedBox(
                  height: 20,
                ),

                BlocTitle(title: 'Recent Job List',),

                SizedBox(
                  height: 20,
                ),

                JobCard(
                  isImage: false, 
                  jobCompany: 'Google inc',
                  jobLocation: 'California, USA', 
                  jobTitle: 'Product designer', 
                  jobType: 'Full Time', 
                  personType: 'Senior designer', 
                  salary: '15',
                  icon: Icon(Icons.apple),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
