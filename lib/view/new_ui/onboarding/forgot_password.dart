import 'dart:collection';
import 'dart:ui';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project7_2/custom/globals.dart';

class ForgotPassword extends StatefulWidget {
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  bool corrEmail = false;
  bool corrPhone = false;
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
            Container(
              width: Globals.width,
              height: Globals.height,
            ),
            Positioned(
              child: Container(
                  height: Globals.getHeight(50),
                  child: Text(
                    'forgot password'.toUpperCase(),
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        letterSpacing: 1.59),
                  )),
              top: Globals.getHeight(64),
            ),
            Positioned(
              child: Container(
                height: Globals.getHeight(30),
                width: Globals.getWidth(30),
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.clear,
                      color: Colors.white,
                      size: 30,
                    )),
              ),
              top: Globals.getHeight(70),
              left: Globals.getWidth(10),
            ),
            Positioned(
                top: Globals.getHeight(123),
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
                        backgroundBlendMode: BlendMode.overlay,
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
              child: Container(
                  height: Globals.getHeight(50),
                  child: Text(
                    'or'.toUpperCase(),
                    style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        letterSpacing: 1.66),
                  )),
              top: Globals.getHeight(195),
            ),
            Positioned(
                top: Globals.getHeight(218),
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
                        backgroundBlendMode: BlendMode.overlay,
                        color: Color.fromRGBO(20, 15, 38, 0.5),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: TextField(
                        controller: _phoneController,
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
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                        keyboardType: TextInputType.phone,
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
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                )),
            Positioned(
                top: Globals.getHeight(345),
                left: Globals.width * 0.1,
                child: Container(
                  height: Globals.getHeight(58),
                  width: Globals.width * 0.8,
                  child: TextButton(
                    child: Text(
                      'RESET PASSWORD',
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 2.89,
                          color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xFF231F20),
                      borderRadius:
                          BorderRadius.circular(Globals.getWidth(55))),
                )),
            Positioned(
              child: Container(
                  height: Globals.getHeight(50),
                  child: Text(
                    'Enter your email address or phone number\nto reset the password.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        letterSpacing: 0.17),
                  )),
              top: Globals.getHeight(434),
            ),
            // Positioned(
            //   child: Container(
            //     height: Globals.getHeight(200),
            //     width: Globals.width * 0.8,
            //     decoration: BoxDecoration(
            //         image: DecorationImage(
            //             image: AssetImage(
            //               defaultImageAddress + Globals.status + '.png' ,
            //             ),
            //             fit: BoxFit.contain)),
            //   ),
            //   top: Globals.getHeight(320),
            // ),
            // Positioned(
            //   child: Container(
            //     height: Globals.getHeight(50),
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(Globals.getWidth(100))),
            //     child: Text(
            //       messages[Globals.status],
            //       style: GoogleFonts.montserrat(
            //           fontSize: 26,
            //           fontWeight: FontWeight.w500,
            //           color: Colors.white),
            //     ),
            //   ),
            //   top: Globals.getHeight(540),
            // ),
            // Positioned(
            //   child: Container(
            //     height: Globals.getHeight(50),
            //     width: Globals.getWidth(185),
            //     decoration: BoxDecoration(
            //         color: Color(0xFF606AD8),
            //         borderRadius: BorderRadius.circular(Globals.getWidth(100))),
            //     child: TextButton(
            //         onPressed: () {},
            //         child: Text(
            //           buttonText[Globals.status],
            //           style: GoogleFonts.montserrat(
            //               fontSize: 16,
            //               fontWeight: FontWeight.w400,
            //               color: Colors.white),
            //         )),
            //   ),
            //   top: Globals.getHeight(648),
            // ),
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF231F20), Color(0xFF7585FF)])),
      ),
    );
  }
}
