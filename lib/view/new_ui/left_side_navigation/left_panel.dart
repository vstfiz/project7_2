import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/view/new_ui/left_side_navigation/notifications.dart';
import 'package:project7_2/view/new_ui/left_side_navigation/teams.dart';
import 'package:project7_2/view/new_ui/left_side_navigation/venue_bookings.dart';

class LeftPanel extends StatefulWidget{
  _LeftPanelState createState()=> _LeftPanelState();
}

class _LeftPanelState extends State<LeftPanel>{
  TextEditingController _searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Globals.height,
        width: Globals.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F0F0F),Color(0xFF606CCD),Color(0xFF7585FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        ),
        child: Stack(
          children: [
            Positioned(
              top: Globals.getHeightLeftPanel(89),
              left: Globals.getWidth(26),
              child:ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 15.0,
                    sigmaY: 15.0,
                  ),
                  child: Container(
                    width: Globals.getWidth(281),
                    height: Globals.getHeightLeftPanel(62),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.27),
                        borderRadius: BorderRadius.circular(Globals.getWidth(100)),backgroundBlendMode: BlendMode.difference
                    ),
                    child: TextField(
                      controller: _searchController,
                      textAlignVertical: TextAlignVertical.center,
                      cursorHeight: Globals.getHeightLeftPanel(25),
                      cursorColor: Color(0xFF7585FF),
                      style:  GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(top: Globals.getHeightLeftPanel(12.0),right: 12.0),
                            child: Icon(Icons.search,color: Colors.white,size: 30,),
                          ),
                          hintText: 'Find Something...',
                          hintStyle: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                          contentPadding: EdgeInsets.only(left: 25.0,top: Globals.getHeightLeftPanel(12),right: 15.0)
                      ),
                    ),
                  ),
                ),
              )
            ),
            Positioned(
              top: Globals.getHeightLeftPanel(229),
              left: Globals.getWidth(37),
              child: Container(
                width: Globals.width,
                height: Globals.getHeightLeftPanel(40),
                child: Row(
                  children: [
                    Image.asset('assets/images/left_panel/create.png',height: Globals.getHeightLeftPanel(30),width: Globals.getWidth(30),),
                    SizedBox(
                      width: Globals.getWidth(30),
                    ),
                    Text(
                      'Create',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: Globals.getHeightLeftPanel(307),
              left: Globals.getWidth(37),
              child: Container(
                width: Globals.width,
                height: Globals.getHeightLeftPanel(40),
                child: Row(
                  children: [
                    Image.asset('assets/images/left_panel/message.png',height: Globals.getHeightLeftPanel(30),width: Globals.getWidth(30),),
                    SizedBox(
                      width: Globals.getWidth(30),
                    ),
                    Text(
                      'Message',
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: Globals.getHeightLeftPanel(376),
              left: Globals.getWidth(37),
              child: GestureDetector(
                onTap: (){
                  // Navigator.of(context).push(PageTransition(
                  //     type: PageTransitionType.rightToLeft,
                  //     child: Teams(),
                  //     duration: new Duration(milliseconds: 300),
                  //     curve: Curves.easeInOut));
                },
                child: Container(
                  width: Globals.width,
                  height: Globals.getHeightLeftPanel(40),
                  child: Row(
                    children: [
                      Image.asset('assets/images/left_panel/teams.png',height: Globals.getHeightLeftPanel(30),width: Globals.getWidth(30),),
                      SizedBox(
                        width: Globals.getWidth(30),
                      ),
                      Text(
                        'Teams',
                        style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: Globals.getHeightLeftPanel(452),
              left: Globals.getWidth(37),
              child: Container(
                width: Globals.width,
                height: Globals.getHeightLeftPanel(40),
                child: Row(
                  children: [
                    Image.asset('assets/images/left_panel/wallet.png',height: Globals.getHeightLeftPanel(30),width: Globals.getWidth(30),),
                    SizedBox(
                      width: Globals.getWidth(30),
                    ),
                    Text(
                      'Wallet',
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: Globals.getHeightLeftPanel(525),
              left: Globals.getWidth(37),
              child: Container(
                width: Globals.width,
                height: Globals.getHeightLeftPanel(40),
                child: Row(
                  children: [
                    Image.asset('assets/images/left_panel/settings.png',height: Globals.getHeightLeftPanel(30),width: Globals.getWidth(30),),
                    SizedBox(
                      width: Globals.getWidth(30),
                    ),
                    Text(
                      'Settings',
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: Globals.getHeightLeftPanel(600),
              left: Globals.getWidth(37),
              child: GestureDetector(
                onTap: (){
                  // Navigator.of(context).push(PageTransition(
                  //     type: PageTransitionType.rightToLeft,
                  //     child: Notifications(),
                  //     duration: new Duration(milliseconds: 300),
                  //     curve: Curves.easeInOut));
                },
                child: Container(
                  width: Globals.width,
                  height: Globals.getHeightLeftPanel(40),
                  child: Row(
                    children: [
                      Image.asset('assets/images/left_panel/notifications.png',height: Globals.getHeightLeftPanel(30),width: Globals.getWidth(30),),
                      SizedBox(
                        width: Globals.getWidth(30),
                      ),
                      Text(
                        'Notifications',
                        style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: Globals.getHeightLeftPanel(677),
              left: Globals.getWidth(37),
              child: Container(
                width: Globals.width,
                height: Globals.getHeightLeftPanel(40),
                child: Row(
                  children: [
                    Image.asset('assets/images/left_panel/mates.png',height: Globals.getHeightLeftPanel(30),width: Globals.getWidth(30),),
                    SizedBox(
                      width: Globals.getWidth(30),
                    ),
                    Text(
                      'Mates',
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: Globals.getHeightLeftPanel(748),
              left: Globals.getWidth(37),
              child: Container(
                width: Globals.width,
                height: Globals.getHeightLeftPanel(40),
                child: Row(
                  children: [
                    Image.asset('assets/images/left_panel/tournament.png',height: Globals.getHeightLeftPanel(30),width: Globals.getWidth(30),),
                    SizedBox(
                      width: Globals.getWidth(30),
                    ),
                    Text(
                      'Tournament',
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: Globals.getHeightLeftPanel(816),
              left: Globals.getWidth(37),
              child: GestureDetector(
                onTap: (){
                  // Navigator.of(context).push(PageTransition(
                  //   type: PageTransitionType.rightToLeft,
                  //   child: VenueBookings(),
                  //   duration: new Duration(milliseconds: 300),
                  //   curve: Curves.easeInOut));
                  },
                child: Container(
                  width: Globals.width,
                  height: Globals.getHeightLeftPanel(40),
                  child: Row(
                    children: [
                      Image.asset('assets/images/left_panel/venue.png',height: Globals.getHeightLeftPanel(30),width: Globals.getWidth(30),),
                      SizedBox(
                        width: Globals.getWidth(30),
                      ),
                      Text(
                        'Venue',
                        style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),
                      )
                    ],
                  ),
                ),
              )
            ),
            Positioned(
              top: Globals.getHeightLeftPanel(873),
              left: Globals.getWidth(37),
              child: Container(
                width: Globals.width,
                height: Globals.getHeightLeftPanel(40),
                child: Row(
                  children: [
                    Image.asset('assets/images/left_panel/statistics.png',height: Globals.getHeightLeftPanel(30),width: Globals.getWidth(30),),
                    SizedBox(
                      width: Globals.getWidth(30),
                    ),
                    Text(
                      'Statistics',
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: Globals.getHeightLeftPanel(941),
              left: Globals.getWidth(37),
              child: Container(
                width: Globals.width,
                height: Globals.getHeightLeftPanel(40),
                child: Row(
                  children: [
                    Image.asset('assets/images/left_panel/profile_image.png',height: Globals.getHeightLeftPanel(40),width: Globals.getWidth(40),),
                    SizedBox(
                      width: Globals.getWidth(20),
                    ),
                    Text(
                      'Vivek Sharma',
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: Globals.getHeightLeftPanel(941),
              left: Globals.getWidth(65),
              child: Container(
                width: Globals.getWidth(14),
                height: Globals.getHeightLeftPanel(14),
                decoration: BoxDecoration(
                  color: Color(0xFF03A927),
                  shape: BoxShape.circle
                ),
              ),
            ),
            Positioned(
              top: Globals.getHeightLeftPanel(300),
              left: Globals.getWidth(52),
              child: Container(
                width: Globals.getWidth(18),
                height: Globals.getHeightLeftPanel(22.4),
                child: Center(
                  child: Text(
                    '3',
                    style: GoogleFonts.montserrat(fontSize: 8.0,color: Colors.white,fontWeight: FontWeight.w500),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Color(0xFF1DCFC9),
                    shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(3)
                ),
              ),
            ),
            Positioned(
              top: Globals.getHeightLeftPanel(596),
              left: Globals.getWidth(55),
              child: Container(
                width: Globals.getWidth(17),
                height: Globals.getHeightLeftPanel(22.4),
                child: Center(
                  child: Text(
                    '12',
                    style: GoogleFonts.montserrat(fontSize: 8.0,color: Colors.white,fontWeight: FontWeight.w500),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Color(0xFF1DCFC9),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(3)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}