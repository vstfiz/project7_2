import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/view/new_ui/locker_room/chat_screen.dart';

class LockerRoom extends StatefulWidget {
  @override
  _LockerRoomState createState() => _LockerRoomState();
}

class _LockerRoomState extends State<LockerRoom> {
  List<String> texts = [];
  List<String> icons = [];
  bool notificationState = true;
  @override
  void initState() {
    texts.add('Statistics');
    texts.add('Status');
    texts.add('Mates');
    icons.add('assets/images/left_panel/statistics.png');
    icons.add('assets/images/status.png');
    icons.add('assets/images/mates.png');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double h = Globals.height;
    double w = Globals.width;
    return Scaffold(
      backgroundColor: Color(0xFF121217),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: h,
            width: w,
          ),
          Positioned(
            child:
              Text(
                'Locker Rooms ',
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    letterSpacing: 2.0,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
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
                            return GestureDetector(
                              onTap: (){
                                Navigator.of(context).pushReplacement(
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: ChatScreen(),
                                        duration: new Duration(milliseconds: 300),
                                        curve: Curves.easeInOut));
                              },
                              child: Container(
                                  margin: EdgeInsets.only(left: w *0.05,right: w * 0.05,top: 20,bottom: 20),
                                  height: Globals.getHeight(88),
                                  width: Globals.getWidth(353),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: index%2==0?Color(0xFF2DC9EB):Color(0xFF7585FF)
                                  ),
                                  child: Stack(

                                    children: [
                                      Positioned(
                                        child: Container(
                                          height: Globals.getHeight(90),
                                          width: Globals.getWidth(90),
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                    'assets/images/locker_room_card.png',
                                                  ),fit: BoxFit.cover
                                              )
                                          ),
                                        ),
                                        top: Globals.getHeight(5),
                                        left: Globals.getWidth(-5),
                                      ),
                                      Positioned(
                                        child: Container(
                                          height: Globals.getHeight(80),
                                          width: Globals.getWidth(80),
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                    'assets/images/locker_room_duration.png',
                                                  ),fit: BoxFit.cover
                                              )
                                          ),
                                        ),
                                        top: Globals.getHeight(5),
                                        right: Globals.getWidth(0),
                                      ),
                                      Positioned(
                                        child: Text('${Globals.name}\'s Locker Room'.toUpperCase(),style: GoogleFonts.montserrat(
                                            fontSize: 18,letterSpacing: 2.5,fontWeight: FontWeight.w600,
                                            color: Colors.white
                                        ),),
                                        top: Globals.getHeight(32),
                                        left: Globals.getWidth(72),
                                      ),

                                    ],
                                  )
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
          Positioned(
            child: Container(
              child: Column(
                children: List.generate(3, (index){
                  return Container(
                    width: Globals.width,
                    margin: EdgeInsets.symmetric(vertical: Globals.getHeight(20)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: Globals.getWidth(15),),
                        Container(
                          width: Globals.getWidth(20),
                          height: Globals.getHeight(20),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      icons[index]),
                                  fit: BoxFit.contain)),
                        ),
                        SizedBox(width: Globals.getWidth(38.78),),
                        Text(
                          texts[index],
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: Globals.getFontSize(20)),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              width: Globals.width,
              height: Globals.getHeight(215),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Globals.getWidth(8.57)),
              ),
            ),
            bottom: Globals.getHeight(0),
          ),
        ],
      ),
    );
  }
}
