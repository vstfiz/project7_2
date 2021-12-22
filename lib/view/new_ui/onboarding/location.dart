import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project7_2/custom/globals.dart';

import 'lockerroom_welcome.dart';

class Location extends StatefulWidget {
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
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
                top: Globals.getHeight(601),
                child: Container(
                  child: AutoSizeText(
                    'Play Wherever You Are',
                    minFontSize: 26,
                    maxFontSize: 30,
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontSize: 26,fontWeight: FontWeight.w600),
                  ),
                )),
            Positioned(
                top: Globals.getHeight(641),
                child: Container(
                  child: AutoSizeText(
                    'OnFeild helps you find local games you love, so\nyou can always choose your time  and place.',
                    minFontSize: 14,
                    maxFontSize: 30,
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontSize: 14,fontWeight: FontWeight.w400),
                  ),
                )),
            Positioned(
                top: Globals.getHeight(207),
                left: Globals.getWidth(63),
                child: Container(
                  width: Globals.getWidth(321),
                  height: Globals.getHeight(333),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/onboarding/stack.png'),fit: BoxFit.contain
                    )
                  ),
                )),
            Positioned(
                top: Globals.getHeight(230),
                left: Globals.getWidth(120),
                child: Container(
                  width: Globals.getWidth(250),
                  height: Globals.getHeight(250),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/onboarding/location.png'),fit: BoxFit.scaleDown
                      )
                  ),
                )),
            Positioned(
                top: Globals.getHeight(859),
                child: Container(
                  child:TextButton(
                    onPressed: (){
                      Navigator.of(context).pushReplacement( PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: LockerRoomWelcome(),
                          duration: new Duration(milliseconds: 300),
                          curve: Curves.easeInOut));
                    },
                    child:  Text(
                      'Skip',
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 10,fontWeight: FontWeight.w600),
                    ),
                  )
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
