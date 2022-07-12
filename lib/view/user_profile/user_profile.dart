import 'dart:math';
import 'dart:ui';

import 'package:achievement_view/achievement_view.dart';
import 'package:achievement_view/achievement_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/database/firebase.dart';
import 'package:project7_2/services/auth/auth.dart';
import 'package:project7_2/view/auth/signin.dart';
import 'package:project7_2/view/new_ui/onboarding/login.dart';
import 'package:project7_2/view/new_ui/onboarding/loginSocial.dart';
import 'package:radar_chart/radar_chart.dart';


import '../../custom/clipped_profile/clipped_profile.dart';
import '../../custom/hexagon_clipper/hexagon_clipper.dart';
import '../../custom/spider_chart/spider_chart.dart';
import '../../custom/trapezium_clipper/trapezium_clipper.dart';
import '../new_ui/create_game/create_game_event.dart';
import '../new_ui/left_side_navigation/left_panel.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isGameAddOpen = false;
  bool isStatisticsSelected = true;
  bool isHistorySelected = false;
  bool isUpcomingSelected = false;


  List<Match> matchData = [
    Match(result: "Draw",score: "3-3",imagePath: 'assets/images/profile-image.png',date: '02/08/22',rating: '8.6',teamName: 'Crushers'),
    Match(result: "Win",score: "3-2",imagePath: 'assets/images/profile-image.png',date: '13/07/22',rating: '8.1',teamName: 'Crushers'),
    Match(result: "Loss",score: "1-3",imagePath: 'assets/images/profile-image.png',date: '02/12/22',rating: '6.6',teamName: 'Crushers'),
    Match(result: "Cancelled",score: "N/A",imagePath: 'assets/images/profile-image.png',date: '02/07/21',rating: 'N/A',teamName: 'Crushers'),
  ];

  Map<String, int> matches = {
    'Jan': 6,
    'Feb': 8,
    'Mar': 3,
    'Apr': 9,
    'May': 2,
    'Jun': 4
  };

  List<Color> colors = [
    Color(0xFFFFDF9D),
    Color(0xFF1ED7A6),
    Color(0xFFFF9774),
    Color(0xFFA894FF),
    Color(0xFF5FC9E9),
    Color(0xFFB19C9C),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF121217),
          leading: Container(
            width: Globals.width * 0.07,
            height: Globals.width * 0.07,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(PageTransition(
                    type: PageTransitionType.leftToRight,
                    child: LeftPanel(),
                    duration: new Duration(milliseconds: 300),
                    curve: Curves.easeInOut));
              },
              child: Icon(
                Icons.menu,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          actions: [
            Container(
                width: Globals.width * 0.1,
                height: Globals.width * 0.1,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[800].withOpacity(0.7),
                ),
                child: GestureDetector(
                  onTap: () {
                    AchievementView(context,
                        title: "Logged In!",
                        subTitle: "You successfully logged in",
                        //onTab: _onTabAchievement,
                        icon: Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 24,
                        ),
                        typeAnimationContent:
                            AnimationTypeAchievement.fadeSlideToUp,
                        borderRadius: 5.0,
                        color: Colors.blueGrey,
                        alignment: Alignment.topCenter,
                        duration: Duration(seconds: 3),
                        isCircle: true)
                      ..show();
                  },
                  child: Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                )),
            SizedBox(
              width: 10,
            ),
            Container(
              width: Globals.width * 0.1,
              height: Globals.width * 0.1,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[800].withOpacity(0.7),
              ),
              child: GestureDetector(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: () async {
                  setState(() {
                    isGameAddOpen = !isGameAddOpen;
                  });
                  // Provider.of<FindPLaces>(context,listen: false).updateGameAdd();
                  // _loadingDialog('Creating Locker Room');
                  // var ref = FirebaseFirestore.instance;
                  // await ref.collection('lockerRooms').add({
                  //   'createdByUid': Globals.uid,
                  //   'ownerName': Globals.name,
                  //   'sports': 'Football',
                  //   'location': 'NH2 Delhi Kanpur Highway',
                  // });
                  // await Globals.lockerRooms.add(1);
                  // Timer t = new Timer(new Duration(seconds: 3), () {
                  //   Navigator.pop(context);
                  //   setState(() {
                  //     Globals.currentTab = 2;
                  //     Globals.pageController.jumpToPage(2);
                  //   });
                  // });
                },
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: Globals.width * 0.1,
              height: Globals.width * 0.1,
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
        backgroundColor: Color(0xFF0F0F0F),
        body: SingleChildScrollView(
          child: Container(
            height: Globals.getHeight(1000),
            width: Globals.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: Globals.getHeight(51),
                  left: Globals.getWidth(30),
                  child: GestureDetector(
                    onTap: () {
                      Globals.currentTab = 1;
                      Globals.pageController.jumpToPage(1);
                    },
                    child: Icon(
                      Icons.clear,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                ),
                Positioned(
                  top: Globals.getHeight(73),
                  child: Container(
                    width: Globals.getWidth(97),
                    height: Globals.getWidth(97),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/profile-image2.png'),
                            fit: BoxFit.cover)),
                  ),
                ),
                Positioned(
                    top: Globals.getHeight(181),
                    child: Text(
                      'User Name',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: Globals.getFontSize(22),
                          letterSpacing: 1.3,
                          fontWeight: FontWeight.w600),
                    )),
                //
                Positioned(
                    top: Globals.getHeight(211),
                    child: Text(
                      'User Status',
                      style: GoogleFonts.montserrat(
                          color: Color(0XFF6C7B8A),
                          fontSize: Globals.getFontSize(14),
                          letterSpacing: 1,
                          fontWeight: FontWeight.w400),
                    )),
                //
                //
                Positioned(
                    top: Globals.getHeight(240),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) {
                        return ClippedProfileContainer(
                          imageUrl:
                              'assets/images/left_panel/profile_image.png',
                          height: Globals.getWidth(24),
                          width: Globals.getWidth(24),
                        );
                      }),
                    )),
                //
                //

                Positioned(
                    top: Globals.getHeight(291),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Globals.getWidth(7)),
                              height: Globals.getHeight(27),
                              decoration: BoxDecoration(
                                  color: Color(0xFF4C5FEF),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Row(
                                children: [
                                  Text(
                                    'Football',
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: Globals.getFontSize(14),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: Globals.getWidth(5),
                                  ),
                                  Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Globals.getHeight(30),
                            ),
                            Column(
                              children: [
                                Text(
                                  '35K',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: Globals.getFontSize(22),
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'Mates',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.grey,
                                      fontSize: Globals.getFontSize(15),
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: Globals.getWidth(33),
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Globals.getWidth(7)),
                              height: Globals.getHeight(27),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Row(
                                children: [
                                  Text(
                                    'Defender',
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: Globals.getFontSize(14),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: Globals.getWidth(5),
                                  ),
                                  Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Globals.getHeight(30),
                            ),
                            Column(
                              children: [
                                Text(
                                  '5 Years',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: Globals.getFontSize(22),
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'Experience',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.grey,
                                      fontSize: Globals.getFontSize(15),
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: Globals.getWidth(33),
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Globals.getWidth(7)),
                              height: Globals.getHeight(27),
                              decoration: BoxDecoration(
                                  color: Color(0xFFFF3A79),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Row(
                                children: [
                                  Text(
                                    'Liverpool FC',
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: Globals.getFontSize(14),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: Globals.getWidth(5),
                                  ),
                                  Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Globals.getHeight(30),
                            ),
                            Column(
                              children: [
                                Text(
                                  '200',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: Globals.getFontSize(22),
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'Games',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.grey,
                                      fontSize: Globals.getFontSize(15),
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )),

                Positioned(
                    top: Globals.getHeight(410),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Globals.getWidth(7)),
                          height: Globals.getHeight(35),
                          decoration: BoxDecoration(
                              color: Color(0xFF333333),
                              borderRadius: BorderRadius.circular(6.45)),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/profile_buttons_icon.png',
                                color: Colors.white,
                                height: Globals.getHeight(12),
                                width: Globals.getWidth(13),
                              ),
                              SizedBox(
                                width: Globals.getWidth(10),
                              ),
                              Text(
                                'add to team'.toUpperCase(),
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    letterSpacing: 1.25,
                                    fontSize: Globals.getFontSize(14),
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: Globals.getWidth(40),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Globals.getWidth(7)),
                          height: Globals.getHeight(35),
                          decoration: BoxDecoration(
                              color: Color(0xFF333333),
                              borderRadius: BorderRadius.circular(6.45)),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/profile_buttons_icon.png',
                                color: Colors.white,
                                height: Globals.getHeight(12),
                                width: Globals.getWidth(13),
                              ),
                              SizedBox(
                                width: Globals.getWidth(10),
                              ),
                              Text(
                                'message'.toUpperCase(),
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    letterSpacing: 1.25,
                                    fontSize: Globals.getFontSize(14),
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),

                Positioned(
                    top: Globals.getHeight(450),
                    child: Container(
                          height: Globals.getHeight(280),
                          width: Globals.width,
                          child: isStatisticsSelected?statistics(context):isHistorySelected?history(context):upcoming(context),
                        ),),
                Positioned(
                    top: Globals.getHeight(740),
                    width: Globals.width - 10,
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
                                border: isStatisticsSelected
                                    ? Border.all(
                                        color: Color(0xFF7585FF), width: 1.30)
                                    : null,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              'Statistics',
                              style: GoogleFonts.montserrat(
                                  color: isStatisticsSelected
                                      ? Colors.white
                                      : Color(0xFf6C7B8A),
                                  fontSize: Globals.getFontSize(16),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              isStatisticsSelected = true;
                              isHistorySelected = false;
                              isUpcomingSelected = false;
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
                                border: isHistorySelected
                                    ? Border.all(
                                        color: Color(0xFF7585FF), width: 1.30)
                                    : null,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              'History',
                              style: GoogleFonts.montserrat(
                                  color: isHistorySelected
                                      ? Colors.white
                                      : Color(0xFf6C7B8A),
                                  fontSize: Globals.getFontSize(16),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              isStatisticsSelected = false;
                              isHistorySelected = true;
                              isUpcomingSelected = false;
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
                                border: isUpcomingSelected
                                    ? Border.all(
                                        color: Color(0xFF7585FF), width: 1.30)
                                    : null,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              'Upcoming',
                              style: GoogleFonts.montserrat(
                                  color: isUpcomingSelected
                                      ? Colors.white
                                      : Color(0xFf6C7B8A),
                                  fontSize: Globals.getFontSize(16),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              isStatisticsSelected = false;
                              isHistorySelected = false;
                              isUpcomingSelected = true;
                            });
                          },
                        )
                      ],
                    )),

                Positioned(
                  top: Globals.getHeight(850),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Teams',
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize:
                                Globals.getFontSize(
                                    20),
                                fontWeight:
                                FontWeight.w500),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(4, (index) {
                              return ClippedProfileContainer(
                                imageUrl:
                                'assets/images/left_panel/profile_image.png',
                                height: Globals.getWidth(24),
                                width: Globals.getWidth(24),
                              );
                            }),
                          )
                        ],
                      ),
                      SizedBox(width: Globals.getWidth(65),),
                      Column(
                        children: [
                          Text(
                            'No Shows',
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize:
                                Globals.getFontSize(
                                    20),
                                fontWeight:
                                FontWeight.w500),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '10',
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize:
                                Globals.getFontSize(
                                    20),
                                fontWeight:
                                FontWeight.w500),
                          ),
                        ],
                      )
                    ],
                  )),

                isGameAddOpen
                    ? Positioned(
                        top: Globals.height * 0.15 + Globals.getHeight(140),
                        child: ClipPath(
                          clipper: TrapeziumClipper(),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 20.0,
                              sigmaY: 20.0,
                            ),
                            child: Container(
                              height: Globals.getHeight(400),
                              width: Globals.getWidth(330),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: Globals.getHeight(15),
                                    right: Globals.getWidth(15),
                                    child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          isGameAddOpen = false;
                                        });
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        size: Globals.getWidth(20),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    child: Container(
                                      height: Globals.getHeight(120),
                                      width: Globals.getWidth(345),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: Globals.getWidth(16),
                                          ),
                                          Container(
                                            height: Globals.getHeight(120),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                ClipPath(
                                                  clipper: HexagonClipper(),
                                                  child: Container(
                                                    height:
                                                        Globals.getHeight(89),
                                                    width: Globals.getWidth(80),
                                                    color: Colors.white,
                                                    child: TextButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          isGameAddOpen = false;
                                                        });
                                                        Navigator.of(context).push(PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .rightToLeft,
                                                            child:
                                                                CreateGameEvent(),
                                                            duration:
                                                                new Duration(
                                                                    milliseconds:
                                                                        300),
                                                            curve: Curves
                                                                .easeInOut));
                                                      },
                                                      child: Image.asset(
                                                        'assets/images/homescreen/field.png',
                                                        height:
                                                            Globals.getHeight(
                                                                29),
                                                        width: Globals.getWidth(
                                                            36.22),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'GAME',
                                                  style: GoogleFonts.montserrat(
                                                      color: Colors.white,
                                                      letterSpacing: 2.0,
                                                      fontSize:
                                                          Globals.getFontSize(
                                                              16),
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: Globals.getWidth(30),
                                          ),
                                          Container(
                                            height: Globals.getHeight(120),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                ClipPath(
                                                  clipper: HexagonClipper(),
                                                  child: Container(
                                                    height:
                                                        Globals.getHeight(89),
                                                    width: Globals.getWidth(80),
                                                    color: Colors.white,
                                                    child: TextButton(
                                                      onPressed: () {},
                                                      child: Image.asset(
                                                        'assets/images/homescreen/tournament.png',
                                                        height:
                                                            Globals.getHeight(
                                                                31.71),
                                                        width: Globals.getWidth(
                                                            36),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'TOURNEY',
                                                  style: GoogleFonts.montserrat(
                                                      color: Colors.white,
                                                      letterSpacing: 2.0,
                                                      fontSize:
                                                          Globals.getFontSize(
                                                              16),
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: Globals.getWidth(30),
                                          ),
                                          Container(
                                            height: Globals.getHeight(120),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                ClipPath(
                                                  clipper: HexagonClipper(),
                                                  child: Container(
                                                    height:
                                                        Globals.getHeight(89),
                                                    width: Globals.getWidth(80),
                                                    color: Colors.white,
                                                    child: TextButton(
                                                      onPressed: () {},
                                                      child: Image.asset(
                                                        'assets/images/homescreen/team.png',
                                                        height:
                                                            Globals.getHeight(
                                                                23),
                                                        width: Globals.getWidth(
                                                            36),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'TEAM',
                                                  style: GoogleFonts.montserrat(
                                                      color: Colors.white,
                                                      letterSpacing: 2.0,
                                                      fontSize:
                                                          Globals.getFontSize(
                                                              16),
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    top: Globals.getHeight(75),
                                  ),
                                  Positioned(
                                    child: Container(
                                      height: Globals.getHeight(120),
                                      width: Globals.getWidth(330),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: Globals.getWidth(16),
                                          ),
                                          Container(
                                            height: Globals.getHeight(120),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                ClipPath(
                                                  clipper: HexagonClipper(),
                                                  child: Container(
                                                    height:
                                                        Globals.getHeight(89),
                                                    width: Globals.getWidth(80),
                                                    color: Colors.white,
                                                    child: TextButton(
                                                      onPressed: () {},
                                                      child: Image.asset(
                                                        'assets/images/homescreen/venue.png',
                                                        height:
                                                            Globals.getHeight(
                                                                36),
                                                        width: Globals.getWidth(
                                                            36),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'VENUE',
                                                  style: GoogleFonts.montserrat(
                                                      color: Colors.white,
                                                      letterSpacing: 2.0,
                                                      fontSize:
                                                          Globals.getFontSize(
                                                              16),
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: Globals.getWidth(30),
                                          ),
                                          Container(
                                            height: Globals.getHeight(120),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                ClipPath(
                                                  clipper: HexagonClipper(),
                                                  child: Container(
                                                    height:
                                                        Globals.getHeight(89),
                                                    width: Globals.getWidth(80),
                                                    color: Colors.white,
                                                    child: TextButton(
                                                      onPressed: () {},
                                                      child: Image.asset(
                                                        'assets/images/homescreen/alerts.png',
                                                        height:
                                                            Globals.getHeight(
                                                                26),
                                                        width: Globals.getWidth(
                                                            36.23),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'ALERTS',
                                                  style: GoogleFonts.montserrat(
                                                      color: Colors.white,
                                                      letterSpacing: 2.0,
                                                      fontSize:
                                                          Globals.getFontSize(
                                                              16),
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: Globals.getWidth(30),
                                          ),
                                          Container(
                                            height: Globals.getHeight(120),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                ClipPath(
                                                  clipper: HexagonClipper(),
                                                  child: Container(
                                                    height:
                                                        Globals.getHeight(89),
                                                    width: Globals.getWidth(80),
                                                    color: Colors.white,
                                                    child: TextButton(
                                                      onPressed: () {},
                                                      child: Image.asset(
                                                        'assets/images/homescreen/settings.png',
                                                        height:
                                                            Globals.getHeight(
                                                                26.25),
                                                        width: Globals.getWidth(
                                                            26.25),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'SETTINGS',
                                                  style: GoogleFonts.montserrat(
                                                      color: Colors.white,
                                                      letterSpacing: 2.0,
                                                      fontSize:
                                                          Globals.getFontSize(
                                                              16),
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    top: Globals.getHeight(220),
                                  ),
                                  // Positioned(
                                  //     top: Globals.getHeight(360),
                                  //     left: Globals.getWidth(15),
                                  //     child: ClipRRect(
                                  //       child: BackdropFilter(
                                  //         filter: ImageFilter.blur(
                                  //           sigmaX: 100.0,
                                  //           sigmaY: 100.0,
                                  //         ),
                                  //         child: Container(
                                  //           width: Globals.getWidth(300),
                                  //           height: Globals.getHeight(62),
                                  //           decoration: BoxDecoration(
                                  //               color: Color.fromRGBO(
                                  //                   255, 255, 255, 0.3),
                                  //               borderRadius:
                                  //                   BorderRadius.circular(
                                  //                       Globals.getWidth(100)),
                                  //               backgroundBlendMode:
                                  //                   BlendMode.difference),
                                  //           child: TextField(
                                  //             controller: _searchController,
                                  //             textAlignVertical:
                                  //                 TextAlignVertical.center,
                                  //             cursorHeight: Globals.getHeight(25),
                                  //             cursorColor: Color(0xFF7585FF),
                                  //             style: GoogleFonts.montserrat(
                                  //               fontSize: Globals.getFontSize(16),
                                  //               fontWeight: FontWeight.w300,
                                  //               color: Colors.white,
                                  //             ),
                                  //             decoration: InputDecoration(
                                  //                 border: InputBorder.none,
                                  //                 suffixIcon: Padding(
                                  //                   padding: EdgeInsets.only(
                                  //                       top: Globals.getHeight(
                                  //                           12.0),
                                  //                       right: 12.0),
                                  //                   child: Icon(
                                  //                     Icons.search,
                                  //                     color: Colors.white,
                                  //                     size: 30,
                                  //                   ),
                                  //                 ),
                                  //                 hintText: 'Find Something...',
                                  //                 hintStyle:
                                  //                     GoogleFonts.montserrat(
                                  //                   fontSize:
                                  //                       Globals.getFontSize(16),
                                  //                   fontWeight: FontWeight.w300,
                                  //                   color: Colors.white,
                                  //                 ),
                                  //                 contentPadding: EdgeInsets.only(
                                  //                     left: 25.0,
                                  //                     top: Globals.getHeight(12),
                                  //                     right: 15.0)),
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     )),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF140F26).withOpacity(0.5),
                                      Color(0xFF7585FF).withOpacity(0.5)
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      Globals.getWidth(25))),
                            ),
                          ),
                        ))
                    : SizedBox()
              ],
            ),
          ),
        ));
  }

  Widget monthlyMatchGraph(BuildContext context){
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: Globals.width,
              height: Globals.getHeight(255),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return Column(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        matches.values.toList().elementAt(index).toString(),
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            letterSpacing: 1.25,
                            fontSize: Globals.getFontSize(14),
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        height: Globals.getHeight((matches.values.toList().elementAt(index) * 18).toDouble()),
                        width: Globals.getWidth(4),
                        decoration: BoxDecoration(
                            color: colors[index],
                            borderRadius: BorderRadius.circular(2.5)),
                      ),
                      Text(
                        matches.keys.elementAt(index),
                        style: GoogleFonts.montserrat(
                            color: Colors.grey,
                            letterSpacing: 1.25,
                            fontSize: Globals.getFontSize(12),
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  );
                }),
              ),
            ),
            SizedBox(height: 10,),
            Text(
              '2022-2023',
              style: GoogleFonts.montserrat(
                  color: Colors.grey,
                  letterSpacing: 1.25,
                  fontSize: Globals.getFontSize(14),
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Positioned(child: Icon(Icons.arrow_forward,size: 18,color: Colors.white70,),top: Globals.getHeight(115),right: Globals.getWidth(25),)
      ],
    );
  }

  Widget sportsMinutesChart(BuildContext context){
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: Globals.width,
              height: Globals.getHeight(255),
              child: Center(
                child: Container(
                    // child: SfCircularChart(
                    //     series: <CircularSeries>[
                    //       DoughnutSeries<ChartData, String>(
                    //           dataSource: chartData,
                    //           xValueMapper: (ChartData data, _) => data.x,
                    //           yValueMapper: (ChartData data, _) => data.y,
                    //           // Corner style of doughnut segment
                    //           cornerStyle: CornerStyle.bothCurve
                    //       )
                    //     ]
                    // )
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text(
              '2022-2023',
              style: GoogleFonts.montserrat(
                  color: Colors.grey,
                  letterSpacing: 1.25,
                  fontSize: Globals.getFontSize(14),
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Positioned(child: Icon(Icons.arrow_forward,size: 18,color: Colors.white70,),top: Globals.getHeight(115),right: Globals.getWidth(25),),
        Positioned(child: Icon(Icons.arrow_back,size: 18,color: Colors.white70,),top: Globals.getHeight(115),left: Globals.getWidth(25),)
      ],
    );
  }

  Widget playerStrengthChart(BuildContext context){
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: Globals.width,
              height: Globals.getHeight(255),
              child: Center(
                child: Container(
                  child: SpiderChart(
                    data: [
                      7,
                      5,
                      10,
                      7,
                      4,
                      2,
                      6,
                    ],
                    maxValue: 10, // the maximum value that you want to represent (essentially sets the data scale of the chart)
                    colors: <Color>[
                      Colors.white,
                      Colors.white,
                      Colors.white,
                      Colors.white,
                      Colors.white,
                      Colors.white,
                      Colors.white,
                    ],
                  ),
                  // RadarChart(
                  //   length: 7,
                  //   radius: 100,
                  //   vertices: [
                  //     for (int i = 0; i < 7; i++)
                  //       RadarVertex(
                  //         radius: 2,
                  //         textOffset: Offset(0, 0),
                  //         text: Text('$i'),
                  //       ),
                  //   ],
                  //   initialAngle: 0,
                  //   //backgroundColor: Colors.white,
                  //   //borderStroke: 2,
                  //   //borderColor: Colors.red.withOpacity(0.4),
                  //   // radialStroke: 2,
                  //   radialColor: Colors.grey,
                  //   radars: [
                  //     RadarTile(
                  //       values: [0.4, 0.8, 0.65,0.5,0.6,0.23,0.11],
                  //       borderStroke: 2,
                  //       borderColor: Colors.white,
                  //       backgroundColor: Colors.white.withOpacity(0.2),
                  //     ),
                  //   ],
                  // ),
                ),
                ),
              ),
            SizedBox(height: 10,),
            Text(
              '2022-2023',
              style: GoogleFonts.montserrat(
                  color: Colors.grey,
                  letterSpacing: 1.25,
                  fontSize: Globals.getFontSize(14),
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Positioned(child: Icon(Icons.arrow_back,size: 18,color: Colors.white70,),top: Globals.getHeight(115),left: Globals.getWidth(25),)
      ],
    );
  }


  Widget statistics(BuildContext context){
    return DefaultTabController(
      length: 3,
      child: TabBarView(children: <Widget>[
        monthlyMatchGraph(context),
        sportsMinutesChart(context),
        playerStrengthChart(context)
      ]),
    );
  }


  Widget history(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index){
        return Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.white54.withOpacity(0.3)
              )
            )
          ),
          height: Globals.getHeight(55),
          width: Globals.width - Globals.getWidth(50),
          child:  Row(
            children: [
             Container(
               child:  Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.end,
                 children: [
                   Text(
                     matchData[index].result,
                     style: GoogleFonts.montserrat(
                         color: Colors.white,
                         fontSize: Globals.getFontSize(14),
                         fontWeight: FontWeight.w600),textAlign: TextAlign.right,
                   ),
                   Text(
                     matchData[index].score,
                     style: GoogleFonts.montserrat(
                         color: Colors.grey,
                         fontSize: Globals.getFontSize(10),
                         fontWeight: FontWeight.w400),
                   ),
                 ],
               ),
               width: Globals.getWidth(60),
             ),
              SizedBox(
                width: Globals.getWidth(50),
              ),
              Container(
                width: Globals.getWidth(32),
                height: Globals.getWidth(32),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image:
                        AssetImage(matchData[index].imagePath),
                        fit: BoxFit.cover)),
              ),SizedBox(
                width: Globals.getWidth(25),
              ),
              Container(
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      matchData[index].teamName,
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: Globals.getFontSize(14),
                          fontWeight: FontWeight.w600),textAlign: TextAlign.left,
                    ),
                    Text(
                      matchData[index].date,
                      style: GoogleFonts.montserrat(
                          color: Colors.grey,
                          fontSize: Globals.getFontSize(10),
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                width: Globals.getWidth(60),
              ),SizedBox(
                width: Globals.getWidth(25),
              ),
              Image.asset(
                'assets/images/rating_symbol.png',
                height: Globals.getHeight(14),
                width: Globals.getWidth(14),
              ),SizedBox(
                width: Globals.getWidth(10),
              ),
              Text(
                matchData[index].rating,
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: Globals.getFontSize(13),
                    fontWeight: FontWeight.w600),
              ),SizedBox(
                width: Globals.getWidth(15),
              ),Image.asset(
                'assets/images/game_symbol.png',
                height: Globals.getHeight(25),
                width: Globals.getWidth(25),
              ),
            ],
          ),
        );
      }),
    );
  }


  Widget upcoming(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index){
        return Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Colors.white54.withOpacity(0.3)
                  )
              )
          ),
          height: Globals.getHeight(55),
          width: Globals.width - Globals.getWidth(50),
          child:  Row(
            children: [
              SizedBox(
                width: Globals.getWidth(35),
              ),
              Container(
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      matchData[index].date,
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: Globals.getFontSize(16),
                          fontWeight: FontWeight.w600),textAlign: TextAlign.right,
                    ),
                    Text(
                      'V/S',
                      style: GoogleFonts.montserrat(
                          color: Colors.grey,
                          fontSize: Globals.getFontSize(10),
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                width: Globals.getWidth(60),
              ),
              SizedBox(
                width: Globals.getWidth(35),
              ),
              Container(
                width: Globals.getWidth(32),
                height: Globals.getWidth(32),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image:
                        AssetImage(matchData[index].imagePath),
                        fit: BoxFit.cover)),
              ),SizedBox(
                width: Globals.getWidth(25),
              ),
              Container(
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      matchData[index].teamName,
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: Globals.getFontSize(15),
                          fontWeight: FontWeight.w600),textAlign: TextAlign.left,
                    ),

                  ],
                ),
                width: Globals.getWidth(60),
              ),SizedBox(
                width: Globals.getWidth(40),
              ),

              Image.asset(
                'assets/images/game_symbol.png',
                height: Globals.getHeight(25),
                width: Globals.getWidth(25),
              ),
            ],
          ),
        );
      }),
    );
  }
}


class Match{
  String imagePath;
  String result;
  String score;
  String teamName;
  String date;
  String rating;

  Match({this.imagePath, this.result, this.score, this.teamName, this.date,
      this.rating});

}