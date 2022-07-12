
import 'dart:async';
import 'package:achievement_view/achievement_view.dart';
import 'package:achievement_view/achievement_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/database/firebase.dart';
import 'package:project7_2/view/new_ui/left_side_navigation/left_panel.dart';
import 'package:project7_2/view/new_ui/onboarding/fill.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:project7_2/view/user_profile/user_profile.dart';

class BottomNavigation extends StatefulWidget{
  final int initialPage;
  const BottomNavigation({Key key, this.initialPage}) : super(key: key);
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation>{

  @override
  void initState() {
    Globals.pageController = new PageController(initialPage: widget.initialPage??1);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(iconData: Icons.rss_feed,title: "Friends"),
            TabData(iconData: Icons.location_on_outlined, title: "Find Game"),
            TabData(iconData: Icons.door_back_door_outlined,title: "Locker Room")
          ],
          barBackgroundColor: Colors.black,
          initialSelection: widget.initialPage??0,
          activeIconColor: Colors.white,inactiveIconColor: Colors.white,
          textColor: Colors.white,
          circleColor: Colors.blue,
          onTabChangedListener: (position) {
            setState(() {
              Globals.currentTab = position;
              Globals.pageController.jumpToPage(position);
            });
          },
        ),
        // Container(
        //   height: Globals.width * .2,
        //   decoration: BoxDecoration(
        //     color: Colors.black,
        //     boxShadow: [
        //       BoxShadow(
        //         color: Colors.black.withOpacity(.1),
        //         blurRadius: 30,
        //         offset: Offset(0, 10),
        //       ),
        //     ],
        //   ),
        //   child: ListView.builder(
        //     itemCount: 3,
        //     scrollDirection: Axis.horizontal,
        //     padding: EdgeInsets.symmetric(horizontal: Globals.width * .02),
        //     itemBuilder: (context, index) => InkWell(
        //       onTap: () {
        //         setState(() {
        //           Globals.currentTab = index;
        //           HapticFeedback.lightImpact();
        //         });
        //       },
        //       splashColor: Colors.transparent,
        //       highlightColor: Colors.transparent,
        //       child: Column(
        //         children: [
        //           AnimatedContainer(
        //             duration: Duration(seconds: 1),
        //             curve: Curves.fastLinearToSlowEaseIn,
        //             height: index == Globals.currentTab ? Globals.width * .15 : 0,
        //             width: index == Globals.currentTab ? Globals.width * .15: 0,
        //             decoration: BoxDecoration(
        //               shape: BoxShape.circle,
        //               color: index == Globals.currentTab
        //                   ? Color(0xFF4048EF)
        //                   : Colors.transparent,
        //             ),
        //             child: Center(
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   AnimatedContainer(
        //                     duration: Duration(seconds: 1),
        //                     curve: Curves.fastLinearToSlowEaseIn,
        //                     width:
        //                     index == Globals.currentTab ? Globals.width * .03 : 20,
        //                   ),
        //                   Icon(
        //                     listOfIcons[index],
        //                     size: Globals.width * .076,
        //                     color: index == Globals.currentTab
        //                         ? Colors.white
        //                         : Colors.white,
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //           AnimatedOpacity(
        //             opacity: index == Globals.currentTab ? 1 : 0,
        //             duration: Duration(seconds: 1),
        //             curve: Curves.fastLinearToSlowEaseIn,
        //             child: Text(
        //               index == Globals.currentTab
        //                   ? '${listOfStrings[index]}'
        //                   : '',
        //               style: GoogleFonts.montserrat(
        //                 color: Colors.white,
        //                 fontWeight: FontWeight.w600,
        //                 fontSize: 15,
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        body:  _homeScreen()
    ),top: true,);
  }



  List<String> listOfStrings = [
    'News & Fixtures',
    'Find Game',
    'Locker Room',
  ];

  Widget _appBar(){
    return Row(
      children: [
        Positioned(
          child: IconButton(
            onPressed: () {

            },
            icon: Icon(
              Icons.menu,
              color: Colors.white,
              size: 28,
            ),
          ),
        ),
        Container(
          width: Globals.width * 0.07,
          height: Globals.width * 0.07,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[800].withOpacity(0.7),
          ),
          child: Icon(
            Icons.calendar_today_outlined,
            color: Colors.white,
            size: 16,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          width: Globals.width * 0.07,
          height: Globals.width * 0.07,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[800].withOpacity(0.7),
          ),
          child: TextButton(
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 18,
            ),
            onPressed: () async {
              // _loadingDialog('Creating Locker Room');
              var ref = FirebaseFirestore.instance;
              await ref.collection('lockerRooms').add({
                'createdByUid': Globals.uid,
                'ownerName': Globals.name,
                'sports': 'Football',
                'location': 'NH2 Delhi Kanpur Highway',
              });
              await Globals.lockerRooms.add(1);
              Timer t = new Timer(new Duration(seconds: 3), () {
                Navigator.pop(context);
                setState(() {
                  Globals.currentTab = 2;
                  Globals.pageController.jumpToPage(2);
                });
              });
            },
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          width: Globals.width * 0.07,
          height: Globals.width * 0.07,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[800].withOpacity(0.7),
          ),
          child: TextButton(
            onPressed: () {
              AchievementView(context,
                  title: "Anonymous User",
                  subTitle: "Please sign in to use this feature",
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
              // Navigator.of(context).push(PageTransition(
              //     type: PageTransitionType.rightToLeft,
              //     child: ProfilePage(),
              //     duration: new Duration(milliseconds: 300),
              //     curve: Curves.easeInOut));
            },
            child: Icon(Icons.person,color: Colors.white,size: 18,),
          ),
        ),
      ],
    );
  }

  Widget _homeScreen(){
    return PageView.builder(
      controller: Globals.pageController,
      itemCount: Globals.screens.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Globals.screens[index];
      },
    );
  }
}