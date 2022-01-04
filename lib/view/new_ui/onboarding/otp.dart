import 'dart:async';
import 'dart:collection';
import 'dart:ui';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/services/auth/auth.dart';
import 'package:project7_2/view/new_ui/onboarding/fill.dart';
import 'package:project7_2/view/new_ui/onboarding/gender.dart';
import 'package:toast/toast.dart';

class OTP extends StatefulWidget {
  String phone;

  OTP(this.phone);

  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final int time = 30;
  int timeInSeconds;
  String smsOtp;
  Timer t;

  _sendOtp() async {
    await verifyPhone(this.widget.phone, context);
  }

  Future<Null> _startCountdown() async {
    timeInSeconds = time;
    t = new Timer.periodic(new Duration(seconds: 1), (timer) {
      if (timeInSeconds > 0) {
        setState(() {
          timeInSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _sendOtp();
    _startCountdown();
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
                height: Globals.getHeight(80),
                child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Authenticating'.toUpperCase(),style: GoogleFonts.montserrat(fontWeight: FontWeight.w400,fontSize:20,letterSpacing: 1.6),),

                        Container(child:  LinearProgressIndicator(
                          backgroundColor: Colors.grey,
                          valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.blueGrey),
                        ),width: Globals.getWidth(200))
                      ],
                    )
                ))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Globals.height,
        width: Globals.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: Globals.width,
              height: Globals.height,
            ),
            Positioned(
              child: Container(
                  height: Globals.getHeight(50),
                  child: Text(
                    'validate number'.toUpperCase(),
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        letterSpacing: 1.59),
                  )),
              top: Globals.getHeight(64),
            ),
            Positioned(
              child: Container(
                height: Globals.getHeight(30),
                width: Globals.getWidth(30),
                child: TextButton(
                    onPressed: () {
                      t.cancel();
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    )),
              ),
              top: Globals.getHeight(58),
              left: Globals.getWidth(10),
            ),
            Positioned(
              child: Container(
                  height: Globals.getHeight(50),
                  child: Text(
                    'A 6-digit confirmation code has been sent\nto ${this.widget.phone.substring(3, 6)}-${this.widget.phone.substring(6, 9)}-${this.widget.phone.substring(9)} via SMS. ',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        letterSpacing: 0.17),
                  )),
              top: Globals.getHeight(189.67),
            ),
            Positioned(
                top: Globals.getHeight(275),
                left: Globals.width * 0.08,
                child: Container(
                    height: Globals.height * 0.1,
                    width: Globals.width * 0.82,
                    child: PinCodeTextField(
                      textStyle: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      appContext: context,
                      keyboardType: TextInputType.phone,
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          fieldOuterPadding: EdgeInsets.symmetric(
                              horizontal: Globals.getWidth(2.0)),
                          borderRadius: BorderRadius.circular(8),
                          fieldHeight: Globals.getHeight(68),
                          fieldWidth: Globals.getWidth(51),
                          activeFillColor: Colors.white,
                          borderWidth: 1.0,
                          activeColor: Colors.white,
                          disabledColor: Colors.white,
                          errorBorderColor: Colors.red,
                          inactiveColor: Colors.white,
                          inactiveFillColor: Colors.white,
                          selectedFillColor: Colors.white,
                          selectedColor: Color(0xFFA573FF)),
                      keyboardAppearance: Brightness.dark,
                      autoDismissKeyboard: true,
                      length: 6,
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            smsOtp = value;
                          });
                        },
                      onCompleted: (value) async {
                        print(value);
                        _loadingDialog('dawd');
                        try {
                          User u = await signInWithPhone(value, context);
                          if(u!=null){
                            t.cancel();
                            // await u.linkWithCredential(Globals.creationAuthCredential);
                            Navigator.pop(context);
                            Navigator.of(context).pushReplacement(PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: Data(),
                                duration: new Duration(milliseconds: 300),
                                curve: Curves.easeInOut));
                          }
                          else{Navigator.pop(context);Toast.show('OTP Authentication Failure', context);}

                        } catch (e) {
                          Navigator.pop(context);
                            print(e.toString());
                            Toast.show(e.toString(), context);
                        }
                      },
                    ))),
            Positioned(
              child: Container(
                  height: Globals.getHeight(50),
                  child: TextButton(
                    onPressed: () {
                      if (timeInSeconds == 0) {
                        setState(() {
                          timeInSeconds = time;
                        });
                        // resend code
                      }
                    },
                    child: Text(
                      'Resend Confirmation code (0:${timeInSeconds.toString()})',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: timeInSeconds != 0
                              ? Color(0xFF6C7B8A)
                              : Colors.white,
                          letterSpacing: 0.17),
                    ),
                  )),
              top: Globals.getHeight(540.53),
            ),
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF231F20), Color(0xFF7585FF)])),
      ),
    );
  }
}
