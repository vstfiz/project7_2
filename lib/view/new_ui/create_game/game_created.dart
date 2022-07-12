import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/view/home_screen/home_screen.dart';

class GameCreated extends StatefulWidget {
  _GameCreatedState createState() => _GameCreatedState();
}

class _GameCreatedState extends State<GameCreated> {
  String defaultImageAddress = 'assets/images/alerts/';

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
              top: Globals.getHeight(70),
              right: Globals.getWidth(20),
              child: TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.clear,
                  size: Globals.getWidth(25),
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              child: Container(
                height: Globals.getHeight(189.18),
                width: Globals.getWidth(227.72),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/onboarding/game_listed.png' ,
                        ),
                        fit: BoxFit.contain)),
              ),
              top: Globals.getHeight(166),
            ),
            Positioned(
              child: Container(
                height: Globals.getHeight(50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Globals.getWidth(100))),
                child: Text(
                  'Your Game Is Listed!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontSize: Globals.getFontSize(26),
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              top: Globals.getHeight(430),
            ),
            Positioned(
              child: Container(
                height: Globals.getHeight(50),
                width: Globals.getWidth(185),
                decoration: BoxDecoration(
                    color: Color(0xFF606AD8),
                    borderRadius: BorderRadius.circular(Globals.getWidth(100))),
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: HomeScreen(initialPage: 2,),
                              duration: new Duration(milliseconds: 300),
                              curve: Curves.easeInOut));
                    },
                    child: Text(
                      'Locker Room',
                      style: GoogleFonts.montserrat(
                          fontSize: Globals.getFontSize(16),
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
              ),
              top: Globals.getHeight(578),
            ),
            Positioned(
              child: Container(
                height: Globals.getHeight(50),
                width: Globals.getWidth(185),
                decoration: BoxDecoration(
                    color: Color(0xFF606AD8),
                    borderRadius: BorderRadius.circular(Globals.getWidth(100))),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Status',
                      style: GoogleFonts.montserrat(
                          fontSize: Globals.getFontSize(16),
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
              ),
              top: Globals.getHeight(650),
            ),
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF0F0F0F), Color(0xFF231F20)])),
      ),
    );
  }
}
