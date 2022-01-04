import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project7_2/custom/globals.dart';

class ChatScreen extends StatefulWidget{
  _ChatScreenState createState ()=> _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>{
  Widget build(BuildContext context){
    double h = Globals.height;
    double w = Globals.width;
    return Scaffold(
      backgroundColor: Color(0xFF121217),
      body: Stack(
        children: [
          Container(
            height: h,
            width: w,
          ),
          Positioned(child: _appBar(h,w),left: 0.0,top: 0.0,),
        ],
      ),
    );
  }
  Widget _appBar(double h, double w){
    return Container(
      height: h *0.08,
      width: w,
      color: Colors.white,
    );
  }
  Widget _chatScreen(){}
  Widget _sendBar(){}
}