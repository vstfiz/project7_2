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
import 'package:project7_2/view/new_ui/onboarding/phone_login.dart';

import 'lockerroom_welcome.dart';
import 'login.dart';

class Singup extends StatefulWidget {
  _SingupState createState() => _SingupState();
}

class _SingupState extends State<Singup> {
  bool corrEmail = false;
  bool corrPassword = false;
  bool corrPhone = false;
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  RegExp _phoneRegex = new RegExp(r'^[1-9][0-9]{9}$');

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
                top: Globals.getHeight(782),
                left: Globals.width * 0.05,
                child: Container(
                  height: Globals.getHeight(58),
                  width: Globals.width * 0.9,
                  child: TextButton(
                    onPressed: (){
                      Navigator.of(context).push( PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: PhoneLogin(),
                          duration: new Duration(milliseconds: 300),
                          curve: Curves.easeInOut));
                    },
                    child: Text('Create account ➝'.toUpperCase(),style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w300, letterSpacing: 2.89, color: Colors.white),),
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xFF231F20),
                      borderRadius: BorderRadius.circular(Globals.getWidth(58))
                  ),
                )),
            Positioned(
                top: Globals.getHeight(105),
                left: Globals.getWidth(44),
                child: Container(
                  width: Globals.getWidth(315),
                  height: Globals.getHeight(315),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/onboarding/logo_with_text.png'),fit: BoxFit.contain
                      )
                  ),
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
                        onChanged: (value) {
                          if (EmailValidator.validate(value)) {

                            setState(() {
                              corrEmail = true;
                            });
                          }
                          else{

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
                            margin: EdgeInsets.only(right: 20.0,top: 40.0),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Center(
                              child: corrEmail?Icon(Icons.check,color: Colors.white,size: 19,):Icon(Icons.close,size: 19,color: Colors.white,),
                            ),
                          ),
                          contentPadding:
                          EdgeInsets.only(left: 20.0,bottom: 20.0),
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
                        obscureText: true,
                        obscuringCharacter: '*',
                        onChanged: (value) {
                          if (value.length>=8) {

                            setState(() {
                              corrPassword = true;
                            });
                          }
                          else{

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
                            margin: EdgeInsets.only(right: 20.0,top: 40.0),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Center(
                              child: corrPassword?Icon(Icons.check,color: Colors.white,size: 19,):Icon(Icons.close,size: 19,color: Colors.white,),
                            ),
                          ),
                          contentPadding:
                          EdgeInsets.only(left: 20.0,bottom: 20.0),
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
                        onChanged: (value) {
                          if (_phoneRegex.hasMatch(value)) {

                            setState(() {
                              corrPhone = true;
                            });
                          }
                          else{

                            setState(() {
                              corrPhone = false;
                            });

                          }
                        },
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                        keyboardType: TextInputType.phone,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          suffix: Container(
                            margin: EdgeInsets.only(right: 20.0,top: 40.0),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Center(
                              child: corrPhone?Icon(Icons.check,color: Colors.white,size: 19,):Icon(Icons.close,size: 19,color: Colors.white,),
                            ),
                          ),
                          contentPadding:
                          EdgeInsets.only(left: 20.0,bottom: 20.0),
                          hintText: 'Mobile Number',
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
                top: Globals.getHeight(855),
                right: Globals.getWidth(84),
                child: TextButton(
                  onPressed: (){
                    Navigator.of(context).push( PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: Login(),
                        duration: new Duration(milliseconds: 300),
                        curve: Curves.easeInOut));
                  },
                  child: Text('Already have an account? Sign In',
                      style: TextStyle(color: Colors.white, fontSize: 14.6,letterSpacing: 1.238)),
                )
            ),
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
