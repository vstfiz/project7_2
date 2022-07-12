import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project7_2/view/new_ui/bottom_navigation/bottom_navigation.dart';
import 'package:project7_2/view/new_ui/create_game/create_game_event.dart';

import '../../../custom/globals.dart';
import '../right_side_drawer/right_navigation.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: Globals.width,
        height: Globals.height,
        child: Lottie.asset(
          'assets/splash/splash.json',
          width: Globals.width,
          height: Globals.height,
          fit: BoxFit.fill,
          onLoaded: (val){
            print('gfrg');
            Timer timer = new Timer(val.duration, () {
              Navigator.of(context)
                  .pushReplacement(new MaterialPageRoute(builder: (context) {
                return BottomNavigation(initialPage: 0,);
              }));
            });
          }
        ),
      ),
    );
  }
}
