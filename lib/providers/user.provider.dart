import 'package:flutter/material.dart';
import 'package:job_finder/models/user.model.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(email: "", password: '', username: '', token: "");

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
