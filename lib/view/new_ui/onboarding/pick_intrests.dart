import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/database/firebase.dart';
import 'package:project7_2/model/interests.dart';
import 'package:project7_2/services/auth/auth.dart';
import 'package:project7_2/view/new_ui/onboarding/fill.dart';
import 'package:project7_2/view/new_ui/onboarding/invite.dart';
import 'package:project7_2/view/new_ui/onboarding/login.dart';
import 'package:project7_2/view/new_ui/onboarding/teams.dart';
import 'package:toast/toast.dart';

import 'lockerroom_welcome.dart';

class PickInterests extends StatefulWidget {
  _PickInterestsState createState() => _PickInterestsState();
}

class _PickInterestsState extends State<PickInterests> {
  int selIndex;
  List<Interests> interests =
      List.filled(0, Interests('', false), growable: true);
  int selectedCount = 0;

  Future<void> _loadingDialog(String value) {
    return showDialog<void>(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            backgroundColor: Colors.white,
            content: Container(
                height: Globals.getHeight(80),
                child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Uploading data'.toUpperCase(),style: GoogleFonts.montserrat(fontWeight: FontWeight.w400,fontSize:20,letterSpacing: 1.6),),

                        Container(child:  LinearProgressIndicator(
                          backgroundColor: Colors.grey,
                          valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.blueGrey),
                        ),width: Globals.getWidth(200))
                      ],
                    )
                ))));
  }

  @override
  void initState() {
    super.initState();
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
      body: Container(
        height: Globals.height,
        width: Globals.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: Globals.getHeight(99),
              left: Globals.getWidth(10),
              child: TextButton(
                onPressed: (){

                },
                child: Icon(Icons.arrow_back,size: 34, color: Colors.white,),
              ),
            ),
            Positioned(
                top: Globals.getHeight(99),
                right: Globals.getWidth(15),
                  child: TextButton(
                    onPressed: ()async{
                      _loadingDialog('sdf');
                      try{
                        FirebaseDB.createUser(context);
                        Navigator.pop(context);
                        Navigator.of(context).pushReplacement(PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: Invite(),
                            duration: new Duration(milliseconds: 300),
                            curve: Curves.easeInOut));
                      }
                      catch(e){
                        Navigator.pop(context);
                        Toast.show(e.toString(), context);
                      }
                    },
                    child: Text('Skip',style: GoogleFonts.montserrat(fontSize: 14,fontWeight: FontWeight.w400, color: Colors.white),),
                  ),
                ),
            Positioned(
                top: Globals.getHeight(157),
                left: Globals.getWidth(27),
                child: Container(
                  child: AutoSizeText(
                    'Pick Your Interests',
                    minFontSize: 24,
                    maxFontSize: 30,
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w600),
                  ),
                )),
            Positioned(
                top: Globals.getHeight(189),
                left: Globals.getWidth(27),
                child: Container(
                  child: AutoSizeText(
                    '${selectedCount} Interests Selected',
                    style: GoogleFonts.montserrat(
                        color: Color(0xFF585858),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                )),

            Positioned(
              top: Globals.getHeight(250),
              left: Globals.getWidth(25.0),
              child: Container(
                width: Globals.width - Globals.getWidth(35.0),
                child: Wrap(
                    children: List.generate(interests.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (interests[index].isSelected == true) {
                          interests[index].isSelected =
                              !interests[index].isSelected;
                          selectedCount--;
                        } else {
                          interests[index].isSelected =
                              !interests[index].isSelected;
                          selectedCount++;
                        }
                      });
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: interests[index].color),
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
                                  fontSize: 14.0,
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
                                        color: Color(0xFF333333),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                        shape: BoxShape.circle),
                                  )
                          ],
                        )),
                  );
                })),
              ),
            ),
            Positioned(
                top: Globals.getHeight(797),
                left: Globals.width * 0.22,
                child: Container(
                  height: Globals.getHeight(50),
                  width: Globals.width * 0.56,
                  child: TextButton(
                    onPressed: () async{
                      _loadingDialog('sdf');
                      try{
                        FirebaseDB.createUser(context);
                        Navigator.pop(context);
                        Navigator.of(context).pushReplacement(PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: Invite(),
                            duration: new Duration(milliseconds: 300),
                            curve: Curves.easeInOut));
                      }
                      catch(e){
                        Navigator.pop(context);
                        Toast.show(e.toString(), context);
                      }
                    },
                    child: Text('Next'.toUpperCase(),style: GoogleFonts.montserrat(fontSize: 17,fontWeight: FontWeight.w400, letterSpacing: 2.89, color: Colors.white),),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(Globals.getWidth(48))
                  ),
                )),
            // Positioned(
            //     top: Globals.getHeight(470),
            //     left: Globals.width * 0.22,
            //     right: Globals.width * 0.22,
            //     child: Container(
            //       width: Globals.width,
            //       height: Globals.getHeight((899-470).toDouble()),
            //       child: ListView(
            //         children: List.generate(Globals.positions[Globals.selectedSport].length, (index) {
            //           return Container(
            //             height: Globals.getHeight(58),
            //             width: Globals.width * 0.56,
            //             margin: index == 0?EdgeInsets.only(top:Globals.getWidth(15),bottom: Globals.getWidth(28)):EdgeInsets.only(bottom:Globals.getWidth(43)),
            //             child: TextButton(
            //               onPressed: (){
            //                 setState(() {
            //                   selIndex = index;
            //                 });
            //                 if(!Globals.teams.containsKey(Globals.selectedSport)){
            //                   Navigator.of(context).pushReplacement(PageTransition(
            //                       type: PageTransitionType.rightToLeft,
            //                       child: Login(),
            //                       duration: new Duration(milliseconds: 300),
            //                       curve: Curves.easeInOut));
            //                 }
            //                 else{
            //                   Navigator.of(context).pushReplacement(PageTransition(
            //                       type: PageTransitionType.rightToLeft,
            //                       child: SelectFavTeam(),
            //                       duration: new Duration(milliseconds: 300),
            //                       curve: Curves.easeInOut));
            //                 }
            //               },
            //               child: Text(Globals.positions[Globals.selectedSport][index].toUpperCase(),textAlign:TextAlign.center,style: GoogleFonts.montserrat(fontSize: 17,fontWeight: FontWeight.w400, letterSpacing: 2.89, color: Colors.white),),
            //             ),
            //             decoration: BoxDecoration(
            //                 color: selIndex == index?Color(0xFF7585FF):Colors.black,
            //                 borderRadius: BorderRadius.circular(Globals.getWidth(48))
            //             ),
            //           );
            //         }),
            //       ),
            //     )),
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
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF000000), Color(0xFF7585FF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.533, 1.0]),
        ),
      ),
    );
  }
}
