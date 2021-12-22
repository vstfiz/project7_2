import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/view/new_ui/onboarding/login.dart';
import 'package:project7_2/view/new_ui/onboarding/loginSocial.dart';

import 'lockerroom_welcome.dart';

class PlayPosition extends StatefulWidget {
  _PlayPositionState createState() => _PlayPositionState();
}

class _PlayPositionState extends State<PlayPosition> {
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
                top: Globals.getHeight(588),
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
                top: Globals.getHeight(638),
                child: Container(
                  child: AutoSizeText(
                    'You like being a  defender, or a striker. Maybe you\nfeel like batting. Filter by position in Onfield and\nplay what you’re best at..',
                    minFontSize: 14,
                    maxFontSize: 30,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontSize: 14,fontWeight: FontWeight.w400),
                  ),
                )),
            Positioned(
                top: Globals.getHeight(175),
                left: Globals.getWidth(43),
                child: Container(
                  width: Globals.getWidth(333),
                  height: Globals.getHeight(333),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/onboarding/layer.png'),fit: BoxFit.contain
                      )
                  ),
                )),
            Positioned(
                top: Globals.getHeight(200),
                left: Globals.getWidth(65),
                child: Container(
                  width: Globals.getWidth(290),
                  height: Globals.getHeight(290),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/onboarding/layer_2.png'),fit: BoxFit.scaleDown
                      )
                  ),
                )),
            Positioned(
                top: Globals.getHeight(225),
                left: Globals.getWidth(90),
                child: Container(
                  width: Globals.getWidth(240),
                  height: Globals.getHeight(240),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/onboarding/layer_3.png'),fit: BoxFit.scaleDown
                      )
                  ),
                )),
            Positioned(
                top: Globals.getHeight(170),
                left: Globals.getWidth(25),
                child: Container(
                  width: Globals.getWidth(350),
                  height: Globals.getHeight(350),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/onboarding/football.png'),fit: BoxFit.scaleDown
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
                            child: LoginSocial(),
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
