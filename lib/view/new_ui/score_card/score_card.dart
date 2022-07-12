import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../../custom/globals.dart';
import '../left_side_navigation/left_panel.dart';

class ScoreCard extends StatefulWidget {
  @override
  _ScoreCardState createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {

  bool isTeamASelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121217),
      appBar: AppBar(
        backgroundColor: Color(0xFF121217),
        leading: Container(
          width: Globals.width * 0.1,
          height: Globals.width * 0.1,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFC4C41C).withOpacity(0.11),
          ),
          child: GestureDetector(
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        actions: [
          Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[800].withOpacity(0.7),
              ),
              child: Text(
                'Score Card',
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: Globals.getFontSize(22),
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.w600),
              )),
          SizedBox(
            width: 40,
          ),
          Container(
            width: Globals.width * 0.1,
            height: Globals.width * 0.1,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFC4C41C).withOpacity(0.11),
            ),
            child: GestureDetector(
              child: Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: Globals.width * 0.15,
            height: Globals.width * 0.15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF5D6CDF),
            ),
            child: GestureDetector(
              onTap: () {
                Globals.currentTab = 3;
                Globals.pageController.jumpToPage(3);
              },
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: Globals.width,
          height: Globals.getHeight(1000),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  top: Globals.getHeight(52),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: Globals.getWidth(35)),
                          height: Globals.getHeight(35),
                          decoration: BoxDecoration(
                              color: isTeamASelected?Color(0xFF7585FF)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            'Team A',
                            style: GoogleFonts.montserrat(
                                color: isTeamASelected
                                    ? Colors.white
                                    : Color(0xFf6C7B8A),
                                fontSize: Globals.getFontSize(16),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            isTeamASelected = true;
                          });
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: Globals.getWidth(35)),
                          height: Globals.getHeight(35),
                          decoration: BoxDecoration(
                              color: !isTeamASelected
                                  ?  Color(0xFF7585FF)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            'Team B',
                            style: GoogleFonts.montserrat(
                                color: !isTeamASelected
                                    ? Colors.white
                                    : Color(0xFf6C7B8A),
                                fontSize: Globals.getFontSize(16),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            isTeamASelected = false;
                          });
                        },
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
