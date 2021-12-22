import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/view/new_ui/onboarding/play_position.dart';

class LockerRoomWelcome extends StatefulWidget {
  _LockerRoomWelcomeState createState() => _LockerRoomWelcomeState();
}

class _LockerRoomWelcomeState extends State<LockerRoomWelcome> {
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
                top: Globals.getHeight(591),
                child: Container(
                  child: AutoSizeText(
                    'Locker Rooms',
                    minFontSize: 26,
                    maxFontSize: 30,
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontSize: 26,fontWeight: FontWeight.w600),
                  ),
                )),
            Positioned(
                top: Globals.getHeight(633),
                child: Container(
                  child: AutoSizeText(
                    'A place to interact your teamates and discuss\nteam tactics for your upcoming game.',
                    minFontSize: 14,
                    maxFontSize: 30,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontSize: 14,fontWeight: FontWeight.w400),
                  ),
                )),
            Positioned(
                top: Globals.getHeight(121),
                left: Globals.getWidth(128),
                child: Container(
                  width: Globals.getWidth(181),
                  height: Globals.getHeight(374),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/onboarding/phone_data.png'),fit: BoxFit.scaleDown
                      )
                  ),
                )),
            Positioned(
                top: Globals.getHeight(109),
                left: Globals.getWidth(119),
                child: Container(
                  width: Globals.getWidth(199),
                  height: Globals.getHeight(395),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/onboarding/phone_shape.png'),fit: BoxFit.contain
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
                            child: PlayPosition(),
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
