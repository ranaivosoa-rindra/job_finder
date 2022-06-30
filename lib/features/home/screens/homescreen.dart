// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
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
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: (){}, 
                icon: Icon(
                  Icons.home_outlined, 
                  size: 28, 
                  color: GlobalVariables.primaryColor,
                ),
              ),
              IconButton(
                onPressed: (){}, 
                icon: Image.asset("assets/icons/Connection_inactive.png")
              ),
              IconButton(
                onPressed: (){}, 
                icon: Container(
                  decoration: BoxDecoration(
                    color: GlobalVariables.primaryColor,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: (){}, 
                icon: Icon(
                  Icons.chat_bubble_outline_rounded,
                  color: Color(0xFFA49EB5),  
                )
              ),
              IconButton(
                onPressed: (){}, 
                icon: Image.asset("assets/icons/save_inactive.png")
              ),
            ],
          ),
        ),
      ), 
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                /// header
                // hello text
                Text("Home screen"),

                // circle avatar

                /// image
                
                
                /// Find your job bloc
                
                
                /// Recent Job List
              ],
            ),
          ),
        ),
      ),
    );
  }
}
