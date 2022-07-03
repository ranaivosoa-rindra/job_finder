// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_finder/common/utils/dialog.dart';
import 'package:job_finder/common/widgets/global_bottom_bar.dart';
import 'package:job_finder/constants/global_variables.dart';
import 'package:job_finder/features/home/widgets/card.dart';

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

                /// Find your job bloc
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Find Your Job",
                    style: GoogleFonts.dmSans(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width / 2.1,
                      // width: 150,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                        color: Color(0xFFAFECFE),
                        border: Border.all(
                          width: 1,
                          color: Color(0xFFAFECFE),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/search_img.png"),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "44.5k",
                            style: GoogleFonts.dmSans(
                                color: Color(0xFF0D0140),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "Remote Job",
                            style: GoogleFonts.dmSans(
                                color: Color(0xFF0D0140),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.width / 4.7,
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: BoxDecoration(
                            color: Color(0xFFBEAFFE),
                            border: Border.all(
                              width: 1,
                              color: Color(0xFFBEAFFE),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "66.8k",
                                style: GoogleFonts.dmSans(
                                    color: Color(0xFF0D0140),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Full Time",
                                style: GoogleFonts.dmSans(
                                    color: Color(0xFF0D0140),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.width / 4.7,
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFD6AD),
                            border: Border.all(
                              width: 1,
                              color: Color(0xFFFFD6AD),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "38.9k",
                                style: GoogleFonts.dmSans(
                                    color: Color(0xFF0D0140),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Part Time",
                                style: GoogleFonts.dmSans(
                                    color: Color(0xFF0D0140),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),

                /// Recent Job List
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Recent Job List",
                    style: GoogleFonts.dmSans(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                JobCard(
                  isImage: false, 
                  jobLocation: 'Google inc . California, USA', 
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