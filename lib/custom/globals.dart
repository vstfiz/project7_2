library globals;

import 'package:flutter/cupertino.dart';
import 'package:project7_2/model/user.dart';
import 'package:project7_2/view/find_places/find_places.dart';
import 'package:project7_2/view/locker_room/locker_room.dart';
import 'package:project7_2/view/news_n_fixtues/news_n_fixtures.dart';


class Globals{
  static double height;
  static double width;

  static User user;
  static int currentTab = 1;
  static var lockerRooms = [];
  static String uid;
  static String name;
  static String email;
  static String dob;
  static String dp;
  static bool hasLogin = false;
  static String status = 'rate';
  static PageController pageController = new PageController(initialPage: 1);
  static var screens = [NewsNFixtures(),FindPLaces(),LockerRoom(),];

  static double getHeight(double val){
    return (val/899) * height;
  }
  static double getHeightLeftPanel(double val){
    return (val/1035) * height;
  }

  static double getWidth(double val){
    return (val/414) * width;
  }
}