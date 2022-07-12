import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/view/new_ui/create_game/game_create_confirmation.dart';

class PickYourPositions extends StatefulWidget {
  _PickYourPositionsState createState() => _PickYourPositionsState();
}

class _PickYourPositionsState extends State<PickYourPositions> {
  List<String> positions;
  List<double> values;
  bool personOfDetermination = false;

  @override
  initState() {
    positions = Globals.positions[Globals.selectedSport];
    Globals.selectedPositions =
        List.filled(positions.length, false, growable: false);
    values = List.filled(positions.length, 1.0, growable: false);
    super.initState();
  }

  int selIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height:
            Globals.height + Globals.getHeight(160) * (positions.length - 2.5),
        width: Globals.width,
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: Globals.height +
                    Globals.getHeight(160) * (positions.length - 2.5),
                width: Globals.width,
              ),
              Positioned(
                top: Globals.getHeight(70),
                right: Globals.getWidth(20),
                child: TextButton(
                  onPressed: () {
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
                  top: Globals.getHeight(435),
                  child: Container(
                    child: AutoSizeText(
                      'Find Players For Positions',
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
                  left: Globals.width * 0.02,
                  child: Container(
                    height: Globals.getHeight(150) * positions.length,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(positions.length, (index) {
                        return Container(
                          width: Globals.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: Globals.getHeight(40),
                                width: Globals.width * 0.4,
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                margin: index == 0
                                    ? EdgeInsets.only(
                                        top: Globals.getWidth(20),
                                        left: Globals.getWidth(12),
                                        bottom: Globals.getWidth(15))
                                    : EdgeInsets.only(
                                        left: Globals.getWidth(12),
                                        bottom: Globals.getWidth(20)),
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      Globals.selectedPositions[index] =
                                          !Globals.selectedPositions[index];
                                    });
                                  },
                                  child: Text(
                                    positions[index].toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                        fontSize: Globals.getFontSize(17),
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 2.89,
                                        color: Colors.white),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Globals.selectedPositions[index]
                                        ? Color(0xFF7585FF)
                                        : Colors.black,
                                    borderRadius: BorderRadius.circular(
                                        Globals.getWidth(48))),
                              ),
                              Container(
                                width: Globals.width * 0.85,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: Globals.width * 0.8,
                                      child: Slider(
                                        min: 1,
                                        max: 10,
                                        // label: values[index].round().toString(),
                                        value: values[index],
                                        thumbColor: Colors.white,
                                        divisions: 10,
                                        inactiveColor: Colors.white,
                                        activeColor: Colors.white,
                                        onChanged:
                                            Globals.selectedPositions[index]
                                                ? (value) {
                                                    setState(() {
                                                      values[index] = value;
                                                    });
                                                  }
                                                : null,
                                      ),
                                    ),
                                    Globals.selectedPositions[index]
                                        ? Text(
                                            values[index].round().toString(),
                                            style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400),
                                          )
                                        : SizedBox(),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  )
              ),
              Positioned(
                  top: Globals.getHeight(108),
                  left: Globals.getWidth(71),
                  child: Container(
                    width: Globals.getWidth(268),
                    height: Globals.getHeight(268),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/onboarding/layer.png'),
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
                  top: Globals.getHeight(65),
                  left: Globals.getWidth(40),
                  child: Container(
                    width: Globals.getWidth(350),
                    height: Globals.getHeight(350),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/onboarding/football.png'),
                            fit: BoxFit.contain)),
                  )),
              Positioned(
                left: Globals.width * 0.05,
                child: Row(
                  children: [
                   Container(
                     width: Globals.getWidth(36),
                     height: Globals.getWidth(36),

                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(5.0),
                       border: Border.all(
                         color: Colors.black,
                         width: 1.0
                       ),
                         color:Color(0xFF292E59)
                     ),
                     child:  Transform.scale(
                       child: Checkbox(
                         checkColor: Color(0xFF17EAD9),
                         fillColor: MaterialStateProperty.all(Color(0xFF292E59)),
                         activeColor: Colors.white,
                         value: personOfDetermination,
                         onChanged: (value) {
                           setState(() {
                             personOfDetermination = value;
                           });
                         },shape: RoundedRectangleBorder(

                       ),
                       ),
                       scale: 1.7,
                     ),
                   ),
                    SizedBox(
                      width: 25.0,
                    ),
                    Text(
                      'Person Of Determination',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                top: Globals.getHeight(500) + (Globals.getHeight(170) * (positions.length-1.25)),
              ),
              Positioned(
                  bottom: Globals.getHeight(20),
                  child: Container(
                    height: Globals.getHeight(50),
                    width: Globals.getWidth(185),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: GameCreateConfirmation(),
                            duration: new Duration(milliseconds: 300),
                            curve: Curves.easeInOut));
                      },
                      child: Text(
                        'Next',
                        style: GoogleFonts.montserrat(
                            fontSize: Globals.getFontSize(16),
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                            BorderRadius.circular(Globals.getWidth(48))),
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
