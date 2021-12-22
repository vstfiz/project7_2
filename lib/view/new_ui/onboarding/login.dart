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
import 'package:project7_2/view/home_screen/home_screen.dart';
import 'package:project7_2/view/new_ui/onboarding/forgot_password.dart';
import 'package:project7_2/view/new_ui/onboarding/loginSocial.dart';
import 'package:project7_2/view/new_ui/onboarding/phone_login.dart';
import 'package:project7_2/view/new_ui/onboarding/signup.dart' as s;
import 'package:toast/toast.dart';

import 'lockerroom_welcome.dart';

class Login extends StatefulWidget {
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool corrEmail = false;
  bool corrPassword = false;
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  Future<void> _loadingDialog(String value) {
    return showDialog<void>(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            backgroundColor: Colors.white,
            content: Container(
                height: 60,
                child: Center(
                  child: Row(
                    children: <Widget>[
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        value,
                        style: TextStyle(
                            fontFamily: "Livvic",
                            fontSize: 23,
                            letterSpacing: 1),
                      )
                    ],
                  ),
                ))));
  }

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
                top: Globals.getHeight(628),
                left: Globals.width * 0.1,
                child: Container(
                  height: Globals.getHeight(58),
                  width: Globals.width * 0.8,
                  child: TextButton(
                    onPressed: () async {
                      try {
                        _loadingDialog('Logging In');
                        if (EmailValidator.validate(_usernameController.text)) {
                          if (_passwordController.text != '') {
                            auth = fAuth.FirebaseAuth.instance;
                            fAuth.User uc =
                                (await auth.signInWithEmailAndPassword(
                                        email: _usernameController.text,
                                        password: _passwordController.text))
                                    .user;
                            await FirebaseDB.getData();
                            Navigator.pop(context);
                            Navigator.of(context).pushReplacement(
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: HomeScreen(),
                                    duration: new Duration(milliseconds: 300),
                                    curve: Curves.easeInOut));
                          } else {
                            Toast.show('Please enter Password', context);
                          }
                        } else {
                          Toast.show('Please enter Username', context);
                        }
                      } catch (e) {
                        Navigator.pop(context);
                        Toast.show(e.toString(), context);
                      }
                    },
                    child: Text(
                      'SIGN IN',
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 2.89,
                          color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xFF7585FF),
                      borderRadius:
                          BorderRadius.circular(Globals.getWidth(58))),
                )),
            Positioned(
                top: Globals.getHeight(719),
                left: Globals.getWidth(128),
                child: Container(
                    width: Globals.getWidth(44),
                    child: Divider(
                      thickness: 1.0,
                      color: Colors.white,
                    ))),
            Positioned(
                top: Globals.getHeight(719),
                left: Globals.getWidth(190),
                child: Container(
                    width: Globals.getWidth(44),
                    child: Text(
                      'OR',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 12,
                          letterSpacing: 1.73,
                          fontWeight: FontWeight.w400),
                    ))),
            Positioned(
                top: Globals.getHeight(719),
                right: Globals.getWidth(142),
                child: Container(
                    width: Globals.getWidth(44),
                    child: Divider(
                      thickness: 1.0,
                      color: Colors.white,
                    ))),
            Positioned(
                top: Globals.getHeight(755),
                left: Globals.width * 0.1,
                child: Container(
                  height: Globals.getHeight(58),
                  width: Globals.width * 0.8,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: PhoneLogin(),
                          duration: new Duration(milliseconds: 300),
                          curve: Curves.easeInOut));
                    },
                    child: Text(
                      'ENTER MOBILE NUMBER',
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.67,
                          color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius:
                          BorderRadius.circular(Globals.getWidth(58))),
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
            Positioned(
                top: Globals.getHeight(449),
                left: Globals.width * 0.1,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 15.0,
                      sigmaY: 15.0,
                    ),
                    child: Container(
                      height: Globals.height * 0.065,
                      width: Globals.width * 0.8,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(20, 15, 38, 0.5),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: TextField(
                        controller: _usernameController,
                        onChanged: (value) {
                          if (EmailValidator.validate(value)) {
                            setState(() {
                              corrEmail = true;
                            });
                          } else {
                            setState(() {
                              corrEmail = false;
                            });
                          }
                        },
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          suffix: Container(
                            margin: EdgeInsets.only(right: 20.0, top: 40.0),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Center(
                              child: corrEmail
                                  ? Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 19,
                                    )
                                  : Icon(
                                      Icons.close,
                                      size: 19,
                                      color: Colors.white,
                                    ),
                            ),
                          ),
                          contentPadding:
                              EdgeInsets.only(left: 20.0, bottom: 20.0),
                          hintText: 'Email',
                          hintStyle: GoogleFonts.montserrat(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                )),
            Positioned(
                top: Globals.getHeight(535),
                left: Globals.width * 0.1,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 15.0,
                      sigmaY: 15.0,
                    ),
                    child: Container(
                      height: Globals.height * 0.065,
                      width: Globals.width * 0.8,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(20, 15, 38, 0.5),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        obscuringCharacter: '*',
                        onChanged: (value) {
                          if (value.length >= 8) {
                            setState(() {
                              corrPassword = true;
                            });
                          } else {
                            setState(() {
                              corrPassword = false;
                            });
                          }
                        },
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          suffix: Container(
                            margin: EdgeInsets.only(right: 20.0, top: 40.0),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Center(
                              child: corrPassword
                                  ? Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 19,
                                    )
                                  : Icon(
                                      Icons.close,
                                      size: 19,
                                      color: Colors.white,
                                    ),
                            ),
                          ),
                          contentPadding:
                              EdgeInsets.only(left: 20.0, bottom: 20.0),
                          hintText: 'Password',
                          hintStyle: GoogleFonts.montserrat(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                )),
            Positioned(
                top: Globals.getHeight(848),
                left: Globals.getWidth(18),
                child: Container(
                    child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: ForgotPassword(),
                        duration: new Duration(milliseconds: 300),
                        curve: Curves.easeInOut));
                  },
                  child: Text(
                    'Forgot Details ?',
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.73),
                  ),
                ))),
            Positioned(
                top: Globals.getHeight(848),
                right: Globals.getWidth(32),
                child: Container(
                    child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: s.Singup(),
                        duration: new Duration(milliseconds: 300),
                        curve: Curves.easeInOut));
                  },
                  child: Text(
                    'Create Account',
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.73),
                  ),
                ))),
            Positioned(
                top: Globals.getHeight(848),
                child: Container(
                    child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: LoginSocial(),
                        duration: new Duration(milliseconds: 300),
                        curve: Curves.easeInOut));
                  },
                  child: Text(
                    'Social',
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.73),
                  ),
                ))),
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
