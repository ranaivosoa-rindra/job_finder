

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({Key? key}) : super(key: key);

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('SaveScreen'),
      );
  }
}