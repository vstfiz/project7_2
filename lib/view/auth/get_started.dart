import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart' as fAuth;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/database/firebase.dart';
import 'package:project7_2/model/user.dart';
import 'package:project7_2/services/auth/auth.dart';
import 'package:project7_2/view/auth/login.dart';
import 'package:project7_2/view/auth/verify_mail.dart';
import 'package:project7_2/view/find_places/find_places.dart';
import 'package:toast/toast.dart';

class GetStarted extends StatefulWidget {
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  Future<void> _loadingDialog(String value) {
    return showDialog<void>(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            backgroundColor: Colors.white,
            content: Container(
                height: 60,
                child: Center(
                  child: Row(
                    children: <Widget>[
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        value,
                        style: TextStyle(
                            fontFamily: "Livvic",
                            fontSize: 23,
                            letterSpacing: 1),
                      )
                    ],
                  ),
                ))));
  }

  @override
  Widget build(BuildContext context) {
    double h = Globals.height;
    double w = Globals.width;
    return WillPopScope(
        child: Scaffold(
            backgroundColor: Colors.grey[300],
            body: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: h,
                  width: w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/background.png',),fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(child:


                ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaY: 2.5,
                        sigmaX: 2.5,
                      ),
                      child: Container(
                        height: h * 0.57,
                        width: w,
                        color: Colors.transparent,
                      ),
                    ),
                  ),bottom: 0.0,left: 0.0,top: 400,),
                Positioned(
                    top: h * 0.88,
                    left: w* 0.25,
                    child: Container(
                      height: h * 0.065,
                      width: w * 0.5,
                      decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(30.0)
                      ),
                      child: TextButton(
                        onPressed: (){

                          Navigator.of(context).push(
                              new MaterialPageRoute(builder: (context) {
                                return LogIn();
                              }));
                        },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('GET STARTED',
                                  style: TextStyle(color: Colors.white, letterSpacing: 1.8)),
                              SizedBox(
                                width: w *0.025,
                              ),
                              Icon(Icons.arrow_forward_ios,size: 18,color: Colors.white,)
                            ],
                          )
                      ),
                    )),

              ],
            )),
        onWillPop: () {
          return Future.value(false);
        });
  }
}
