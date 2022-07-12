import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../custom/globals.dart';

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
          height: Globals.getHeight(1300),
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
              Positioned(child: Container(
                width: Globals.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: Globals.getWidth(35),
                    ),
                    Container(
                      width: Globals.getWidth(150),
                      child: Text(
                        'Half 1',
                        style: GoogleFonts.montserrat(
                            color: Color(0xFf6C7B8A),
                            fontSize: Globals.getFontSize(13),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: Globals.getWidth(80),
                    ),
                    Container(
                      width: Globals.getWidth(20),
                      child: Text(
                        'F1',
                        style: GoogleFonts.montserrat(
                            color: Color(0xFf6C7B8A),
                            fontSize: Globals.getFontSize(13),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: Globals.getWidth(18),
                    ),
                    Container(
                      width: Globals.getWidth(20),
                      child: Text(
                        'F2',
                        style: GoogleFonts.montserrat(
                            color: Color(0xFf6C7B8A),
                            fontSize: Globals.getFontSize(13),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: Globals.getWidth(18),
                    ),
                    Container(
                      width: Globals.getWidth(20),
                      child: Text(
                        'F3',
                        style: GoogleFonts.montserrat(
                            color: Color(0xFf6C7B8A),
                            fontSize: Globals.getFontSize(13),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: Globals.getWidth(18),
                    ),
                    Container(
                      width: Globals.getWidth(20),
                      child: Text(
                        'F4',
                        style: GoogleFonts.montserrat(
                            color: Color(0xFf6C7B8A),
                            fontSize: Globals.getFontSize(13),
                            fontWeight: FontWeight.w500),
                      ),
                    ),

                  ],
                ),
              ),
              top: Globals.getHeight(110),),
              Positioned(child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(5, (index){
                  return Container(
                    width: Globals.width - 15,
                    height: Globals.getHeight(64),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.white,
                          width: 1.0
                        )
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: Globals.getWidth(35),
                        ),
                        Container(
                          width: Globals.getWidth(44),
                          height: Globals.getWidth(44),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                  AssetImage('assets/images/profile-image.png'),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: Globals.getWidth(15),
                        ),
                        Container(
                          width: Globals.getWidth(150),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Player Name',
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: Globals.getFontSize(14),
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Player Status',
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: Globals.getFontSize(10),
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: Globals.getWidth(18),
                        ),
                        Container(
                          width: Globals.getWidth(20),
                          child: Text(
                            '25',
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: Globals.getFontSize(13),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          width: Globals.getWidth(18),
                        ),
                        Container(
                          width: Globals.getWidth(20),
                          child: Text(
                            '12',
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: Globals.getFontSize(13),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          width: Globals.getWidth(18),
                        ),
                        Container(
                          width: Globals.getWidth(20),
                          child: Text(
                            '12',
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: Globals.getFontSize(13),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          width: Globals.getWidth(18),
                        ),
                        Container(
                          width: Globals.getWidth(20),
                          child: Text(
                            '104',
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: Globals.getFontSize(13),
                                fontWeight: FontWeight.w500),
                          ),
                        ),

                      ],
                    ),
                  );
                }),
              ),
                top: Globals.getHeight(130),),
              Positioned(child: Container(
                width: Globals.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: Globals.getWidth(35),
                    ),
                    Container(
                      width: Globals.getWidth(150),
                      child: Text(
                        'Half 2',
                        style: GoogleFonts.montserrat(
                            color: Color(0xFf6C7B8A),
                            fontSize: Globals.getFontSize(13),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: Globals.getWidth(80),
                    ),
                    Container(
                      width: Globals.getWidth(20),
                      child: Text(
                        'F1',
                        style: GoogleFonts.montserrat(
                            color: Color(0xFf6C7B8A),
                            fontSize: Globals.getFontSize(13),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: Globals.getWidth(18),
                    ),
                    Container(
                      width: Globals.getWidth(20),
                      child: Text(
                        'F2',
                        style: GoogleFonts.montserrat(
                            color: Color(0xFf6C7B8A),
                            fontSize: Globals.getFontSize(13),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: Globals.getWidth(18),
                    ),
                    Container(
                      width: Globals.getWidth(20),
                      child: Text(
                        'F3',
                        style: GoogleFonts.montserrat(
                            color: Color(0xFf6C7B8A),
                            fontSize: Globals.getFontSize(13),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: Globals.getWidth(18),
                    ),
                    Container(
                      width: Globals.getWidth(20),
                      child: Text(
                        'F4',
                        style: GoogleFonts.montserrat(
                            color: Color(0xFf6C7B8A),
                            fontSize: Globals.getFontSize(13),
                            fontWeight: FontWeight.w500),
                      ),
                    ),

                  ],
                ),
              ),
                top: Globals.getHeight(500),),
              Positioned(child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(5, (index){
                  return Container(
                    width: Globals.width - 15,
                    height: Globals.getHeight(64),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.white,
                                width: 1.0
                            )
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: Globals.getWidth(35),
                        ),
                        Container(
                          width: Globals.getWidth(44),
                          height: Globals.getWidth(44),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                  AssetImage('assets/images/profile-image.png'),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: Globals.getWidth(15),
                        ),
                        Container(
                          width: Globals.getWidth(150),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Player Name',
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: Globals.getFontSize(14),
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Player Status',
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: Globals.getFontSize(10),
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: Globals.getWidth(18),
                        ),
                        Container(
                          width: Globals.getWidth(20),
                          child: Text(
                            '25',
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: Globals.getFontSize(13),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          width: Globals.getWidth(18),
                        ),
                        Container(
                          width: Globals.getWidth(20),
                          child: Text(
                            '12',
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: Globals.getFontSize(13),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          width: Globals.getWidth(18),
                        ),
                        Container(
                          width: Globals.getWidth(20),
                          child: Text(
                            '12',
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: Globals.getFontSize(13),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          width: Globals.getWidth(18),
                        ),
                        Container(
                          width: Globals.getWidth(20),
                          child: Text(
                            '104',
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: Globals.getFontSize(13),
                                fontWeight: FontWeight.w500),
                          ),
                        ),

                      ],
                    ),
                  );
                }),
              ),
                top: Globals.getHeight(520),),
              Positioned(child:
              Container(
                width: Globals.getWidth(150),
                child: Text(
                  'HighLights',
                  style: GoogleFonts.montserrat(
                      color: Color(0xFf6C7B8A),
                      fontSize: Globals.getFontSize(13),
                      fontWeight: FontWeight.w500),
                ),
              ),
                top: Globals.getHeight(890),left: Globals.getWidth(35),),
              Positioned(child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(5, (index){
                  return Container(
                    width: Globals.width - 15,
                    height: Globals.getHeight(64),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.white,
                                width: 1.0
                            )
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: Globals.getWidth(35),
                        ),
                        Container(
                          width: Globals.getWidth(44),
                          height: Globals.getWidth(44),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                  AssetImage('assets/images/cricket_generic.png'),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: Globals.getWidth(15),
                        ),
                        Container(
                          width: Globals.getWidth(300),
                          child: Text(
                            'Ryan won the toss and took batting',
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: Globals.getFontSize(14),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
                top: Globals.getHeight(910),),
            ],
          ),
        ),
      ),
    );
  }
}
