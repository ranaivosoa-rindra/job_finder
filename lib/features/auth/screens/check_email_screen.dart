// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:job_finder/common/widgets/global_button.dart';
import 'package:job_finder/constants/global_variables.dart';
import 'package:job_finder/features/auth/screens/sign_in_screen.dart';
import 'package:job_finder/features/auth/screens/successfully_reset_password_screen.dart';
import 'package:job_finder/features/auth/widgets/custom_form_field.dart';
import 'package:job_finder/features/auth/widgets/header.dart';

class CheckEmail extends StatefulWidget {
  static const String routeName = "/checkemail";
  const CheckEmail({Key? key}) : super(key: key);

  @override
  State<CheckEmail> createState() => _CheckEmailState();
}

class _CheckEmailState extends State<CheckEmail> {

  final TextEditingController _codeController = TextEditingController();
  final _codeFormKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    String email = "ranaivosoarindra3@gmail.com";

    return Scaffold(
      body: GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus
          ?.unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 30),
              child: Column(
                children: [
                  // header
                  Header(
                    headerText:
                        "We have sent the reset password to the email address",
                    headerTitle: "Check Your Email",
                  ),
                  // email owner
                  Text(
                    email,
                    style: TextStyle(
                        color: Color(0xFF150B3D),
                        fontWeight: FontWeight.w400,
                        height: 1.5),
                  ),
      
                  SizedBox(height: 45),
      
                  // image
                  Image.asset('assets/images/undraw_message_sent_re.png'),
      
                  SizedBox(height: 50),

                  // Form to get the code from email
                  Form(
                    key: _codeFormKey,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          "Verification code",
                          style: TextStyle(
                            color: Color(0xFF0D0140),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      subtitle: CustomFormField(
                        withSuffixIcon: false, 
                        controller: _codeController, 
                        hintText: "Entry code",
                        hint: "code of 6 characters",
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),
      
                  // buttons
                  GlobalButton(
                      onTap: () {
                        // Navigator.pushNamed(context, SucceffullyResetPasswordScreen.routeName);
                        if (_codeFormKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SucceffullyResetPasswordScreen()));
                        }
                      },
                      text: "Verify code",
                      backgroundColor: GlobalVariables.primaryColor,
                      textColor: Colors.white,
                      withIcon: false),
      
                  SizedBox(height: 15),
      
                  GlobalButton(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SignInScreen()));
                      },
                      text: "back to login",
                      backgroundColor: GlobalVariables.tertiaryColor,
                      textColor: Colors.white,
                      withIcon: false),
      
                  SizedBox(height: 25),
      
                  // resend text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You have not received the email? ",
                        style: TextStyle(
                            color: Color(0xFF150B3D),
                            fontWeight: FontWeight.w400),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Resend",
                          style: TextStyle(
                              color: GlobalVariables.secondaryColor,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
