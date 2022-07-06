// ignore_for_file: avoid_print, use_build_context_synchronously, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:job_finder/constants/global_variables.dart';
import 'package:job_finder/models/user.model.dart';
import 'package:job_finder/providers/user.provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  Future<http.Response> signInResponse(
      {required String email, required String password}) {
    return http.post(
      Uri.parse('$uri/login/token'),
      body: {'username': email, 'password': password},
      headers: {
        "Content-Type": 'application/x-www-form-urlencoded; charset=UTF-8',
      },
    );
  }

  Future<http.Response> signUpResponse(User user) {
    return http.post(
      Uri.parse('$uri/users/'),
      body: user.toJson(),
      headers: {
        "Content-Type": 'application/json; charset=UTF-8',
      },
    );
  }
}
