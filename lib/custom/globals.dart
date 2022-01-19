library globals;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:project7_2/model/user.dart' as u;
import 'package:project7_2/view/find_places/find_places.dart';
import 'package:project7_2/view/locker_room/locker_room.dart';
import 'package:project7_2/view/news_n_fixtues/news_n_fixtures.dart';
import 'package:project7_2/view/user_profile/user_profile.dart';

class Globals {
  static double height;
  static double width;

  static u.User user;
  static int currentTab = 1;
  static var lockerRooms = [];
  static String uid;
  static String name;
  static String email;
  static String dob;
  static String dp;
  static bool hasLogin = false;
  static String status = 'rate';
  static bool isFirstRun = true;
  static PageController pageController = new PageController(initialPage: 1);
  static var screens = [
    NewsNFixtures(),
    FindPLaces(),
    LockerRoom(),
    ProfilePage()
  ];
  static GlobalKey<SliderMenuContainerState> keyDrawer;
  static String selectedSport = 'Football';
  static Map positions = {
    'Cricket': [
      'Bowler',
      'Batsmen',
      'All Rounder',
      'Wicket Keeper-\nBatsmen',
      'Fielder'
    ],
    'Basketball': ['General', 'Offense', 'Defence'],
    'Tennis': ['Left Handed', 'Right Handed'],
    'Squash': ['Left Handed', 'Right Handed'],
    'Golf': ['Left Handed', 'Right Handed'],
    'Football': ['Defender', 'MidFielder', 'Attacker', 'Goal Keeper'],
    'Futsal': ['Forward', 'Winger', 'Defender', 'GoalKeeper'],
    'Pool': ['Left Handed', 'Right Handed'],
    'Billiards': ['Left Handed', 'Right Handed'],
    'Table Tennis': ['Left Handed', 'Right Handed'],
    'Badminton': ['Left Handed', 'Right Handed'],
  };

  static Map teams = {
    'Football': [
      'Liverpool',
      'man united',
      'chelsea',
      'real madrid',
      'barcelona',
      'psg',
      'city',
      'bayern',
      'arsenal'
    ]
  };

  static var teams1 = [
      'Liverpool',
      'man united',
      'chelsea',
      'real madrid',
      'barcelona',
      'psg',
      'city',
      'bayern',
      'arsenal'

  ];
  static double getHeight(double val) {
    return (val / 899) * height;
  }

  static double getHeightLeftPanel(double val) {
    return (val / 1035) * height;
  }

  static double getWidth(double val) {
    return (val / 414) * width;
  }

  static double getFontSize(double val) {
    return (val / 432) * width;
  }


  static String creationUid;
  static String creationEmail;
  static String creationPass;
  static String creationPhone;
  static String creationGender;
  static String creationPosition;
  static String creationTeam;
  static String creationName;
  static String creationDob;
  static String creationDp;
  static AuthCredential creationAuthCredential;
  static User creationUser;

}
