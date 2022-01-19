import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/view/new_ui/onboarding/loginSocial.dart';

class WelcomeScreen extends StatefulWidget {
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: Container(
                height: Globals.height,
                width: Globals.width,
                child: TabBarView(children: <Widget>[
                  _firstScreen(),
                  _secondScreen(),
                  _thirdScreen()
                ]),
              ),
              top: 0.0,
              left: 0.0,
            ),
            Positioned(child: TabPageSelector(
              color: Colors.transparent,
              selectedColor: Colors.white,
            ),top: Globals.getHeight(750),)
          ],
        ),
      ),
    );
  }

  Widget _firstScreen() {
    return Container(
      height: Globals.height,
      width: Globals.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: Globals.getHeight(601),
              child: Container(
                width: Globals.width * 0.9,
                height: Globals.getHeight(60),
                child: AutoSizeText(
                  'Play Wherever You Are',
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: Globals.getWidth(26),
                      fontWeight: FontWeight.w600),
                ),
              )),
          Positioned(
              top: Globals.getHeight(641),
              child: Container(
                width: Globals.width * 0.9,
                height: Globals.getHeight(100),
                child: AutoSizeText(
                  'OnFeild helps you find local games you love, so\nyou can always choose your time  and place.',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: Globals.getFontSize(14),
                      fontWeight: FontWeight.w400),
                ),
              )),
          Positioned(
              top: Globals.getHeight(207),
              left: Globals.getWidth(63),
              child: Container(
                width: Globals.getWidth(321),
                height: Globals.getHeight(333),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      child: Container(
                        width: Globals.getWidth(321),
                        height: Globals.getHeight(333),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/onboarding/stack.png'),
                                fit: BoxFit.contain)),
                      ),
                      top: 0.0,
                      left: 0.0,
                    ),
                    Positioned(
                      top: Globals.getHeight(27),
                      left: Globals.getWidth(55),
                      child: Container(
                        width: Globals.getWidth(250),
                        height: Globals.getHeight(250),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/onboarding/location.png'),
                                fit: BoxFit.scaleDown)),
                      ),
                    )
                  ],
                ),
              )),
          Positioned(
              bottom: Globals.getHeight(23),
              child: Container(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: LoginSocial(),
                          duration: new Duration(milliseconds: 300),
                          curve: Curves.easeInOut));
                    },
                    child: AutoSizeText(
                      'Skip',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: Globals.getFontSize(11),
                          fontWeight: FontWeight.w400),
                    ),
                  ))),
        ],
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF000000), Color(0xFF7585FF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    );
  }

  Widget _secondScreen() {
    return Container(
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
                      color: Colors.white,
                      fontSize: Globals.getFontSize(26),
                      fontWeight: FontWeight.w600),
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
                      color: Colors.white,
                      fontSize: Globals.getFontSize(14),
                      fontWeight: FontWeight.w400),
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
                        image: AssetImage(
                            'assets/images/onboarding/phone_data.png'),
                        fit: BoxFit.scaleDown)),
              )),
          Positioned(
              top: Globals.getHeight(109),
              left: Globals.getWidth(119),
              child: Container(
                width: Globals.getWidth(199),
                height: Globals.getHeight(395),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/onboarding/phone_shape.png'),
                        fit: BoxFit.contain)),
              )),
          Positioned(
              bottom: Globals.getHeight(23),
              child:  Container(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: LoginSocial(),
                          duration: new Duration(milliseconds: 300),
                          curve: Curves.easeInOut));
                    },
                    child: AutoSizeText(
                      'Skip',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: Globals.getFontSize(11),
                          fontWeight: FontWeight.w400),
                    ),
                  ))),
        ],
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF000000), Color(0xFF7585FF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    );
  }

  Widget _thirdScreen() {
    return Container(
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
                      color: Colors.white,
                      fontSize: Globals.getFontSize(26),
                      fontWeight: FontWeight.w600),
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
                      color: Colors.white,
                      fontSize: Globals.getFontSize(14),
                      fontWeight: FontWeight.w400),
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
                        image: AssetImage('assets/images/onboarding/layer.png'),
                        fit: BoxFit.contain)),
              )),
          Positioned(
              top: Globals.getHeight(200),
              left: Globals.getWidth(65),
              child: Container(
                width: Globals.getWidth(290),
                height: Globals.getHeight(290),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/images/onboarding/layer_2.png'),
                        fit: BoxFit.scaleDown)),
              )),
          Positioned(
              top: Globals.getHeight(225),
              left: Globals.getWidth(90),
              child: Container(
                width: Globals.getWidth(240),
                height: Globals.getHeight(240),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/images/onboarding/layer_3.png'),
                        fit: BoxFit.scaleDown)),
              )),
          Positioned(
              top: Globals.getHeight(170),
              left: Globals.getWidth(25),
              child: Container(
                width: Globals.getWidth(350),
                height: Globals.getHeight(350),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/images/onboarding/football.png'),
                        fit: BoxFit.scaleDown)),
              )),
          Positioned(
              bottom: Globals.getHeight(23),
              child:  Container(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: LoginSocial(),
                          duration: new Duration(milliseconds: 300),
                          curve: Curves.easeInOut));
                    },
                    child: AutoSizeText(
                      'Skip',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: Globals.getFontSize(11),
                          fontWeight: FontWeight.w400),
                    ),
                  ))),
        ],
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF000000), Color(0xFF7585FF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    );
  }
}
