import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart' as fAuth;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/database/firebase.dart';
import 'package:project7_2/model/user.dart';
import 'package:project7_2/services/auth/auth.dart';
import 'package:project7_2/view/auth/verify_mail.dart';
import 'package:project7_2/view/request_permissions/request_permissions.dart';
import 'package:toast/toast.dart';

class GetPass extends StatefulWidget {

  _GetPassState createState() => _GetPassState();
}

class _GetPassState extends State<GetPass> {
  String usernameError = null;
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _cnfPasswordController = new TextEditingController();

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
            body: SingleChildScrollView(child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: h,
                  width: w,
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
                  top: h * 0.1,
                  left: w * 0.1,
                  child: Text('Hi, please choose a \npassword for \nyourself',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 40)),
                ),
                Positioned(
                  child: Container(
                    height: h * 0.05,
                    width: w * 0.9,
                    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(width: 1.0, color: Colors.grey)),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  top: h * 0.5,
                  left: w * 0.05,
                ),
                Positioned(
                  child: Container(
                    height: h * 0.05,
                    width: w * 0.9,
                    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(width: 1.0, color: Colors.grey)),
                    child: TextField(
                      controller: _cnfPasswordController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  top: 1+ h * 0.6 ,
                  left: w * 0.05,
                ),
                Positioned(
                    top: h * 0.85,
                    child: Container(
                      height: h * 0.05,
                      width: w * 0.9,
                      color: Colors.green,
                      child: TextButton(
                        onPressed: () async {
                          try{
                            _loadingDialog('Signing Up');
                            if(_passwordController.text!=''){
                              if(_cnfPasswordController.text!=''){
                                if(_passwordController.text == _cnfPasswordController.text){
                                  fAuth.User uc = (await auth.createUserWithEmailAndPassword(email: Globals.email, password: _passwordController.text)).user;
                                  setState(() {
                                    Globals.uid = uc.uid;
                                  });
                                  await FirebaseDB.createUser(Globals.uid,Globals.email,Globals.name, context);
                                  Navigator.pop(context);
                                  Navigator.of(context).pushReplacement(
                                      new MaterialPageRoute(builder: (context) {
                                        return VerifyMail();
                                      }));

                                }
                                else{
                                  Toast.show('Passwords do not match', context);
                                }
                              }
                              else{
                                Toast.show('Please Confirm Entered Password', context);
                              }
                            }
                            else{
                              Toast.show('Please enter password',context);
                            }
                          }
                          catch(e){
                            Navigator.pop(context);
                            print(e.message);
                            Toast.show(e.message, context);

                          }
                        },
                        child:
                        Text('Next', style: TextStyle(color: Colors.white)),
                      ),
                    )),
              ],
            ),)),
        onWillPop: () {
          return Future.value(false);
        });
  }
}