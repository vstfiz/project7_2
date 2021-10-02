import 'package:firebase_auth/firebase_auth.dart' as fAuth;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/database/firebase.dart';
import 'package:project7_2/model/user.dart';
import 'package:project7_2/services/auth/auth.dart';
import 'package:project7_2/view/auth/login.dart';
import 'package:project7_2/view/auth/verify_mail.dart';
import 'package:project7_2/view/fill_details/add_details.dart';
import 'package:project7_2/view/fill_details/fill_details.dart';
import 'package:project7_2/view/find_places/find_places.dart';
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
                ),
                Positioned(
                  child: Container(
                    width: w * 0.3,
                    height: w * 0.3,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Center(
                      child: Text(
                        'LOGO',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  top: h * 0.1,
                  left: w * 0.4,
                ),
                Positioned(
                  child: Text(
                    'Sign In/Up',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  top: h * 0.33,
                  left: w * 0.1,
                ),
                Positioned(
                    top: h * 0.43,
                    child: Container(
                      height: h * 0.065,
                      width: w * 0.5,
                      color: Colors.red,
                      child: TextButton(
                        child: Text('Gmail',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () async {

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
                    top: h * 0.51,
                    child: Container(
                      height: h * 0.065,
                      width: w * 0.5,
                      color: Colors.purple,
                      child: TextButton(
                        child: Text('Facebook',
                            style: TextStyle(color: Colors.white)),
                      ),
                    )),
                Positioned(
                    top: h * 0.59,
                    child: Container(
                      height: h * 0.065,
                      width: w * 0.5,
                      color: Colors.blue,
                      child: TextButton(
                        child: Text('Twitter',
                            style: TextStyle(color: Colors.white)),
                      ),
                    )),
                Positioned(
                    top: h * 0.67,
                    child: Container(
                      height: h * 0.065,
                      width: w * 0.5,
                      color: Colors.grey[600],
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              new MaterialPageRoute(builder: (context) {
                            return FillDetails();
                          }));
                        },
                        child: Text('E-mail',
                            style: TextStyle(color: Colors.white)),
                      ),
                    )),
                Positioned(
                    top: h * 0.75,
                    child: Container(
                      height: h * 0.065,
                      width: w * 0.5,
                      color: Colors.black,
                      child: TextButton(
                        child: Text('Phone',
                            style: TextStyle(color: Colors.white)),
                      ),
                    )),
                Positioned(
                  top: h * 0.83,
                  child: Text('Already have an account?',
                      style: TextStyle(color: Colors.black, fontSize: 17)),
                ),
                Positioned(
                    top: h * 0.86,
                    child: Container(
                      height: h * 0.04,
                      color: Colors.greenAccent,
                      child: TextButton(
                        onPressed: () async {
                          Navigator.of(context).pushReplacement(
                              new MaterialPageRoute(builder: (context) {
                            return LogIn();
                          }));
                        },
                        child: Text('Log In',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ),
                    )),
                Positioned(
                  top: h * 0.91,
                  child: Text('Forgot Password?',
                      style: TextStyle(color: Colors.black, fontSize: 17)),
                ),
                Positioned(
                    top: h * 0.94,
                    child: Container(
                      height: h * 0.05,
                      width: w * 0.9,
                      color: Colors.grey,
                      child: TextButton(
                        onPressed: () async {
                          _loadingDialog('Authenticating');
                          try {
                                await auth.signInAnonymously();
                            Navigator.pop(context);
                            Navigator.of(context).pushReplacement(
                                new MaterialPageRoute(builder: (context) {
                              return FindPLaces();
                            }));
                          } catch (e) {
                            Navigator.pop(context);
                          }
                        },
                        child:
                            Text('Skip', style: TextStyle(color: Colors.white)),
                      ),
                    )),
              ],
            )),
        onWillPop: () {
          return Future.value(false);
        });
  }
}
