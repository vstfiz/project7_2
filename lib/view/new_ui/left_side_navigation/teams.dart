import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project7_2/custom/globals.dart';

class Teams extends StatefulWidget {
  _TeamsState createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {
  TextEditingController _searchController = new TextEditingController();

  var all = ['new', 'joined on 22/04/21', 'joined on 22/04/21', 'expired'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Globals.height,
        width: Globals.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xFF0F0F0F), Color(0xFF606CCD), Color(0xFF7585FF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: Container(
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.clear,
                      color: Colors.white,
                      size: 30,
                    )),
              ),
              top: Globals.getHeightLeftPanel(125),
              left: Globals.getWidth(20),
            ),
            Positioned(
              child: Container(
                  height: Globals.getHeightLeftPanel(50),
                  child: Text(
                    'teams'.toUpperCase(),
                    style: GoogleFonts.montserrat(
                        fontSize: Globals.getFontSize(20),
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        letterSpacing: 2.89),
                  )),
              top: Globals.getHeightLeftPanel(130),
            ),

            Positioned(
              child: Container(
                  child: TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.white,
                ),
              )),
              top: Globals.getHeightLeftPanel(125),
              right: Globals.getWidth(16),
            ),
            Positioned(
                top: Globals.getHeightLeftPanel(211),
                child: Container(
                  width: Globals.width,
                  height: Globals.height - Globals.getHeightLeftPanel(211),
                  child: ListView(
                    children: List.generate(all.length, (index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                            vertical: Globals.getHeightLeftPanel(6.0),
                            horizontal: Globals.getWidth(9.0)),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.4),
                            borderRadius:
                                BorderRadius.circular(Globals.getWidth(5.96))),
                        child: Stack(
                          children: [
                            Positioned(
                              top: Globals.getHeightLeftPanel(17.22),
                              left: Globals.getWidth(22.96),
                              child: Container(
                                height: Globals.getHeightLeftPanel(16.74),
                                padding: EdgeInsets.symmetric(
                                    vertical: 3.0,
                                    horizontal: Globals.getWidth(5.0)),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Globals.getWidth(8.0)),
                                    color: all[index] != 'new'
                                        ? Colors.black
                                        : Color(0xFFFF3A79)),
                                child: Center(
                                  child: Text(
                                    all[index].toUpperCase(),
                                    maxLines: 1,
                                    style: GoogleFonts.montserrat(
                                        fontSize: Globals.getFontSize(10),
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 2.0),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: Globals.getHeightLeftPanel(50.93),
                              left: Globals.getWidth(23.51),
                              child: Container(
                                child: Text(
                                  'XCalibur',
                                  style: GoogleFonts.montserrat(
                                      fontSize: Globals.getFontSize(20),
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.0),
                                ),
                              ),
                            ),
                            Positioned(
                              top: Globals.getHeightLeftPanel(17),
                              left: Globals.getWidth(294),
                              child: Container(
                                height: Globals.getHeightLeftPanel(95.7),
                                width: Globals.getWidth(95.7),
                                decoration: BoxDecoration(
                      backgroundBlendMode: BlendMode.overlay,
                                    color: Colors.white.withOpacity(0.4),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/left_panel/user-avatar.png'))),
                              ),
                            ),
                            Positioned(
                              bottom: Globals.getHeightLeftPanel(12.68),
                              left: Globals.getWidth(23.51),
                              child: Container(
                                height: Globals.getHeightLeftPanel(18.77),
                                padding: EdgeInsets.symmetric(
                                    vertical: 3.0,
                                    horizontal: Globals.getWidth(5.0)),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Globals.getWidth(8.0)),
                                    color: Colors.black,
                                    border: Border.all(
                                        color: Color(0xFF7585FF), width: 1.71)),
                                child: Center(
                                  child: Text(
                                    'GO TO TEAM',
                                    style: GoogleFonts.montserrat(
                                        fontSize: Globals.getFontSize(8),
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 2.0),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        height: Globals.getHeightLeftPanel(138.31),
                        width: Globals.getWidth(396),
                      );
                    }),
                  ),
                )),

            // Positioned(
            //     top: Globals.getHeightLeftPanel(89),
            //     left: Globals.getWidth(26),
            //     child:ClipRRect(
            //       child: BackdropFilter(
            //         filter: ImageFilter.blur(
            //           sigmaX: 15.0,
            //           sigmaY: 15.0,
            //         ),
            //         child: Container(
            //           width: Globals.getWidth(281),
            //           height: Globals.getHeightLeftPanel(62),
            //           decoration: BoxDecoration(
            //               color: Color.fromRGBO(255, 255, 255, 0.27),
            //               borderRadius: BorderRadius.circular(Globals.getWidth(100)),backgroundBlendMode: BlendMode.difference
            //           ),
            //           child: TextField(
            //             controller: _searchController,
            //             textAlignVertical: TextAlignVertical.center,
            //             cursorHeight: Globals.getHeightLeftPanel(25),
            //             cursorColor: Color(0xFF7585FF),
            //             style:  GoogleFonts.montserrat(
            //               fontSize: 16,
            //               fontWeight: FontWeight.w300,
            //               color: Colors.white,
            //             ),
            //             decoration: InputDecoration(
            //                 border: InputBorder.none,
            //                 suffixIcon: Padding(
            //                   padding: EdgeInsets.only(top: Globals.getHeightLeftPanel(12.0),right: 12.0),
            //                   child: Icon(Icons.search,color: Colors.white,size: 30,),
            //                 ),
            //                 hintText: 'Find Something...',
            //                 hintStyle: GoogleFonts.montserrat(
            //                   fontSize: 16,
            //                   fontWeight: FontWeight.w300,
            //                   color: Colors.white,
            //                 ),
            //                 contentPadding: EdgeInsets.only(left: 25.0,top: Globals.getHeightLeftPanel(12),right: 15.0)
            //             ),
            //           ),
            //         ),
            //       ),
            //     )
            // ),
          ],
        ),
      ),
    );
  }
}
