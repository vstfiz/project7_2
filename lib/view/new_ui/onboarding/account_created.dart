import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/view/new_ui/onboarding/login.dart';
import 'package:project7_2/view/new_ui/onboarding/phone_login.dart';

class AccountCreated extends StatefulWidget {
  _AccountCreatedState createState() => _AccountCreatedState();
}

class _AccountCreatedState extends State<AccountCreated> {
  bool corrEmail = false;
  bool corrPassword = false;
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Globals.height,
        width: Globals.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: Globals.getHeight(771),
                left: Globals.width * 0.05,
                child: Container(
                  height: Globals.getHeight(58),
                  width: Globals.width * 0.9,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: Login(),
                          duration: new Duration(milliseconds: 300),
                          curve: Curves.easeInOut));
                    },
                    child: Text(
                      'Login to your account'.toUpperCase(),
                      style: GoogleFonts.montserrat(
                          fontSize: Globals.getFontSize(17),
                          fontWeight: FontWeight.w400,
                          letterSpacing: 2.89,
                          color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius:
                          BorderRadius.circular(Globals.getWidth(50))),
                )),
            Positioned(
                top: Globals.getHeight(834),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: Login(),
                        duration: new Duration(milliseconds: 300),
                        curve: Curves.easeInOut));
                  },
                  child: Text('Open Gmail',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Globals.getFontSize(14.6),
                          letterSpacing: 1.238)),
                )),
            Positioned(
                top: Globals.getHeight(223),
                left: Globals.getWidth(28),
                child: Container(
                  width: Globals.getWidth(358),
                  height: Globals.getHeight(454),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/onboarding/carde.png'),
                          fit: BoxFit.fill)),
                )),
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF000000), Color(0xFF7585FF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
      ),
    );
  }
}
