// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final bool withSuffixIcon;
  final Icon? suffixIconShown;
  final Icon? suffixIconHiden;
  final String? hintText;
  final String hint;
  final TextEditingController controller;
  const CustomFormField({
    Key? key,
    required this.withSuffixIcon,
    this.suffixIconShown,
    this.suffixIconHiden,
    this.hintText,
    required this.controller, required this.hint,
  }) : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool _isObscureText = false;

  void toogle() {
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
          ),
        ],
      ),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Color(0xFF0D0140).withOpacity(0.5),
          ),
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
                      : widget.suffixIconHiden,
                ),
        ),
        obscureText: (widget.withSuffixIcon == false)
            ? false
            : (_isObscureText == true)
                ? false
                : true,
        validator: (val) {
          if (val == null || val.isEmpty) {
            return "Enter your ${widget.hint}";
          }
          return null;
        },
        keyboardType: (widget.hintText == "Entry code")
        ? TextInputType.number
        : TextInputType.emailAddress,
      ),
    );
  }
}
