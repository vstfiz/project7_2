import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project7_2/custom/globals.dart';

import 'game_created.dart';

class GameListingConfirmation extends StatefulWidget {
  _GameListingConfirmationState createState() => _GameListingConfirmationState();
}

class _GameListingConfirmationState extends State<GameListingConfirmation> {
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
                height: Globals.getHeight(109.25),
                width: Globals.getWidth(132),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/onboarding/shoe.png' ,
                        ),
                        fit: BoxFit.contain)),
              ),
              top: Globals.getHeight(205),
            ),
            Positioned(
              child: Container(
                height: Globals.getHeight(50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Globals.getWidth(100))),
                child: Text(
                 ' Are You Sure?',
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
                      Navigator.of(context).pushReplacement(PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: GameCreated(),
                          duration: new Duration(milliseconds: 300),
                          curve: Curves.easeInOut));
                    },
                    child: Text(
                      'List My Game',
                      style: GoogleFonts.montserrat(
                          fontSize: Globals.getFontSize(16),
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
              ),
              top: Globals.getHeight(633),
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
