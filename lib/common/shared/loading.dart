// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:job_finder/constants/global_variables.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        // child: SpinKitChasingDots(
        //   color: Colors.brown,
        //   size: 25.0,
        // ),
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: GlobalVariables.secondaryColor, 
          size: 40,
        ),
      ),
    );
  }
}
