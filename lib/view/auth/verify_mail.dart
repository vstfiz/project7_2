import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/services/auth/auth.dart';
import 'package:project7_2/view/fill_details/add_details.dart';
import 'package:project7_2/view/fill_details/fill_details.dart';
import 'package:project7_2/view/find_places/find_places.dart';

class VerifyMail extends StatefulWidget {
  _VerifyMailState createState() => _VerifyMailState();
}

class _VerifyMailState extends State<VerifyMail> {

  _verifyEmail() async{
    await auth.currentUser.sendEmailVerification();
  }

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
  Timer t;

  @override
  void initState() {
    super.initState();
    _verifyEmail();
    t = new Timer.periodic(new Duration(seconds: 15), (timer) {
      _checkUser();
    });
  }

  _checkUser() async{
    User u = auth.currentUser;
    await u.reload();
    if(u.emailVerified){
      t.cancel();
      Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context){
        return AddDetails();
      }));
    }
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
                ),
                Positioned(
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 40,
                    ),
                  ),
                  right: w * 0.05,
                  top: h * 0.01,
                ),
                Positioned(
                  child: IconButton(
                    icon: new Image.asset('assets/images/back_flip.png'),
                    iconSize: 40,
                  ),
                  left: w * 0.05,
                  top: h * 0.01,
                ),
                Positioned(
                  top: h *0.15,
                  left: w *0.1,
                  child:
                  Text('Verify your \naccount', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 40)),
                ),
                Positioned(
                    top: h *0.3,
                    left: w *0.1,
                    child:
                    RichText(   text: TextSpan(
                        text: 'We have sent a link to your inbox.\n', style: TextStyle(color: Colors.black, fontSize: 20),children: <TextSpan>[
                      TextSpan(text: 'Click ', style: TextStyle(color: Colors.black, fontSize: 20),),
                      TextSpan(text: 'here', style: TextStyle(color: Colors.blueAccent, fontSize: 20,decoration: TextDecoration.underline),recognizer: TapGestureRecognizer(
                      )..onTap = (){
                        _verifyEmail();
                      }),
                      TextSpan(text: ' to resend.', style: TextStyle(color: Colors.black, fontSize: 20),),
                    ]
                    )
                    )),
                Positioned(
                    top: h * 0.8,
                    child: Container(
                      height: h * 0.05,
                      width: w * 0.9,
                      color: Colors.grey,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context){
                            return AddDetails();
                          }));
                        },
                        child:
                        Text('Skip', style: TextStyle(color: Colors.white)),
                      ),
                    )),
              ],
            )
        ),
        onWillPop: () {
          return Future.value(false);
        });
  }
}
