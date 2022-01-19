import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart' as fAuth;
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
import 'package:project7_2/database/firebase.dart';
import 'package:project7_2/services/auth/auth.dart';
import 'package:project7_2/view/find_places/find_places.dart';
import 'package:project7_2/view/home_screen/home_screen.dart';
import 'package:project7_2/view/new_ui/onboarding/fill.dart';
import 'package:project7_2/view/new_ui/onboarding/login.dart';
import 'package:project7_2/view/new_ui/onboarding/signup.dart';

class LoginSocial extends StatefulWidget {
  _LoginSocialState createState() => _LoginSocialState();
}

class _LoginSocialState extends State<LoginSocial> {
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
                top: Globals.getHeight(482),
                left: Globals.width * 0.05,
                child: Container(
                  height: Globals.getHeight(58),
                  width: Globals.width * 0.82,
                  child: TextButton(
                      onPressed: () async {
                        fAuth.User uc = await signInWithGoogle();
                        print('uid is' + uc.uid);
                        bool res =
                            await FirebaseDB.getUserDetails(uc.uid, context);
                        print(res);
                        if (res) {
                          Navigator.of(context).pushReplacement(PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: Data(),
                              duration: new Duration(milliseconds: 300),
                              curve: Curves.easeInOut));
                          // Navigator.pop(context);
                          Navigator.of(context).pushReplacement(PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: HomeScreen(),
                              duration: new Duration(milliseconds: 300),
                              curve: Curves.easeInOut));
                        } else {
                          print('con 2');
                          // Navigator.pop(context);
                          Navigator.of(context).pushReplacement(PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: HomeScreen(),
                              duration: new Duration(milliseconds: 300),
                              curve: Curves.easeInOut));
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: Globals.width * 0.07,
                              height: Globals.getHeight(40),
                              child: Text(
                                'G',
                                style: GoogleFonts.montserrat(
                                    fontSize: Globals.getFontSize(40),
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              )),
                          SizedBox(
                            width: Globals.width * 0.08,
                          ),
                          Container(
                            width: Globals.width * 0.55,
                            child: AutoSizeText(
                              'Login With Google'.toUpperCase(),
                              maxLines: 1,
                              style: GoogleFonts.montserrat(
                                  fontSize: Globals.getFontSize(17),
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 2.89,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      )),
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius:
                          BorderRadius.circular(Globals.getWidth(10))),
                )),
            Positioned(
                top: Globals.getHeight(558),
                left: Globals.width * 0.05,
                child: Container(
                  height: Globals.getHeight(58),
                  width: Globals.width * 0.82,
                  child: TextButton(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: Globals.width * 0.07,
                        height: Globals.getHeight(40),
                        child: Image.asset(
                          'assets/images/onboarding/apple.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: Globals.width * 0.08,
                      ),
                      Container(
                        width: Globals.width * 0.55,
                        child: AutoSizeText(
                          'Login With Apple'.toUpperCase(),
                          maxLines: 1,
                          style: GoogleFonts.montserrat(
                              fontSize: Globals.getFontSize(17),
                              fontWeight: FontWeight.w400,
                              letterSpacing: 2.89,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  )),
                  decoration: BoxDecoration(
                      color: Color(0xFF121217),
                      borderRadius:
                          BorderRadius.circular(Globals.getWidth(10))),
                )),
            Positioned(
                top: Globals.getHeight(634),
                left: Globals.width * 0.05,
                child: Container(
                  height: Globals.getHeight(58),
                  width: Globals.width * 0.82,
                  child: TextButton(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: Globals.width * 0.07,
                        height: Globals.getHeight(30),
                        child: Image.asset(
                          'assets/images/onboarding/twitter.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        width: Globals.width * 0.08,
                      ),
                      Container(
                        width: Globals.width * 0.55,
                        child: AutoSizeText(
                          'Login With Twitter'.toUpperCase(),
                          maxLines: 1,
                          style: GoogleFonts.montserrat(
                              fontSize: Globals.getFontSize(17),
                              fontWeight: FontWeight.w400,
                              letterSpacing: 2.89,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  )),
                  decoration: BoxDecoration(
                      color: Color(0xFF5FC9E9),
                      borderRadius:
                          BorderRadius.circular(Globals.getWidth(10))),
                )),
            Positioned(
                top: Globals.getHeight(760),
                left: Globals.width * 0.05,
                child: Container(
                  height: Globals.getHeight(58),
                  width: Globals.width * 0.9,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: SignUp(),
                          duration: new Duration(milliseconds: 300),
                          curve: Curves.easeInOut));
                    },
                    child: AutoSizeText(
                      'SIGN UP',
                      maxLines: 1,
                      style: GoogleFonts.montserrat(
                          fontSize: Globals.getFontSize(19),
                          fontWeight: FontWeight.w400,
                          letterSpacing: 2.89,
                          color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius:
                          BorderRadius.circular(Globals.getWidth(10))),
                )),
            Positioned(
                top: Globals.getHeight(715),
                left: Globals.getWidth(128),
                child: Container(
                    width: Globals.getWidth(44),
                    child: Divider(
                      thickness: 1.0,
                      color: Colors.white,
                    ))),
            Positioned(
                top: Globals.getHeight(715),
                left: Globals.getWidth(190),
                child: Container(
                    width: Globals.getWidth(44),
                    child: AutoSizeText(
                      'OR',
                      maxLines: 1,
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: Globals.getFontSize(12),
                          letterSpacing: 1.73,
                          fontWeight: FontWeight.w400),
                    ))),
            Positioned(
                top: Globals.getHeight(715),
                right: Globals.getWidth(142),
                child: Container(
                    width: Globals.getWidth(44),
                    child: Divider(
                      thickness: 1.0,
                      color: Colors.white,
                    ))),
            Positioned(
                top: Globals.getHeight(834),
                right: Globals.getWidth(84),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: Login(),
                        duration: new Duration(milliseconds: 300),
                        curve: Curves.easeInOut));
                  },
                  child: AutoSizeText('Already have an account? Sign in',
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Globals.getFontSize(14.6),
                          letterSpacing: 1.238)),
                )),
            Positioned(
                top: Globals.getHeight(105),
                left: Globals.getWidth(44),
                child: Container(
                  width: Globals.getWidth(315),
                  height: Globals.getHeight(315),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/onboarding/logo_with_text.png'),
                          fit: BoxFit.contain)),
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
