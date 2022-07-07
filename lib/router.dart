// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:job_finder/features/auth/screens/check_email_screen.dart';
import 'package:job_finder/features/auth/screens/forgot_password_screen.dart';
import 'package:job_finder/features/auth/screens/sign_in_screen.dart';
import 'package:job_finder/features/auth/screens/sign_up_screen.dart';
import 'package:job_finder/features/auth/screens/successfully_reset_password_screen.dart';
import 'package:job_finder/features/home/screens/home_screen.dart';
import 'package:job_finder/features/home/screens/main_home_screen.dart';
import 'package:job_finder/features/splash/splashScreen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, 
          builder: (_) => SplashScreen(),
        );

    // fix the problem : "Could not find a generator for route RouteSettings(“/home, null)" 
    // case MainHomeScreen.routeName:
    // return MaterialPageRoute(
    //     settings: routeSettings, 
    //     builder: (_) => MainHomeScreen(),
    // );

    case SignInScreen.routeName:
      return PageRouteBuilder(
        settings: routeSettings,
        // builder: (_) => SignInScreen(), 
        pageBuilder: (_, __, ___) => SignInScreen(),
        transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c)
      );

    case SignUpScreen.routeName:
      return PageRouteBuilder(
        settings: routeSettings,
        // builder: (_) => SignUpScreen()
        pageBuilder: (_, __, ___) => SignUpScreen(),
        transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c)
      );

    case ForgotPasswordScreen.routeName:
      return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => ForgotPasswordScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );


    case CheckEmail.routeName:
    return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => CheckEmail(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );

    case SucceffullyResetPasswordScreen.routeName:
      return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SucceffullyResetPasswordScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );

      case HomeScreen.routeName:
      return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
      
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => Scaffold(
          body: Center(
            child: Text("No screen found"),
          ),
        ) 
    );
  }
}
