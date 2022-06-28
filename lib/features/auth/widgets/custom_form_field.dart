// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final bool withSuffixIcon;
  final Icon? suffixIconShown;
  final Icon? suffixIconHiden;
  const CustomFormField(
      {Key? key,
      required this.withSuffixIcon,
      this.suffixIconShown,
      this.suffixIconHiden,})
      : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool _isObscureText = true;

  void toogle(){
    setState(() {
      _isObscureText = !_isObscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xFFF7F8FB),
            blurRadius: 10,
            spreadRadius: 10,
            offset: Offset(0, 10),
          )
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: (widget.withSuffixIcon == false)
              ? null
              : InkWell(
                  onTap: toogle,
                  child: (_isObscureText == true) 
                  ? widget.suffixIconShown
                  : widget.suffixIconHiden
                  ,
                ),
        ),
        obscureText: (widget.withSuffixIcon == false)
          ? false
          : (_isObscureText == true) 
          ? false
          : true
        ,
      ),
    );
  }
}
