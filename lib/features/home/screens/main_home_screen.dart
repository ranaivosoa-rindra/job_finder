// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:job_finder/features/auth/services/auth_service.dart';
import 'package:job_finder/features/home/widgets/bloc_title.dart';
import 'package:job_finder/features/home/widgets/card.dart';
import 'package:job_finder/features/home/widgets/card_header.dart';
import 'package:job_finder/features/home/widgets/summary_cards_list.dart';
import 'package:job_finder/features/home/widgets/top_header.dart';
import 'package:job_finder/providers/user.provider.dart';
import 'package:provider/provider.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    AuthService authService = AuthService();

    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              /// header
              TopHeader(
                  username: user.username,
                  circleAvatarImage: "assets/images/rindra-photo.png"),

              Center(
                child: Text(user.toJson()),
              ),
              CardHeader(
                  percentRemise: "50",
                  onPress: () {
                    authService.getUserData(context);
                  },
                  imageAsset: "assets/images/office-girl-image.png"),

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
              BlocTitle(
                title: 'Recent Job List',
              ),

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
    );
  }
}
