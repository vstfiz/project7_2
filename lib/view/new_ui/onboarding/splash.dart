import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/view/home_screen/home_screen.dart';
import 'package:project7_2/view/new_ui/alerts/status.dart';
import 'package:project7_2/view/new_ui/left_side_navigation/left_panel.dart';
import 'package:project7_2/view/new_ui/left_side_navigation/notifications.dart';
import 'package:project7_2/view/new_ui/onboarding/account_created.dart';
import 'package:project7_2/view/new_ui/onboarding/fill.dart';
import 'package:project7_2/view/new_ui/onboarding/forgot_password.dart';
import 'package:project7_2/view/new_ui/onboarding/language.dart';
import 'package:project7_2/view/new_ui/onboarding/location.dart' as l;
import 'package:project7_2/view/new_ui/onboarding/lockerroom_welcome.dart';
import 'package:project7_2/view/new_ui/onboarding/phone_login.dart';
import 'package:project7_2/view/new_ui/onboarding/validate_password.dart';

class Splash extends StatefulWidget {
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    _navigate();
  }

  _navigate() {
    Timer t = new Timer(new Duration(milliseconds: 700), () {
     if(Globals.hasLogin){
       Navigator.of(context).pushReplacement(PageTransition(
           type: PageTransitionType.rightToLeft,
           child: HomeScreen(),
           duration: new Duration(milliseconds: 300),
           curve: Curves.easeInOut));
     }
     else{
       Navigator.of(context).pushReplacement(PageTransition(
           type: PageTransitionType.rightToLeft,
           child: l.Location(),
           duration: new Duration(milliseconds: 300),
           curve: Curves.easeInOut));
     }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: Globals.width * 0.5,
          height: Globals.height * 0.15,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/onboarding/logo.png'),
                  fit: BoxFit.contain)),
        ),
      ),
    );
  }
}
