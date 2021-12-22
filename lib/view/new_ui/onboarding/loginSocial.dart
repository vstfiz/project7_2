import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart' as fAuth;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/database/firebase.dart';
import 'package:project7_2/services/auth/auth.dart';
import 'package:project7_2/view/find_places/find_places.dart';
import 'package:project7_2/view/home_screen/home_screen.dart';
import 'package:project7_2/view/new_ui/onboarding/login.dart';
import 'package:project7_2/view/new_ui/onboarding/signup.dart' as s;

import 'lockerroom_welcome.dart';

class LoginSocial extends StatefulWidget {
  _LoginSocialState createState() => _LoginSocialState();
}

class _LoginSocialState extends State<LoginSocial> {
  bool corrEmail = false;
  bool corrPassword = false;
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Globals.height,
        width: Globals.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: Globals.getHeight(482),
                left: Globals.width * 0.05,
                child: Container(
                  height: Globals.getHeight(58),
                  width: Globals.width * 0.9,
                  child: TextButton(
                    onPressed: () async{

                      fAuth.User uc = await signInWithGoogle();
                      print('uid is' + uc.uid);
                      bool res = await FirebaseDB.getUserDetails(
                          uc.uid, context);
                      print(res);
                      if (res) {
                        print('con1 ');
                        await FirebaseDB.createUser(uc.uid, uc.email,
                            uc.displayName, context);
                        // Navigator.pop(context);
                        Navigator.of(context).pushReplacement( PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: HomeScreen(),
                            duration: new Duration(milliseconds: 300),
                            curve: Curves.easeInOut));
                      } else {
                        print('con 2');
                        // Navigator.pop(context);
                        Navigator.of(context).pushReplacement( PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: HomeScreen(),
                            duration: new Duration(milliseconds: 300),
                            curve: Curves.easeInOut));
                      }
                    },
                    child: Text('Login With Google',style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w400, letterSpacing: 2.89, color: Colors.white),),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(Globals.getWidth(10))
                  ),
                )),
            Positioned(
                top: Globals.getHeight(558),
                left: Globals.width * 0.05,
                child: Container(
                  height: Globals.getHeight(58),
                  width: Globals.width * 0.9,
                  child: TextButton(
                    child: Text('Login With Apple',style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w400, letterSpacing: 2.89, color: Colors.white),),
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xFF121217),
                      borderRadius: BorderRadius.circular(Globals.getWidth(10))
                  ),
                )),
            Positioned(
                top: Globals.getHeight(634),
                left: Globals.width * 0.05,
                child: Container(
                  height: Globals.getHeight(58),
                  width: Globals.width * 0.9,
                  child: TextButton(
                    child: Text('Login With Twitter',style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w400, letterSpacing: 2.89, color: Colors.white),),
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xFF5FC9E9),
                      borderRadius: BorderRadius.circular(Globals.getWidth(10))
                  ),
                )),
            Positioned(
                top: Globals.getHeight(760),
                left: Globals.width * 0.05,
                child: Container(
                  height: Globals.getHeight(58),
                  width: Globals.width * 0.9,
                  child: TextButton(
                    onPressed: (){
                      Navigator.of(context).push( PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: s.Singup(),
                          duration: new Duration(milliseconds: 300),
                          curve: Curves.easeInOut));
                    },
                    child: Text('SIGN UP',style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w400, letterSpacing: 2.89, color: Colors.white),),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(Globals.getWidth(10))
                  ),
                )),
            Positioned(
                top: Globals.getHeight(715),
                left: Globals.getWidth(128),
                child: Container(
                    width: Globals.getWidth(44),
                    child: Divider(
                      thickness: 1.0,
                      color: Colors.white,
                    )
                )),
            Positioned(
                top: Globals.getHeight(715),
                left: Globals.getWidth(190),
                child: Container(
                    width: Globals.getWidth(44),
                    child:Text('OR',style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 12,
                        letterSpacing: 1.73,fontWeight: FontWeight.w400
                    ),)
                )),
            Positioned(
                top: Globals.getHeight(715),
                right: Globals.getWidth(142),
                child: Container(
                    width: Globals.getWidth(44),
                    child: Divider(
                      thickness: 1.0,
                      color: Colors.white,
                    )
                )),
            Positioned(
                top: Globals.getHeight(834),
                right: Globals.getWidth(84),
                child: TextButton(
                  onPressed: (){
                    Navigator.of(context).push( PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: Login(),
                        duration: new Duration(milliseconds: 300),
                        curve: Curves.easeInOut));
                  },
                  child: Text('Already have an account? Sign in',
                      style: TextStyle(color: Colors.white, fontSize: 14.6,letterSpacing: 1.238)),
                )
            ),
            Positioned(
                top: Globals.getHeight(105),
                left: Globals.getWidth(44),
                child: Container(
                  width: Globals.getWidth(315),
                  height: Globals.getHeight(315),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/onboarding/logo_with_text.png'),fit: BoxFit.contain
                      )
                  ),
                )),
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF000000), Color(0xFF7585FF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
      ),
    );
  }
}
