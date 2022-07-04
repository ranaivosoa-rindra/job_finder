// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_finder/common/utils/dialog.dart';
import 'package:job_finder/common/widgets/global_bottom_bar.dart';
import 'package:job_finder/constants/global_variables.dart';
import 'package:job_finder/features/home/widgets/bloc_title.dart';
import 'package:job_finder/features/home/widgets/card.dart';
import 'package:job_finder/features/home/widgets/card_header.dart';
import 'package:job_finder/features/home/widgets/summary_cards_list.dart';
import 'package:job_finder/features/home/widgets/top_header.dart';

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
                TopHeader(
                  username: "G. Rindra", 
                  circleAvatarImage: "assets/images/rindra-photo.png"
                ),
                CardHeader(
                  percentRemise: "50", 
                  onPress: (){}, 
                  imageAsset: "assets/images/office-girl-image.png"
                ),

                SizedBox(
                  height: 27,
                ),

                /// Find your Job bloc
                BlocTitle(title: "Find Your Job"),

                SizedBox(
                  height: 25,
                ),

                SummaryCardsList(),

                SizedBox(
                  height: 20,
                ),

                /// Recent Job bloc
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
