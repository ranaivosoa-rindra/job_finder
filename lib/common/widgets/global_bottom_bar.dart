// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:job_finder/constants/global_variables.dart';

class GlobalBottomBar extends StatefulWidget {
  const GlobalBottomBar({Key? key}) : super(key: key);

  @override
  State<GlobalBottomBar> createState() => _GlobalBottomBarState();
}

class _GlobalBottomBarState extends State<GlobalBottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home_outlined,
                size: 28,
                color: GlobalVariables.primaryColor,
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Image.asset("assets/icons/Connection_inactive.png")),
            IconButton(
              onPressed: () {},
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
                onPressed: () {},
                icon: Icon(
                  Icons.chat_bubble_outline_rounded,
                  color: Color(0xFFA49EB5),
                )),
            IconButton(
                onPressed: () {},
                icon: Image.asset("assets/icons/save_inactive.png")),
          ],
        ),
      ),
    );
  }
}
