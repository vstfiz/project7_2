import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project7_2/custom/dropdown_calendar/drop_down_calendar.dart';
import 'package:project7_2/custom/drop_down/custom_drop_down.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/model/interests.dart';
import 'package:project7_2/view/new_ui/create_game/game_create_confirmation.dart';
import 'package:project7_2/view/new_ui/create_game/pick_positions.dart';

class EventSettings extends StatefulWidget {
  @override
  _EventSettingsState createState() => _EventSettingsState();
}

class _EventSettingsState extends State<EventSettings>
    with SingleTickerProviderStateMixin {
  TextEditingController _searchTeam = TextEditingController();
  TabController _tabController;
  bool notifications = true;

  @override
  void initState() {
    _tabController = TabController(initialIndex: 2, length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: Globals.height,
        width: Globals.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black, Color(0xFF7585FF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: Globals.height,
              width: Globals.width,
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
                top: Globals.getHeight(108),
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
                child: Opacity(
                  child: Container(
                    width: Globals.getWidth(200),
                    height: Globals.getHeight(200),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/onboarding/layer_3.png'),
                            fit: BoxFit.scaleDown),
                        backgroundBlendMode: BlendMode.overlay),
                  ),
                  opacity: 0.2861,
                )),
            Positioned(
                top: Globals.getHeight(170),
                child: Container(
                  width: Globals.getWidth(166),
                  height: Globals.getHeight(140),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/onboarding/field.png'),
                          fit: BoxFit.scaleDown)),
                )),
            Positioned(
              child: Text(
                'Event Settings',
                style: GoogleFonts.montserrat(
                    fontSize: Globals.getFontSize(26),
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              top: Globals.getHeight(390),
            ),
            Positioned(
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Public Event',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: Globals.getFontSize(18)),
                    ),
                    Container(
                      width: Globals.getWidth(114),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlutterSwitch( value: Globals.publicEvent,
                            onToggle: (value) {
                              setState(() {
                                Globals.publicEvent = !Globals.publicEvent;
                              });
                            },
                            width: Globals.getWidth(58.72),
                            height: Globals.getHeight(29),
                            toggleSize: Globals.getHeight(23.2),
                            toggleColor: Color(0xFF1ECFCC),
                            activeColor: Color(0xFF7585FF),
                          ),
                          Text(
                            Globals.publicEvent ? 'On' : 'Off',
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: Globals.getFontSize(18)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Globals.getWidth(8.57)),
                ),
                height: Globals.getHeight(45.73),
                width: Globals.getWidth(355),
              ),
              top: Globals.getHeight(480),
            ),
            Positioned(
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Notifications',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: Globals.getFontSize(18)),
                    ),
                    Container(
                      width: Globals.getWidth(114),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlutterSwitch( value: notifications,
                            onToggle: (value) {
                              setState(() {
                                notifications = !notifications;
                              });
                            },
                          width: Globals.getWidth(58.72),
                            height: Globals.getHeight(29),
                            toggleSize: Globals.getHeight(23.2),
                            toggleColor: Color(0xFF1ECFCC),
                            activeColor: Color(0xFF7585FF),
                          ),
                          Text(
                            notifications ? 'On' : 'Off',
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: Globals.getFontSize(18)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Globals.getWidth(8.57)),
                ),
                height: Globals.getHeight(45.73),
                width: Globals.getWidth(355),
              ),
              top: Globals.getHeight(565),
            ),
            Positioned(
              child: TabPageSelector(
                controller: _tabController,
                selectedColor: Color(0xFF1DCFC9),
                color: Colors.white,
              ),
              bottom: Globals.getHeight(90),
            ),
            Positioned(
                bottom: Globals.getHeight(26),
                child: Container(
                  height: Globals.getHeight(50),
                  width: Globals.getWidth(185),
                  child: TextButton(
                    onPressed: () {
                     if(Globals.publicEvent){
                       Navigator.of(context).pushReplacement(PageTransition(
                           type: PageTransitionType.rightToLeft,
                           child: PickYourPositions(),
                           duration: new Duration(milliseconds: 300),
                           curve: Curves.easeInOut));
                     }
                     else{
                       Navigator.of(context).pushReplacement(PageTransition(
                           type: PageTransitionType.rightToLeft,
                           child: GameCreateConfirmation(),
                           duration: new Duration(milliseconds: 300),
                           curve: Curves.easeInOut));
                     }
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
    ));
  }
}
