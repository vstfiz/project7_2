import 'dart:async';

import 'package:achievement_view/achievement_view.dart';
import 'package:achievement_view/achievement_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/view/home_screen/home_screen.dart';
import 'package:project7_2/view/new_ui/bottom_navigation/bottom_navigation.dart';
import 'package:project7_2/view/new_ui/left_side_navigation/left_panel.dart';
import 'package:project7_2/view/user_profile/user_profile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<SliderMenuContainerState> _key =
  new GlobalKey<SliderMenuContainerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        top: true,
        child: Scaffold(
          body: SliderMenuContainer(
              key: _key,
              sliderMenuOpenSize: Globals.width * 0.85,
              sliderMenu: LeftPanel(),
              appBarHeight: Globals.currentTab==1?Globals.getHeight(50):0.0,
              drawerIconColor: Colors.white,
              appBarColor: Color(0xFF121217),
              trailing: Row(
                children: [
                  Container(
                      width: Globals.width * 0.07,
                      height: Globals.width * 0.07,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[800].withOpacity(0.7),
                      ),
                      child: TextButton(
                        onPressed: (){
                          AchievementView(
                              context,
                              title: "Logged In!",
                              subTitle: "You successfully logged in",
                              //onTab: _onTabAchievement,
                              icon: Icon(Icons.check, color: Colors.green,size: 24,),
                              typeAnimationContent: AnimationTypeAchievement.fadeSlideToUp,
                              borderRadius: 5.0,
                              color: Colors.blueGrey,
                              alignment: Alignment.topCenter,
                              duration: Duration(seconds: 3),
                              isCircle: true
                          )..show();
                        },
                        child: Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.white,
                          size: 16,
                        ),
                      )
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
                      Globals.currentTab = 3;
                      Globals.pageController.jumpToPage(3);

                      },
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  )
                ],
              ),
              sliderMain: BottomNavigation()),
        ),
      ),
    );
  }
}