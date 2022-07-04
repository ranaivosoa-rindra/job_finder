// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:job_finder/constants/global_variables.dart';

class GlobalBottomBar extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedTab;
  const GlobalBottomBar({Key? key, required this.index, required this.onChangedTab}) : super(key: key);

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
            buildTabItem(
              index: 0, 
              icon: Icon(
                Ionicons.home_outline,
                size: 25,
              ), 
              colorActive: GlobalVariables.primaryColor, 
              colorInactive: Color(0xFFA49EB5),
            ),

            buildTabItem(
              index: 1, 
              icon: Icon(
                FontAwesomeIcons.battleNet,
                size: 25,
              ), 
              colorActive: Color(0xFFFCA34D),
              colorInactive: Color(0xFFA49EB5),
            ),

            buildTabItem(
              index: 2, 
              icon:  Icon(
                Ionicons.add_circle,
                size: 35,
              ), 
              colorActive: GlobalVariables.primaryColor,
              colorInactive: GlobalVariables.primaryColor,
            ),

            buildTabItem(
              index: 3, 
              icon: Icon(
                Ionicons.chatbox_outline,
              ), 
              colorActive: Color(0xFFFCA34D),
              colorInactive: Color(0xFFA49EB5),
            ),

            buildTabItem(
              index: 4, 
              icon:  Icon(
                Ionicons.bookmark_outline,
              ), 
              colorActive: Color(0xFFFCA34D),
              colorInactive: Color(0xFFA49EB5),
            ),

            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(
            //     Ionicons.home_outline,
            //     size: 25,
            //     color: GlobalVariables.primaryColor,
            //   ),
            // ),
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(
            //     FontAwesomeIcons.battleNet,
            //     color: Color(0xFFA49EB5),
            //     size: 25,
            //   ),
            // ),
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(
            //     Ionicons.add_circle,
            //     color: GlobalVariables.primaryColor,
            //     size: 35,
            //   ),
            // ),
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(
            //     Ionicons.chatbox_outline,
            //     color: Color(0xFFA49EB5),
            //   ),
            //),
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(
            //     Ionicons.bookmark_outline,
            //     color: Color(0xFFA49EB5),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildTabItem({
    required int index,
    required Icon icon,
    required Color colorActive,
    required Color colorInactive,
  }) {
    final isSelected = index == widget.index;

    return IconTheme(
      data: IconThemeData(
        color: isSelected ? colorActive : colorInactive,
      ),
      child: IconButton(
        onPressed: () => widget.onChangedTab(index),
        icon: icon,
      ),
    );
  }
}
