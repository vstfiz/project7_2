import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/view/home_screen/home_screen.dart';
import 'package:project7_2/view/new_ui/onboarding/account_created.dart';
import 'package:project7_2/view/new_ui/onboarding/fill.dart';
import 'package:project7_2/view/new_ui/onboarding/login.dart';
import 'package:project7_2/view/new_ui/onboarding/teams.dart';

import 'lockerroom_welcome.dart';

class Invite extends StatefulWidget {
  _InviteState createState() => _InviteState();
}

class _InviteState extends State<Invite> {
  int selIndex;

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
              top: Globals.getHeight(99),
              right: Globals.getWidth(20),
              child: TextButton(
                onPressed: (){
                  Navigator.of(context).pushReplacement(PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: AccountCreated(),
                      duration: new Duration(milliseconds: 300),
                      curve: Curves.easeInOut));
                },
                child: Text('Skip',style: GoogleFonts.montserrat(fontSize: 14,fontWeight: FontWeight.w400, color: Colors.white),),
              ),
            ),
            Positioned(
                top: Globals.getHeight(430),
                child: Container(
                  child: AutoSizeText(
                    'Final Phase Of Play',
                    minFontSize: 26,
                    maxFontSize: 30,
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w600),
                  ),
                )),
            Positioned(
                top: Globals.getHeight(467),
                child: Container(
                  child: AutoSizeText(
                    'Invite your friends and start finding other\nteams to play with. It’s the best way to enjoy\nOnFeild!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                  ),
                )),
            Positioned(
                top: Globals.getHeight(554),
                left: Globals.width * 0.1,
                child: Container(
                  height: Globals.getHeight(58),
                  width: Globals.width * 0.8,
                  child: TextButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: Globals.width *0.07,
                        height: Globals.getHeight(30),
                        child:Image.asset(
                          'assets/images/onboarding/facebook.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        width: Globals.width*0.08,
                      ),
                      Container(
                        width: Globals.width * 0.55,
                        child: Text(
                          'Invite With Facebook'.toUpperCase(),
                          style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 2.89,
                              color: Colors.white),
                        ),
                      )
                    ],
                  )),
                  decoration: BoxDecoration(
                      color: Color(0xFF121217),
                      borderRadius:
                          BorderRadius.circular(Globals.getWidth(11))),
                )),
            Positioned(
                top: Globals.getHeight(626),
                left: Globals.width * 0.1,
                child: Container(
                  height: Globals.getHeight(58),
                  width: Globals.width * 0.8,
                  child: TextButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: Globals.width *0.07,
                            height: Globals.getHeight(30),
                            child:Image.asset(
                              'assets/images/onboarding/twitter.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            width: Globals.width*0.08,
                          ),
                          Container(
                            width: Globals.width * 0.55,
                            child: Text(
                              'Invite With Twitter'.toUpperCase(),
                              style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 2.89,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      )),
                  decoration: BoxDecoration(
                      color: Color(0xFF121217),
                      borderRadius:
                      BorderRadius.circular(Globals.getWidth(11))),
                )),
            Positioned(
                top: Globals.getHeight(703),
                left: Globals.width * 0.1,
                child: Container(
                  height: Globals.getHeight(58),
                  width: Globals.width * 0.8,
                  child: TextButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: Globals.width *0.07,
                            height: Globals.getHeight(30),
                            child:Image.asset(
                              'assets/images/onboarding/facebfxcgvbook.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            width: Globals.width*0.08,
                          ),
                          Container(
                            width: Globals.width * 0.55,
                            child: Text(
                              'Invite With Phonebook'.toUpperCase(),
                              style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 2.89,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      )),
                  decoration: BoxDecoration(
                      color: Color(0xFF121217),
                      borderRadius:
                      BorderRadius.circular(Globals.getWidth(11))),
                )),Positioned(
                top: Globals.getHeight(817),
                left: Globals.width * 0.25,
                child: Container(
                  height: Globals.getHeight(50),
                  width: Globals.width * 0.5,
                  child: TextButton(
                    onPressed: (){
                      Navigator.of(context).pushReplacement(PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: AccountCreated(),
                          duration: new Duration(milliseconds: 300),
                          curve: Curves.easeInOut));

                    },
                    child: Text('Later',style: GoogleFonts.montserrat(fontSize: 17,fontWeight: FontWeight.w400, letterSpacing: 2.89, color: Colors.white),),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(Globals.getWidth(48))
                  ),
                )),
            // Positioned(
            //     top: Globals.getHeight(639),
            //     left: Globals.width * 0.22,
            //     child: Container(
            //       height: Globals.getHeight(58),
            //       width: Globals.width * 0.56,
            //       child: TextButton(
            //         onPressed: (){
            //           setState(() {
            //             selEnglish = false;
            //             selHindi = true;
            //             selArabic = false;
            //           });
            //         },
            //         child: Text('Hindi'.toUpperCase(),style: GoogleFonts.montserrat(fontSize: 17,fontWeight: FontWeight.w400, letterSpacing: 2.89, color: Colors.white),),
            //       ),
            //       decoration: BoxDecoration(
            //           color: selHindi?Color(0xFF7585FF):Colors.black,
            //           borderRadius: BorderRadius.circular(Globals.getWidth(48))
            //       ),
            //     )),
            // Positioned(
            //     top: Globals.getHeight(741),
            //     left: Globals.width * 0.22,
            //     child: Container(
            //       height: Globals.getHeight(58),
            //       width: Globals.width * 0.56,
            //       child: TextButton(
            //         onPressed: (){
            //           setState(() {
            //             selEnglish = false;
            //             selHindi = false;
            //             selArabic = true;
            //           });
            //         },
            //         child: Text('Arabic'.toUpperCase(),style: GoogleFonts.montserrat(fontSize: 17,fontWeight: FontWeight.w400, letterSpacing: 2.89, color: Colors.white),),
            //       ),
            //       decoration: BoxDecoration(
            //           color: selArabic?Color(0xFF7585FF):Colors.black,
            //           borderRadius: BorderRadius.circular(Globals.getWidth(48))
            //       ),
            //     )),

            Positioned(
                top: Globals.getHeight(108),
                left: Globals.getWidth(71),
                child: Container(
                  width: Globals.getWidth(268),
                  height: Globals.getHeight(268),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/onboarding/layer.png'),
                          fit: BoxFit.contain)),
                )),
            Positioned(
                top: Globals.getHeight(125),
                left: Globals.getWidth(86),
                child: Container(
                  width: Globals.getWidth(238),
                  height: Globals.getHeight(235),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/onboarding/layer_2.png'),
                          fit: BoxFit.scaleDown)),
                )),
            Positioned(
                top: Globals.getHeight(141),
                left: Globals.getWidth(106),
                child: Container(
                  width: Globals.getWidth(200),
                  height: Globals.getHeight(200),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/onboarding/layer_3.png'),
                          fit: BoxFit.scaleDown)),
                )),
            Positioned(
                top: Globals.getHeight(25),
                left: Globals.getWidth(8),
                child: Container(
                  width: Globals.getWidth(390),
                  height: Globals.getHeight(390),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/onboarding/invite.png'),
                          fit: BoxFit.contain)),
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
