import 'package:firebase_auth/firebase_auth.dart' as fAuth;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/database/firebase.dart';
import 'package:project7_2/model/user.dart';
import 'package:project7_2/services/auth/auth.dart';
import 'package:project7_2/view/auth/get_started.dart';
import 'package:project7_2/view/auth/login.dart';
import 'package:project7_2/view/auth/verify_mail.dart';
import 'package:project7_2/view/find_places/find_places.dart';
import 'package:project7_2/view/home_screen/home_screen.dart';
import 'package:toast/toast.dart';

class SignIn extends StatefulWidget {
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                Positioned(
                    top: h * 0.6,
                    left: w * 0.1,
                    child: Container(
                      height: h * 0.065,
                      width: w * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.0)
                      ),
                      child: TextButton(
                        child: Text('LOGIN WITH APPLE',
                            style: TextStyle(color: Colors.white,letterSpacing: 1.8)),
                        onPressed: () async {

                            fAuth.User uc = await signInWithGoogle();
                            print('uid is' + uc.uid);
                            bool res = await FirebaseDB.getUserDetails(
                                uc.uid, context);
                            print(res);
                            if (res) {
                              print('con1 ');
                              // await FirebaseDB.createUser(uc.uid, uc.email,
                              //          uc.displayName, context);
                                // Navigator.pop(context);
                                Navigator.of(context).pushReplacement(
                                    new MaterialPageRoute(builder: (context) {
                                  return FindPLaces();
                                }));
                            } else {
                              print('con 2');
                              // Navigator.pop(context);
                              Navigator.of(context).pushReplacement(
                                  new MaterialPageRoute(builder: (context) {
                                return FindPLaces();
                              }));
                            }

                        },
                      ),
                    )),
                Positioned(
                    top: h * 0.68,
                    left: w *0.1,
                    child: Container(
                      height: h * 0.065,
                      width: w * 0.8,
                      decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(8.0)
                      ),
                      child: TextButton(
                        child: Text('LOGIN WITH FACEBOOK',
                            style: TextStyle(color: Colors.white,letterSpacing: 1.8)),
                      ),
                    )),
                Positioned(
                    top: h * 0.76,
                    left:  w *0.1,
                    child: Container(
                      height: h * 0.065,
                      width: w * 0.8,
                      decoration: BoxDecoration(
                          color: Colors.redAccent.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(8.0)
                      ),
                      child: TextButton(
                        onPressed: () async {

                          fAuth.User uc = await signInWithGoogle();
                          print('uid is' + uc.uid);
                          bool res = await FirebaseDB.getUserDetails(
                              uc.uid, context);
                          print(res);
                          if (res) {
                            print('con1 ');
                            // await FirebaseDB.createUser(uc.uid, uc.email,
                            //     uc.displayName, context);
                            // Navigator.pop(context);
                            Navigator.of(context).pushReplacement(
                                new MaterialPageRoute(builder: (context) {
                                  return HomeScreen();
                                }));
                          } else {
                            print('con 2');
                            // Navigator.pop(context);
                            Navigator.of(context).pushReplacement(
                                new MaterialPageRoute(builder: (context) {
                                  return HomeScreen();
                                }));
                          }

                        },
                        child: Text('LOGIN WITH GOOGLE',
                            style: TextStyle(color: Colors.white,letterSpacing: 1.8)),
                      ),
                    )),
                Positioned(
                    top: h * 0.84,
                    left: w *0.25,
                    child: Container(
                      width: w * 0.5,
                      child: Row(
                        children: [
                          SizedBox(
                            width: w *0.2,
                            child: Divider(
                              color: Colors.white,
                              thickness: 1.0,
                            ),
                          ),
                          SizedBox(
                            width: w *0.1,
                            child: Text(
                              'OR',style:TextStyle(color: Colors.white,),textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            width: w *0.2,
                            child: Divider(
                              color: Colors.white,
                              thickness: 1.0,
                            ),
                          ),
                        ],
                      )
                    )),
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
                                return GetStarted();
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
                Positioned(
                  top: h * 0.96,
                  child: TextButton(
                    onPressed: (){
                      Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context){
                        return LogIn();
                      }));
                    },
                    child: Text('Already have an account? Sign in',
                        style: TextStyle(color: Colors.white, fontSize: 17)),
                  )
                ),
              ],
            )),
        onWillPop: () {
          return Future.value(false);
        });
  }
}
