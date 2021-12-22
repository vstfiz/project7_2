import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/view/new_ui/onboarding/login.dart';

import 'lockerroom_welcome.dart';

class Data extends StatefulWidget {
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  bool selEnglish = false;
  bool selHindi = false;
  bool selArabic = false;
  TextEditingController _firstNameController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Globals.getHeight(1200),
        width: Globals.width,
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: Globals.getHeight(1200),
                width: Globals.width,
              ),
              Positioned(
                  top: Globals.getHeight(392),
                  child: Container(
                    child: AutoSizeText(
                      'Let\'s talk about you',
                      minFontSize: 26,
                      maxFontSize: 30,
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 26,fontWeight: FontWeight.w600),
                    ),
                  )),
              Positioned(
                  top: Globals.getHeight(558),
                  left: Globals.width * 0.05,
                  child: Container(
                    height: Globals.getHeight(58),
                    width: Globals.width * 0.9,
                    child: TextField(
                      enabled: false,
                      controller: _firstNameController,
                      // textAlignVertical: TextAlignVertical.center,
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.3
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),

                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xFF121217),
                        borderRadius: BorderRadius.circular(Globals.getWidth(10))
                    ),
                  )),
              Positioned(
                  top: Globals.getHeight(677),
                  left: Globals.width * 0.05,
                  child: Container(
                    height: Globals.getHeight(58),
                    width: Globals.width * 0.9,
                    child: TextField(
                      controller: _firstNameController,
                      // textAlignVertical: TextAlignVertical.center,
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.3
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
                        hintText: 'Enter your first name',
                        hintStyle:  GoogleFonts.montserrat(
                            color: Color(0xFF6C7B8A),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.3
                        ),

                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xFF121217),
                        borderRadius: BorderRadius.circular(Globals.getWidth(10))
                    ),
                  )),
              Positioned(
                  top: Globals.getHeight(799),
                  left: Globals.width * 0.05,
                  child: Container(
                    height: Globals.getHeight(58),
                    width: Globals.width * 0.9,
                    child: TextField(
                      controller: _firstNameController,
                      // textAlignVertical: TextAlignVertical.center,
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.3
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
                        hintText: 'Enter your second name',
                        hintStyle:  GoogleFonts.montserrat(
                            color: Color(0xFF6C7B8A),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.3
                        ),

                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xFF121217),
                        borderRadius: BorderRadius.circular(Globals.getWidth(10))
                    ),
                  )),
              Positioned(
                  top: Globals.getHeight(926),
                  left: Globals.width * 0.05,
                  child: Container(
                    height: Globals.getHeight(58),
                    width: Globals.width * 0.9,
                    child: TextField(
                      controller: _firstNameController,
                      // textAlignVertical: TextAlignVertical.center,
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.3
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
                        hintText: 'DD/MM/YYYY',
                        hintStyle:  GoogleFonts.montserrat(
                            color: Color(0xFF6C7B8A),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.3
                        ),

                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xFF121217),
                        borderRadius: BorderRadius.circular(Globals.getWidth(10))
                    ),
                  )),
              Positioned(
                  top: Globals.getHeight(1092),
                  left: Globals.width * 0.22,
                  child: Container(
                    height: Globals.getHeight(58),
                    width: Globals.width * 0.56,
                    child: TextButton(
                      onPressed: (){
                      },
                      child: Text('Next'.toUpperCase(),style: GoogleFonts.montserrat(fontSize: 17,fontWeight: FontWeight.w400, letterSpacing: 2.89, color: Colors.white),),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(Globals.getWidth(48))
                    ),
                  )),
              Positioned(
                  top: Globals.getHeight(108),
                  left: Globals.getWidth(71),
                  child: Container(
                    width: Globals.getWidth(268),
                    height: Globals.getHeight(268),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/onboarding/layer.png'),fit: BoxFit.contain
                        )
                    ),
                  )),
              Positioned(
                  top: Globals.getHeight(125),
                  left: Globals.getWidth(86),
                  child: Container(
                    width: Globals.getWidth(238),
                    height: Globals.getHeight(235),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/onboarding/layer_2.png'),fit: BoxFit.scaleDown
                        )
                    ),
                  )),
              Positioned(
                  top: Globals.getHeight(141),
                  left: Globals.getWidth(106),
                  child: Container(
                    width: Globals.getWidth(200),
                    height: Globals.getHeight(200),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/onboarding/layer_3.png'),fit: BoxFit.scaleDown
                        )
                    ),
                  )),
              Positioned(
                  top: Globals.getHeight(169),
                  left: Globals.getWidth(151),
                  child: Container(
                    width: Globals.getWidth(112),
                    height: Globals.getHeight(137),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/onboarding/person_male.png'),fit: BoxFit.scaleDown
                        )
                    ),
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
