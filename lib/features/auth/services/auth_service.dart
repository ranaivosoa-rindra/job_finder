// ignore_for_file: avoid_print, use_build_context_synchronously, prefer_const_constructors, unnecessary_string_interpolations, unnecessary_new

import 'package:http/http.dart' as http;
import 'package:job_finder/constants/global_variables.dart';
import 'package:job_finder/models/user.model.dart';

class AuthService {
  Future<http.Response> signInResponse(
      {required String email, required String password}) {
    return http.get(
      Uri.parse('$url/data?email=$email'),
      // body: {'email': email, 'password': password, "access_token": code},
      headers: {
        "Content-Type": 'application/json; charset=UTF-8',
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

  Future<http.Response> loginTokenResponse(String token) {
    return http.post(Uri.parse("$url/data?access_token=$token"),
        headers: <String, String>{'accept': 'application/json'});
  }

  Future<http.Response> getJobsResponse() {
    return http.get(Uri.parse("http://192.168.88.31:1337/api/jobs"),
        headers: <String, String>{'accept': 'application/json'});
  }
}
