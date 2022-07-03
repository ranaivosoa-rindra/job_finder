// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_finder/common/utils/dialog.dart';
import 'package:job_finder/common/widgets/global_bottom_bar.dart';
import 'package:job_finder/constants/global_variables.dart';

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

                Container(
                  height: MediaQuery.of(context).size.width / 2.4,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color(0xFFD6CDFE),
                                  border: Border.all(
                                      color: Color(0xFFD6CDFE), width: 1),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.apple,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Product designer",
                                      style: GoogleFonts.dmSans(
                                          color: Color(0xFF150B3D),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Google inc . California, USA",
                                      style: GoogleFonts.dmSans(
                                        color:
                                            Color(0xFF524B6B).withOpacity(0.8),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Image.asset("assets/icons/Save_black.png")
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "\$15K",
                            style: GoogleFonts.dmSans(
                                color: Color(0xFF150B3D),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "/Mo",
                            style: GoogleFonts.dmSans(
                              color: Color(0xFF524B6B).withOpacity(0.8),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Material(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                                child: Container(
                                  height: 30,
                                  color: Color(0xFFCBC9D4).withOpacity(0.15),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 17, vertical: 5),
                                  child: Text(
                                    "Senior designer",
                                    style: GoogleFonts.dmSans(
                                        color: Color(0xFF150B3D),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Material(
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10.0)),
                                child: Container(
                                  height: 30,
                                  color: Color(0xFFCBC9D4).withOpacity(0.15),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 17, vertical: 5),
                                  child: Text(
                                    "Full Time",
                                    style: GoogleFonts.dmSans(
                                        color: Color(0xFF150B3D),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Material(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                                child: Container(
                                  height: 30,
                                  color: Color(0xFFFF6B2C).withOpacity(0.2),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 17, vertical: 5),
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
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
