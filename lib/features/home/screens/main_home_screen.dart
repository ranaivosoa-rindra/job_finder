// ignore_for_file: prefer_const_constructors, avoid_print, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:job_finder/common/shared/fullscreen_loading.dart';
import 'package:job_finder/common/shared/loading.dart';
import 'package:job_finder/constants/global_variables.dart';
import 'package:job_finder/features/auth/services/auth_service.dart';
import 'package:job_finder/features/home/widgets/bloc_title.dart';
import 'package:job_finder/features/home/widgets/card.dart';
import 'package:job_finder/features/home/widgets/card_header.dart';
import 'package:job_finder/features/home/widgets/summary_cards_list.dart';
import 'package:job_finder/features/home/widgets/top_header.dart';
import 'package:job_finder/models/user.model.dart';
import 'package:job_finder/providers/user.provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  AuthService authService = AuthService();
  User _user = User(email: "", password: "", token: "", username: "");
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    getUserData(context);
    delaying();
    // authService.getUserData(context);
  }

  @override
  void didChangeDependencies() {
    // authService.getUserData(context);
    getUserData(context);
    super.didChangeDependencies();
  }

  // get user data
  void getUserData(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("x-auth-token");

    // set the x-auth-token to "" to get the new token for the new signed in user
    if (token == null) {
      prefs.setString("x-auth-token", "");
    }

    print(prefs.getString("x-auth-token"));
    http.Response tokenRes = await http.post(Uri.parse("$uri/login/$token"),
        headers: <String, String>{'accept': 'application/json'});

    print("BODY");
    print(tokenRes.body);

    var response = json.decode(tokenRes.body);
    if (response["detail"] == "Invalid token") {
      print("ERRORRRRRR");
      return;
    }

    if (response["email"] != null) {
      User user = User(
          email: json.decode(tokenRes.body)['email'],
          password: "",
          token: "",
          username: json.decode(tokenRes.body)['username']);
      switch (tokenRes.statusCode) {
        case 200:
          print("STATUS CODE");
          print(tokenRes.statusCode);
          print(user.toJson());
          Provider.of<UserProvider>(context, listen: false)
              .setUser(user.toJson());
          setState(() {
            _user = user;
          });
          print("new user");
          print(_user);
          break;

        case 401:
          print("ERROR 401");
          print('$uri/login/$token');
          break;

        default:
          print("ERROR Unknown Error");
          print(tokenRes.body);
          break;
      }
    }
  }

  Future delaying() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (_isLoading)
    ? FullScreenLoading()
    : homeBody();
  }

  Widget homeBody() {
    final user = Provider.of<UserProvider>(context, listen: false).user;
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

              CardHeader(
                  percentRemise: "50",
                  onPress: () {
                    // getUserData(context);
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
