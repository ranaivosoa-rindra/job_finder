// ignore_for_file: prefer_const_constructors, avoid_print, use_build_context_synchronously, prefer_final_fields

import 'dart:convert';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/common/shared/fullscreen_loading.dart';
import 'package:job_finder/common/utils/error_handler.dart';
import 'package:job_finder/constants/global_variables.dart';
import 'package:job_finder/features/auth/services/auth_service.dart';
import 'package:job_finder/features/home/widgets/bloc_title.dart';
import 'package:job_finder/features/home/widgets/card.dart';
import 'package:job_finder/features/home/widgets/card_header.dart';
import 'package:job_finder/features/home/widgets/summary_cards_list.dart';
import 'package:job_finder/features/home/widgets/top_header.dart';
import 'package:job_finder/models/job.model.dart';
import 'package:job_finder/models/user.model.dart';
import 'package:job_finder/providers/job.provider.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  AuthService auth = AuthService();
  List<Job> _jobs = [];
  late AsyncMemoizer _memoizer;

  @override
  void initState() {
    super.initState();
    _memoizer = AsyncMemoizer();
  }

  Future<User> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("x-auth-token");
    User nullUser = User(fullName: "", email: "", password: "", token: "");

    // set the x-auth-token to "" to get the new token for the new signed in user
    if (token == null) {
      prefs.setString("x-auth-token", "");
    }

    var tokenRes = await auth.loginTokenResponse(token!);

    var response = json.decode(tokenRes.body);
    if (response["detail"] == "Invalid token") {
      return nullUser;
    }

    if (response["email"] != null) {
      User user = User(
          email: json.decode(tokenRes.body)['email'],
          password: "",
          token: "",
          fullName: json.decode(tokenRes.body)['username']);
      final UserProvider usr =
          Provider.of<UserProvider>(context, listen: false);
      switch (tokenRes.statusCode) {
        case 200:
          print(user.toJson());
          usr.setUser(user.toJson());
          return user;
        //break;

        case 401:
          print('$uri/login/$token');
          final parsed = jsonDecode(response.body);
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text(response.statusCode.toString()),
                    content: Text(parsed['detail']),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Go back'),
                      ),
                    ],
                  ));
          return nullUser;
        //break;

        default:
          final parsed = jsonDecode(response.body);
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text(response.statusCode.toString()),
                    content:
                        (parsed['detail'] == null || parsed['detail'] == "")
                            ? Text("Not Found")
                            : Text(parsed['detail']),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Got it'),
                      ),
                    ],
                  ));
          return nullUser;
      }
    }
    return nullUser;
  }

  _fetchData() async {
    print(_jobs.length);
    return _memoizer.runOnce(() async {
      print("----HELLLO GET JOB----");
      http.Response jobRes = await auth.getJobsResponse();
      print("----JOB----");
      print(jobRes.body);
      print(jobRes.body.runtimeType);

      print("----------DECODED------------");
      var b = jobRes.body;
      var decoded = json.decode(b);
      print(decoded['data'][0]['attributes']);

      for (var i = 0; i < decoded['data'].length; i++) {
        _jobs.add(Job(
            job_title: decoded['data'][i]['attributes']["job_title"],
            entreprise: decoded['data'][i]['attributes']['entreprise'],
            location: decoded['data'][i]['attributes']['location'],
            experience: decoded['data'][i]['attributes']['experience'],
            job_type: decoded['data'][i]['attributes']['job_type'],
            mounthly_salary: decoded['data'][i]['attributes']
                ['mounthly_salary']));
      }
      print(_jobs[0].job_title);
      return _jobs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUserData(),
        builder: (context, AsyncSnapshot<User> snapshot) {
          if (!GlobalVariables.loadingOnce) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: FullScreenLoading());
            } else {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                GlobalVariables.loadingOnce = true;
                return homeBody();
              }
            }
          } else {
            return homeBody();
          }
        });
  }

  Widget homeBody() {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                /// header
                TopHeader(
                    username: user.fullName,
                    circleAvatarImage: "assets/images/rindra-photo.png"),

                CardHeader(
                    percentRemise: "50",
                    onPress: () {},
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

                    FutureBuilder(
                        future: _fetchData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else {
                            return ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: _jobs.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: JobCard(
                                      entreprise: _jobs[index].entreprise,
                                      location: _jobs[index].location,
                                      isImage: false,
                                      jobTitle: _jobs[index].job_title,
                                      jobType: _jobs[index].job_type,
                                      experience: _jobs[index].experience,
                                      mounthlySalary:
                                          _jobs[index].mounthly_salary,
                                      icon: Icon(Icons.apple),
                                    ),
                                  );
                                });
                          }
                        }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
