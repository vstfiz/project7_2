import 'dart:ui';

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
import 'package:project7_2/view/new_ui/onboarding/forgot_password.dart';
import 'package:project7_2/view/new_ui/onboarding/otp_login.dart';

import 'lockerroom_welcome.dart';
import 'signup.dart' as s;

class PhoneLogin extends StatefulWidget {
  _PhoneLoginState createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  bool corrPhone = false;
  TextEditingController _phoneController = new TextEditingController();
  RegExp _phoneRegex = new RegExp(r'^(\+[0-9]{1,3})[0-9]{9}$');

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
                top: Globals.getHeight(628),
                left: Globals.width * 0.1,
                child: Container(
                  height: Globals.getHeight(58),
                  width: Globals.width * 0.8,
                  child: TextButton(
                    onPressed: (){
                      Navigator.of(context).pushReplacement(PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: OTPLogin(_phoneController.text),
                          duration: new Duration(milliseconds: 300),
                          curve: Curves.easeInOut));
                    },
                    child: Text('SEND OTP',style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w400, letterSpacing: 2.89, color: Colors.white),),
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xFF7585FF),
                      borderRadius: BorderRadius.circular(Globals.getWidth(58))
                  ),
                )),
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
            Positioned(
                top: Globals.getHeight(492),
                left: Globals.width * 0.1,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 15.0,
                      sigmaY: 15.0,
                    ),
                    child: Container(
                      height: Globals.height * 0.065,
                      width: Globals.width * 0.8,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(20, 15, 38, 0.5),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: TextField(
                        controller: _phoneController,
                        onChanged: (value) {
                          if (_phoneRegex.hasMatch(value)) {

                            setState(() {
                              corrPhone = true;
                            });
                          }
                          else{

                            setState(() {
                              corrPhone = false;
                            });

                          }
                        },
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
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
                              child: corrPhone?Icon(Icons.check,color: Colors.white,size: 19,):Icon(Icons.close,size: 19,color: Colors.white,),
                            ),
                          ),
                          contentPadding:
                          EdgeInsets.only(left: 20.0,bottom: 20.0),
                          hintText: 'MOBILE NUMBER',
                          hintStyle: GoogleFonts.montserrat(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                )),

            Positioned(
                top: Globals.getHeight(848),
                left: Globals.getWidth(18),
                child: Container(
                    child:TextButton(
                      onPressed: (){
                        Navigator.of(context).push( PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: ForgotPassword(),
                            duration: new Duration(milliseconds: 300),
                            curve: Curves.easeInOut));
                      },
                      child:  Text(
                        'Forgot Details ?',
                        style: GoogleFonts.montserrat(
                            color: Colors.white, fontSize: 12,fontWeight: FontWeight.w400, letterSpacing: 1.73),
                      ),
                    )
                )),
            Positioned(
                top: Globals.getHeight(848),
                right: Globals.getWidth(32),
                child: Container(
                    child:TextButton(
                      onPressed: (){
                        Navigator.of(context).pushReplacement( PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: s.Singup(),
                            duration: new Duration(milliseconds: 300),
                            curve: Curves.easeInOut));
                      },
                      child:  Text(
                        'Create Account',
                        style: GoogleFonts.montserrat(
                            color: Colors.white, fontSize: 12,fontWeight: FontWeight.w400,letterSpacing: 1.73),
                      ),
                    )
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
