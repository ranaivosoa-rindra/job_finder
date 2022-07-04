// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:job_finder/common/widgets/global_bottom_bar.dart';
import 'package:job_finder/features/connection/screens/connection_screen.dart';
import 'package:job_finder/features/home/screens/main_home_screen.dart';
import 'package:job_finder/features/home/widgets/bloc_title.dart';
import 'package:job_finder/features/home/widgets/card.dart';
import 'package:job_finder/features/home/widgets/card_header.dart';
import 'package:job_finder/features/home/widgets/summary_cards_list.dart';
import 'package:job_finder/features/home/widgets/top_header.dart';
import 'package:job_finder/features/messages/screens/message_screen.dart';
import 'package:job_finder/features/post/screens/add_post.dart';
import 'package:job_finder/features/save/screens/save_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  final pages = <Widget>[
    MainHomeScreen(),
    ConnectionScreen(),
    AddPost(),
    MessageScreen(),
    SaveScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F6),
      bottomNavigationBar: GlobalBottomBar(index: index, onChangedTab: onChangeTab,),
      body: pages[index],
    );
  }

  void onChangeTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}
