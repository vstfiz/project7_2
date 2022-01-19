import 'dart:ui';

import 'package:achievement_view/achievement_view.dart';
import 'package:achievement_view/achievement_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/custom/spinner_loader/spinner.dart';
import 'package:project7_2/services/auth/auth.dart';
import 'package:project7_2/view/new_ui/onboarding/phone_login.dart';
import 'package:toast/toast.dart';


import 'login.dart';
import 'otp.dart';

class SignUp extends StatefulWidget {
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool corrEmail = false;
  bool corrPassword = false;
  bool corrPhone = false;
  bool isSpinnerOpen = false;
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  RegExp _phoneRegex = new RegExp(r'^(\+[0-9]{1,3})[0-9]{9}$');

  Future<void> _loadingDialog(String value) {
    return showDialog<void>(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            backgroundColor: Colors.white,
            content: Container(
                height: Globals.getHeight(80),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Creating account'.toUpperCase(),
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: Globals.getFontSize(20),
                          letterSpacing: 1.6),
                    ),
                    Container(
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.blueGrey),
                        ),
                        width: Globals.getWidth(200))
                  ],
                )))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Globals.height,
        width: Globals.width,
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: Globals.height,
                width: Globals.width,
              ),
              Positioned(
                  top: Globals.getHeight(782),
                  left: isSpinnerOpen
                      ? Globals.getWidth(157)
                      : Globals.width * 0.05,
                  child: isSpinnerOpen
                      ? Spinner()
                      : Container(
                          height: Globals.getHeight(58),
                          width: Globals.width * 0.9,
                          child: TextButton(
                            onPressed: () async {
                              if (corrEmail) {
                                if (corrPassword) {
                                  if (corrPhone) {
                                    setState(() {
                                      isSpinnerOpen = true;
                                    });
                                    Globals.creationEmail =
                                        _usernameController.text;
                                    Globals.creationPass =
                                        _passwordController.text;
                                    Globals.creationPhone =
                                        _phoneController.text;
                                    auth = FirebaseAuth.instance;
                                    UserCredential u = await auth
                                        .createUserWithEmailAndPassword(
                                            email: _usernameController.text,
                                            password: _passwordController.text);
                                    Navigator.of(context).push(PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: OTP(_phoneController.text),
                                        duration:
                                            new Duration(milliseconds: 300),
                                        curve: Curves.easeInOut));
                                  } else {
                                    AchievementView(context,
                                        title: "Invalid Phone Number",
                                        subTitle:
                                            'Please Enter a valid phone number with \'+ Country Code\'',
                                        //onTab: _onTabAchievement,
                                        icon: Icon(
                                          Icons.clear,
                                          color: Colors.red,
                                          size: 24,
                                        ),
                                        typeAnimationContent:
                                            AnimationTypeAchievement
                                                .fadeSlideToUp,
                                        borderRadius: 5.0,
                                        color: Colors.blueGrey,
                                        alignment: Alignment.topCenter,
                                        duration: Duration(milliseconds: 1500),
                                        isCircle: true)
                                      ..show();
                                  }
                                } else {
                                  AchievementView(context,
                                      title: "Invalid Password",
                                      subTitle:
                                          'Please Enter a valid password of minimum length 8',
                                      //onTab: _onTabAchievement,
                                      icon: Icon(
                                        Icons.clear,
                                        color: Colors.red,
                                        size: 24,
                                      ),
                                      typeAnimationContent:
                                          AnimationTypeAchievement
                                              .fadeSlideToUp,
                                      borderRadius: 5.0,
                                      color: Colors.blueGrey,
                                      alignment: Alignment.topCenter,
                                      duration: Duration(milliseconds: 1500),
                                      isCircle: true)
                                    ..show();
                                }
                              } else {
                                AchievementView(context,
                                    title: "Invalid Email Address",
                                    subTitle:
                                        'Please Enter a valid email address',
                                    //onTab: _onTabAchievement,
                                    icon: Icon(
                                      Icons.clear,
                                      color: Colors.red,
                                      size: 24,
                                    ),
                                    typeAnimationContent:
                                        AnimationTypeAchievement.fadeSlideToUp,
                                    borderRadius: 5.0,
                                    color: Colors.blueGrey,
                                    alignment: Alignment.topCenter,
                                    duration: Duration(milliseconds: 1500),
                                    isCircle: true)
                                  ..show();
                              }
                            },
                            child: Text(
                              'Create account ➝'.toUpperCase(),
                              style: GoogleFonts.montserrat(
                                  fontSize: Globals.getFontSize(20),
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 2.89,
                                  color: Colors.white),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xFF231F20),
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
                  top: Globals.getHeight(472),
                  left: Globals.width * 0.05,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 15.0,
                        sigmaY: 15.0,
                      ),
                      child: Container(
                        height: Globals.height * 0.065,
                        width: Globals.width * 0.9,
                        decoration: BoxDecoration(
                          backgroundBlendMode: BlendMode.overlay,
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: TextField(
                          controller: _usernameController,
                          textInputAction: TextInputAction.next,
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
                              fontSize: Globals.getFontSize(20),
                              fontWeight: FontWeight.w400),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffix: Container(
                              margin: EdgeInsets.only(right: Globals.getWidth(20),top: Globals.getHeight(40)),
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
                                fontSize: Globals.getFontSize(20),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  )),
              Positioned(
                  top: Globals.getHeight(550),
                  left: Globals.width * 0.05,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 15.0,
                        sigmaY: 15.0,
                      ),
                      child: Container(
                        height: Globals.height * 0.065,
                        width: Globals.width * 0.9,
                        decoration: BoxDecoration(
                          backgroundBlendMode: BlendMode.overlay,
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: TextField(
                          controller: _passwordController,
                          textInputAction: TextInputAction.next,
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
                              fontSize: Globals.getFontSize(20),
                              fontWeight: FontWeight.w400),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffix: Container(
                              margin: EdgeInsets.only(right: Globals.getWidth(20),top: Globals.getHeight(40)),
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
                                fontSize: Globals.getFontSize(20),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  )),
              Positioned(
                  top: Globals.getHeight(629),
                  left: Globals.width * 0.05,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 15.0,
                        sigmaY: 15.0,
                      ),
                      child: Container(
                        height: Globals.height * 0.065,
                        width: Globals.width * 0.9,
                        decoration: BoxDecoration(
                          backgroundBlendMode: BlendMode.overlay,
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: TextField(
                          controller: _phoneController,
                          textInputAction: TextInputAction.done,
                          onChanged: (value) {
                            if (_phoneRegex.hasMatch(value)) {
                              setState(() {
                                corrPhone = true;
                              });
                            } else {
                              setState(() {
                                corrPhone = false;
                              });
                            }
                          },
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: Globals.getFontSize(20),
                              fontWeight: FontWeight.w400),
                          keyboardType: TextInputType.phone,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffix: Container(
                              margin: EdgeInsets.only(right: Globals.getWidth(20),top: Globals.getHeight(40)),
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: Center(
                                child: corrPhone
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
                            hintText: 'Mobile Number',
                            hintStyle: GoogleFonts.montserrat(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: Globals.getFontSize(20),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  )),
              Positioned(
                  top: Globals.getHeight(855),
                  right: Globals.getWidth(84),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: Login(),
                          duration: new Duration(milliseconds: 300),
                          curve: Curves.easeInOut));
                    },
                    child: Text('Already have an account? Sign In',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Globals.getFontSize(14.6),
                            letterSpacing: 1.238)),
                  )),
            ],
          ),
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
