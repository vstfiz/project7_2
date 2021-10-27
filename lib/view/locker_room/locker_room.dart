import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:project7_2/custom/globals.dart';

class LockerRoom extends StatefulWidget {
  @override
  _LockerRoomState createState() => _LockerRoomState();
}

class _LockerRoomState extends State<LockerRoom> {
  bool notificationState = true;
  @override
  Widget build(BuildContext context) {
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
          Positioned(
            child: Row(children: [
              Container(
                child: TextButton(
                  onPressed: (){
                    setState(() {
                      Globals.currentTab = 1;
                      Globals.pageController.jumpToPage(1);
                    });
                  },
                  child: Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                'LOCKER ROOMS',
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 2.0,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ]),
            left: w * 0.01,
            top: h * 0.01,
          ),
          Positioned(
            child: Container(
                child: TextButton(
                  onPressed: (){
                    setState(() {
                      notificationState = !notificationState;
                    });
                  },
                  child: Icon(
                    notificationState?Icons.notifications:Icons.notifications_off,
                    color: Colors.white,
                  ),
                ),
            ),
            right: w * 0.01,
            top: h * 0.01,
          ),
          Positioned(
            child: Container(
              height: h * 0.85,
              width: w,
              child: SingleChildScrollView(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('lockerRooms')
                        .where('createdByUid', isEqualTo: Globals.uid).snapshots(),
                    builder: (context, snapshot) {
                      if (Globals.lockerRooms.length == 0) {
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: h* 0.45),
                            child: Text(
                              'You don\'t have any locker rooms yet.',
                              style: TextStyle(
                                  fontFamily: 'Livvic',
                                  color: Colors.grey,
                                  fontSize: 25),
                            ),
                          ),
                        );
                      } else {
                        return Column(
                          children: List.generate(Globals.lockerRooms.length,(index) {
                            return Container(
                              margin: EdgeInsets.only(left: w *0.05,right: w * 0.05,top: 20,bottom: 20),
                              height: h *0.15,
                              width: w * 0.9,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: index%2==0?Color(0xFF2DC9EB):Color(0xFF7585FF)
                              ),
                              child: Center(
                                child: Text('${Globals.name}\'s Locker Room'.toUpperCase(),style: TextStyle(
                                    fontSize: 18,letterSpacing: 2.5
                                ),),
                              ),
                            );
                          }),
                        );
                      }
                    },
                  ),
              )
            ),
            left: 0.0,
            top: h * 0.05,
          ),
        ],
      ),
    );
  }
}
