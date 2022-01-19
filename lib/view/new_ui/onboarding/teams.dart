import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/view/new_ui/onboarding/fill.dart';
import 'package:project7_2/view/new_ui/onboarding/login.dart';
import 'package:project7_2/view/new_ui/onboarding/pick_intrests.dart';
import 'package:project7_2/view/new_ui/onboarding/position.dart';
import 'dart:math' as math;

class SelectFavTeam extends StatefulWidget {
  _SelectFavTeamState createState() => _SelectFavTeamState();
}

class _SelectFavTeamState extends State<SelectFavTeam> {
  int selIndex;
  final ScrollController _controller = ScrollController();

  void _handleKeyEvent() {
    var offset = _controller.offset;
    setState(() {
      _controller.animateTo(offset + 100,
          duration: Duration(milliseconds: 30), curve: Curves.ease);
    });
  }

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
                top: Globals.getHeight(435),
                child: Container(
                  child: AutoSizeText(
                    'Favorite Team',
                    minFontSize: 26,
                    maxFontSize: 30,
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: Globals.getFontSize(26),
                        fontWeight: FontWeight.w600),
                  ),
                )),
            Positioned(
                top: Globals.getHeight(470),
                left: Globals.width * 0.22,
                right: Globals.width * 0.22,
                child: Container(
                  width: Globals.width,
                  height: Globals.getHeight((899 - 470).toDouble()),
                  child: ListView(
                    controller: _controller,
                    children: List.generate(
                        Globals.teams[Globals.selectedSport].length, (index) {
                      return Container(
                        height: Globals.getHeight(58),
                        width: Globals.width * 0.56,
                        margin: index == 0
                            ? EdgeInsets.only(
                                top: Globals.getWidth(15),
                                bottom: Globals.getWidth(28))
                            : EdgeInsets.only(bottom: Globals.getWidth(43)),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              selIndex = index;
                              Globals.creationTeam =
                                  Globals.teams[Globals.selectedSport][index];
                            });
                            Navigator.of(context).pushReplacement(
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: PickInterests(),
                                    duration: new Duration(milliseconds: 300),
                                    curve: Curves.easeInOut));
                          },
                          child: Text(
                            Globals.teams[Globals.selectedSport][index]
                                .toUpperCase(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                fontSize: Globals.getFontSize(17),
                                fontWeight: FontWeight.w400,
                                letterSpacing: 2.89,
                                color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: selIndex == index
                                ? Color(0xFF7585FF)
                                : Colors.black,
                            borderRadius:
                                BorderRadius.circular(Globals.getWidth(48))),
                      );
                    }),
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
                          fit: BoxFit.scaleDown),
                  backgroundBlendMode: BlendMode.overlay),
                )),
            Positioned(
                top: Globals.getHeight(169),
                left: Globals.getWidth(151),
                child: Container(
                  width: Globals.getWidth(112),
                  height: Globals.getHeight(137),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/onboarding/person_team.png'),
                          fit: BoxFit.scaleDown)),
                )),
            Positioned(
                bottom: Globals.getHeight(15),
                right: Globals.getWidth(5),
                child: Container(
                    child: Transform.rotate(
                  angle: math.pi / 2,
                  child: TextButton(
                    onPressed: _handleKeyEvent,
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: Globals.getWidth(20),
                    ),
                  ),
                ))),
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
