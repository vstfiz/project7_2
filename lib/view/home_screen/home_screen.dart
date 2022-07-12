import 'dart:async';

import 'package:achievement_view/achievement_view.dart';
import 'package:achievement_view/achievement_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/view/find_places/find_places.dart';
import 'package:project7_2/view/home_screen/home_screen.dart';
import 'package:project7_2/view/new_ui/bottom_navigation/bottom_navigation.dart';
import 'package:project7_2/view/new_ui/left_side_navigation/left_panel.dart';
import 'package:project7_2/view/user_profile/user_profile.dart';
import 'package:provider/provider.dart';
import 'package:responsify/responsify.dart';

class HomeScreen extends StatefulWidget {
  final int initialPage;

  const HomeScreen({Key key, this.initialPage}) : super(key: key);
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
                appBarHeight:
                    Globals.currentTab == 1 ? Globals.getHeight(50) : 0.0,
                drawerIconColor: Colors.white,
                appBarColor: Color(0xFF121217),
                sliderMain: BottomNavigation(initialPage: widget.initialPage,)),
          ),
        ),

    );
  }
}
