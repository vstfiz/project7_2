import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/view/auth/verify_mail.dart';
import 'package:swipedetector/swipedetector.dart';

class Connect extends StatefulWidget {
  _ConnectState createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
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
                  child: Container(
                    height: h * 0.05,
                    width: w * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey,width: 1.0)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                        border: InputBorder.none,
                        hintText: 'Search by Username',
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        suffixIcon: Icon(Icons.search)
                      ),
                    ),
                  ),
                  top: h * 0.33,
                  left: w * 0.15,
                ),
                Positioned(
                    top: h * 0.43,
                    child: Container(
                      height: h * 0.065,
                      width: w * 0.5,
                      child: Center(
                        child:  Text('Connect', style: TextStyle(fontSize: 18,color: Colors.black)),
                      )
                    )),
                Positioned(
                    top: h *0.51,
                    child: Container(
                      height: h * 0.065,
                      width: w * 0.5,
                      color: Colors.purple,
                      child: TextButton(
                        child:
                        Text('Facebook', style: TextStyle(color: Colors.white)),
                      ),
                    )),
                Positioned(
                    top: h *0.59,
                    child: Container(
                      height: h * 0.065,
                      width: w * 0.5,
                      color: Colors.blue,
                      child: TextButton(
                        child:
                        Text('Twitter', style: TextStyle(color: Colors.white)),
                      ),
                    )),
                Positioned(
                    top: h *0.67,
                    child: Container(
                      height: h * 0.065,
                      width: w * 0.5,
                      color: Colors.grey[600],
                      child: TextButton(
                        child:
                        Text('E-mail', style: TextStyle(color: Colors.white)),
                      ),
                    )),
                Positioned(
                    top: h *0.75,
                    child: Container(
                      height: h * 0.065,
                      width: w * 0.5,
                      color: Colors.black,
                      child: TextButton(
                        child:
                        Text('Contacts', style: TextStyle(color: Colors.white)),
                      ),
                    )),
              ],
            )),
        onWillPop: () {
          return Future.value(false);
        });
  }
}
