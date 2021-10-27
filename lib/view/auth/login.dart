import 'dart:ui';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart' as fAuth;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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

class LogIn extends StatefulWidget {
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  bool corrEmail = false;
  bool corrPassword = false;

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
    return Scaffold(
            backgroundColor: Color.fromRGBO(117, 214, 255, 0.9),
            body: SingleChildScrollView(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: h,
                    width: w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/images/background.png',
                          ),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Color.fromRGBO(117, 214, 255, 0.9),
                              BlendMode.darken)),
                    ),
                  ),
                  Positioned(
                      top: h * 0.5,
                      left: w * 0.1,
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 15.0,
                            sigmaY: 15.0,
                          ),
                          child: Container(
                            height: h * 0.065,
                            width: w * 0.8,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(20, 15, 38, 0.5),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: TextField(
                              controller: _usernameController,
                              onChanged: (value) {
                                if (EmailValidator.validate(value)) {

                                  setState(() {
                                    corrEmail = true;
                                  });
                                }
                                else{

                                  setState(() {
                                    corrEmail = false;
                                  });

                                }
                              },
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                suffix: Container(
                                  margin: EdgeInsets.only(right: 20.0,top: 40.0),
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: Center(
                                    child: corrEmail?Icon(Icons.check,color: Colors.white,size: 19,):Icon(Icons.close,size: 19,color: Colors.white,),
                                  ),
                                ),
                                contentPadding:
                                EdgeInsets.only(left: 20.0,bottom: 20.0),
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                      top: h * 0.6,
                      left: w * 0.1,
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 15.0,
                            sigmaY: 15.0,
                          ),
                          child: Container(
                            height: h * 0.065,
                            width: w * 0.8,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(20, 15, 38, 0.5),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: TextField(
                              controller: _passwordController,
                              obscureText: true,
                              obscuringCharacter: '*',
                              onChanged: (value) {
                                if (value.length>=8) {

                                  setState(() {
                                    corrPassword = true;
                                  });
                                }
                                else{

                                  setState(() {
                                    corrPassword = false;
                                  });

                                }
                              },
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                suffix: Container(
                                  margin: EdgeInsets.only(right: 20.0,top: 40.0),
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: Center(
                                    child: corrPassword?Icon(Icons.check,color: Colors.white,size: 19,):Icon(Icons.close,size: 19,color: Colors.white,),
                                  ),
                                ),
                                contentPadding:
                                EdgeInsets.only(left: 20.0,bottom: 20.0),
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                      top: h * 0.84,
                      left: w * 0.1,
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaY: 10.0,
                            sigmaX: 10.0,
                          ),
                          child: Container(
                            height: h * 0.065,
                            width: w * 0.8,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(40.0)),
                            child: TextButton(
                              child: Text('Continue With Facebook'.toUpperCase(),
                                  style: TextStyle(color: Colors.white,fontSize: 17,letterSpacing: 2.0)),
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                      top: h * 0.79,
                      left: w * 0.25,
                      child: Container(
                          width: w * 0.5,
                          child: Row(
                            children: [
                              SizedBox(
                                width: w * 0.2,
                                child: Divider(
                                  color: Colors.white,
                                  thickness: 1.0,
                                ),
                              ),
                              SizedBox(
                                width: w * 0.1,
                                child: Text(
                                  'OR',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                width: w * 0.2,
                                child: Divider(
                                  color: Colors.white,
                                  thickness: 1.0,
                                ),
                              ),
                            ],
                          ))),
                  Positioned(
                      top: h * 0.7,
                      left: w * 0.25,
                      child: Container(
                        height: h * 0.065,
                        width: w * 0.5,
                        decoration: BoxDecoration(
                            color: Colors.deepPurpleAccent,
                            borderRadius: BorderRadius.circular(30.0)),
                        child: TextButton(
                            onPressed: () async {
                              try{
                                _loadingDialog('Logging In');
                                if(EmailValidator.validate(_usernameController.text)){
                                  if(_passwordController.text!=''){
                                    fAuth.User uc = (await auth.signInWithEmailAndPassword(email: _usernameController.text, password: _passwordController.text)).user;
                                    await FirebaseDB.getData();
                                    Navigator.pop(context);
                                    Navigator.of(context).pushReplacement(
                                        new MaterialPageRoute(builder: (context) {
                                          return FindPLaces();
                                        }));
                                  }
                                  else{
                                    Toast.show('Please enter Password', context);
                                  }
                                }
                                else{
                                  Toast.show('Please enter Username',context);
                                }
                              }
                              catch(e){
                                Navigator.pop(context);
                                Toast.show(e.message, context);

                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('GET STARTED',
                                    style: TextStyle(
                                        color: Colors.white, letterSpacing: 1.8)),
                                SizedBox(
                                  width: w * 0.025,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 18,
                                  color: Colors.white,
                                )
                              ],
                            )),
                      )),
                  Positioned(
                      top: h * 0.92,
                      left: w *0.06,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              new MaterialPageRoute(builder: (context) {
                                return LogIn();
                              }));
                        },
                        child: Text('Forgot Details ?'.toUpperCase(),
                            style: TextStyle(color: Colors.white, fontSize: 12,fontWeight: FontWeight.w200,letterSpacing: 2.0)),
                      )),
                  Positioned(
                      top: h * 0.92,
                      right: w *0.06,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              new MaterialPageRoute(builder: (context) {
                                return FillDetails();
                              }));
                        },
                        child: Text('Create Account'.toUpperCase(),
                            style: TextStyle(color: Colors.white, fontSize: 12,fontWeight: FontWeight.w200,letterSpacing: 2.0)),
                      )),
                ],
              ),
            ));
  }
}
