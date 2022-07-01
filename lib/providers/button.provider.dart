import 'package:flutter/material.dart';

class Button extends ChangeNotifier {
  final bool listen = false;

  void setListener() {
    listen != listen;
    notifyListeners();
  }
}
