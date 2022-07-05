// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:job_finder/constants/global_variables.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class FullScreenLoading extends StatelessWidget {
  const FullScreenLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F6),
      body: Center(
        child: LoadingAnimationWidget.discreteCircle(
          color: GlobalVariables.secondaryColor, 
          size: 40
        ),
      ),
    );
  }
}
