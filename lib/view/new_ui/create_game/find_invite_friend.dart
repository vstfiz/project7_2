import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project7_2/custom/dropdown_calendar/drop_down_calendar.dart';
import 'package:project7_2/custom/drop_down/custom_drop_down.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/model/interests.dart';
import 'package:project7_2/view/new_ui/create_game/event_settings.dart';

class FindInviteFriend extends StatefulWidget{
  @override
  _FindInviteFriendState createState()=> _FindInviteFriendState();
}
class _FindInviteFriendState extends State<FindInviteFriend> with SingleTickerProviderStateMixin {
  TextEditingController _searchTeam = TextEditingController();
  TabController _tabController;
  List<Interests> interests =
  List.filled(0, Interests('', false), growable: true);
  @override
  void initState() {
    _tabController = TabController(
        initialIndex: 1,
        length: 3,
        vsync: this
    );
    interests.add(new Interests('Football', false));
    interests.add(new Interests('Badminton', false));
    interests.add(new Interests('Cricket', false));
    interests.add(new Interests('Noodling', false));
    interests.add(new Interests('F1 Racing', false));
    interests.add(new Interests('Basketball', false));
    interests.add(new Interests('Defending', false));
    interests.add(new Interests('Barcelona', false));
    interests.add(new Interests('Kabbadi', false));
    interests.add(new Interests('Football', false));
    interests.add(new Interests('Badminton', false));
    interests.add(new Interests('Cricket', false));
    interests.add(new Interests('Noodling', false));
    interests.add(new Interests('F1 Racing', false));
    interests.add(new Interests('Basketball', false));
    interests.add(new Interests('Defending', false));
    interests.add(new Interests('Barcelona', false));
    interests.add(new Interests('Kabbadi', false));
    _getColors();
    super.initState();
  }

  _getColors() {
    var pallete = [
      Color(0xFF4C5FEF),
      Color(0xFFFFFFFF).withOpacity(0.15),
      Color(0xFFFF3A79),
      Color(0xFFFF9774),
      Color(0xFF1ED7A6),
      Color(0xFF8366FF),
      Color(0xFF1ED7A6),
    ];
    Random r = new Random();
    interests.forEach((element) {
      element.color = pallete[r.nextInt(pallete.length - 1)];
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: Globals.getHeight(1098),
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
                  height: Globals.getHeight(1098),
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
                    'Find & Invite Friends',
                    style: GoogleFonts.montserrat(
                        fontSize: Globals.getFontSize(26),
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  top: Globals.getHeight(390),
                ),

                Positioned(
                  child: Container(
                    child: TextField(
                      controller: _searchTeam,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search Teams',
                        hintStyle: GoogleFonts.montserrat(
                            fontSize: Globals.getFontSize(14),
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                        suffix:Padding(
                          child:  TextButton(
                            onPressed: (){
                              _searchTeam.clear();
                            },
                            child: Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 16,
                            ),
                          ),
                          padding: EdgeInsets.only(top: 4.0),
                        ),
                        contentPadding: EdgeInsets.only(left: 20.0,bottom: 3.0),
                      ),
                      style: GoogleFonts.montserrat(
                          fontSize: Globals.getFontSize(20),
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Globals.getWidth(8.57)),
                        border: Border.all(
                            color: Color(0xFF4C5FEF)
                        ),
                        color: Color(0xFF231F20)
                    ),
                    height: Globals.getHeight(45.73),
                    width: Globals.getWidth(383),
                  ),
                  top: Globals.getHeight(452.53),
                ),
                Positioned(
                  child: Container(
                    // child: ,
                    height: Globals.getHeight(400),
                    width: Globals.getWidth(383),
                    child: Wrap(
                        children: List.generate(interests.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (interests[index].isSelected == true) {
                                  interests[index].isSelected =
                                  !interests[index].isSelected;
                                } else {
                                  interests[index].isSelected =
                                  !interests[index].isSelected;
                                }
                              });
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(Globals.getWidth(52.093)),
                                    backgroundBlendMode: BlendMode.overlay,
                                    color: index%2==0?Colors.white.withOpacity(0.5):Colors.transparent.withOpacity(0.5)),
                                margin: EdgeInsets.symmetric(
                                    vertical: Globals.getHeight(8.0),
                                    horizontal: Globals.getWidth(5.0)),
                                padding: EdgeInsets.symmetric(
                                    vertical: Globals.getHeight(10.0),
                                    horizontal: Globals.getWidth(10.0)),
                                height: Globals.getHeight(40),
                                child: Wrap(
                                  children: [
                                    Text(
                                      interests[index].name,
                                      style: GoogleFonts.montserrat(
                                          fontSize: Globals.getFontSize(14),
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    interests[index].isSelected
                                        ? Icon(
                                      Icons.check,
                                      size: 22,
                                      color: Colors.white,
                                    )
                                        : Container(
                                      height: Globals.getHeight(22),
                                      width: Globals.getWidth(22),
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.5),
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 1.56,
                                          ),
                                          shape: BoxShape.circle),
                                    )
                                  ],
                                )),
                          );
                        })),
                  ),
                  top: Globals.getHeight(550),
                ),
                Positioned(
                  child: TabPageSelector(
                    controller: _tabController,
                    selectedColor: Color(0xFF1DCFC9),
                    color: Colors.white,
                  ),
                  top: Globals.getHeight(1010),
                ),
                Positioned(
                    top: Globals.getHeight(1035),
                    child: Container(
                      height: Globals.getHeight(50),
                      width: Globals.getWidth(185),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: EventSettings(),
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
        ));
  }
}
