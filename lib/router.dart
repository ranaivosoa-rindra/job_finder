// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:job_finder/features/auth/screens/auth_screen.dart';
import 'package:job_finder/features/splash/splashScreen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, 
          builder: (_) => SplashScreen()
        );

    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AuthScreen()
      );
      
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => Scaffold(
          body: Center(
            child: Text("data"),
          ),
        ) 
    );
  }
}
