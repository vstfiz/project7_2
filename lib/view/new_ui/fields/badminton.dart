import 'dart:ui';

import 'package:achievement_view/achievement_view.dart';
import 'package:achievement_view/achievement_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/view/new_ui/painters/badminton.dart';
import 'package:toast/toast.dart';

import '../../../custom/draggable_card/dragable_card.dart';
import '../painters/basketball.dart';

class BadmintonField extends StatefulWidget {
  _BadmintonFieldState createState() => _BadmintonFieldState();
}

class _BadmintonFieldState extends State<BadmintonField> {

  List<String> playersOnField = [];
  List<String> playerList = ['Arpit', 'Kireet', 'Rahul', 'Vivek','Prinu'];

  @override
  void dispose(){
    super.dispose();
  }

  Future<void> _selectPlayerDialog(players) {
    showDialog(
        context: context,
        builder: (context) {
          return ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20.0,
                sigmaY: 20.0,
              ),
              child: AlertDialog(
                backgroundColor: Colors.black87.withOpacity(0.5),
                content: Container(
                  height: Globals.getHeight(60) * players.length,
                  width: Globals.width * 0.8,
                  child: ListView(
                    children: List.generate(players.length, (index) {
                      return (players.length - 1 == index)
                          ? Container(
                        width: Globals.width * 0.8,
                        height: Globals.getHeight(60),
                        decoration: BoxDecoration(
                          // color: Color(0xFF231F20),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if(!playersOnField.contains(players[index])){
                                playersOnField.add(players[index]);
                              }
                              else{
                                AchievementView(context,
                                    title: "Player Exsists",
                                    subTitle: "Player already stands on field",
                                    //onTab: _onTabAchievement,
                                    icon: Icon(
                                      Icons.clear,
                                      color: Colors.red,
                                      size: 24,
                                    ),
                                    typeAnimationContent:
                                    AnimationTypeAchievement
                                        .fadeSlideToUp,
                                    borderRadius: 5.0,
                                    color: Colors.blueGrey,
                                    alignment: Alignment.topCenter,
                                    duration: Duration(milliseconds: 1500),
                                    isCircle: true)
                                  ..show();
                              }
                            });
                            // Navigator.pop(context);
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                child: Container(
                                  width: Globals.width * 0.8,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                  ),
                                  child: Text(
                                    players[index],
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: Globals.getFontSize(15),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                left: 0.0,
                              ),
                            ],
                          ),
                        ),
                      )
                          : Container(
                        width: Globals.width * 0.8,
                        height: Globals.getHeight(60),
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.white.withOpacity(0.5),
                                  width: 0.5)),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if(!playersOnField.contains(players[index])){
                                playersOnField.add(players[index]);
                              }
                              else{
                                AchievementView(context,
                                    title: "Player Exsists",
                                    subTitle: "Player already stands on field",
                                    //onTab: _onTabAchievement,
                                    icon: Icon(
                                      Icons.clear,
                                      color: Colors.red,
                                      size: 24,
                                    ),
                                    typeAnimationContent:
                                    AnimationTypeAchievement
                                        .fadeSlideToUp,
                                    borderRadius: 5.0,
                                    color: Colors.blueGrey,
                                    alignment: Alignment.topCenter,
                                    duration: Duration(milliseconds: 1500),
                                    isCircle: true)
                                  ..show();
                              }
                            });
                            Navigator.pop(context);
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                child: Container(
                                  width: Globals.width * 0.8,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                  ),
                                  child: Text(
                                    players[index],
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: Globals.getFontSize(15),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                left: 0.0,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black54,
          actions: [
            SizedBox(
              width: 25.0,
            ),
            GestureDetector(
              onTap: () {
                _selectPlayerDialog(playerList);
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 25.0,
            ),
            GestureDetector(
              onTap: () {
              },
              child: Icon(
                Icons.check,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
          ],
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.clear,
              color: Colors.white,
            ),
          ),
        ),
        body: Stack(
          children: [
            CustomPaint(
              size: Size(Globals.width, Globals.height),
              painter: BadmintonPainter(),
            ),
            Container(
              height: Globals.height,
              width: Globals.width,
              child: Stack(
                children: List.generate(playersOnField.length, (index) {
                  return DraggableCard(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.fastLinearToSlowEaseIn,
                        height: 33,
                        width: 33,
                        child: Center(
                          child: Text(
                            playersOnField[index].substring(0,1).toUpperCase(),style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                      ));
                }),
              ),
            )
          ],
        ));
  }
}
