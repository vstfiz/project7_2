import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project7_2/custom/globals.dart';

class Notifications extends StatefulWidget{
  _NotificationsState createState()=> _NotificationsState();
}

class _NotificationsState extends State<Notifications>{
  TextEditingController _searchController = new TextEditingController();
  bool isAllSelected = true;
  bool isRequestSelected = false;
  bool isTournamentSelected = false;

  var all = ['new','team', 'new','tournament'];
  var team = [''];
  var tournament = [''];

  @override
  void initState() {
    super.initState();
  _getData();
  }

  _getData(){
    all.forEach((element) {
      if(element == 'team'){
        team.add(element);
      }
      else if(element == 'tournament'){
        tournament.add(element);
      }
    });
  }

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
                    'notifications'.toUpperCase(),
                    style: GoogleFonts.montserrat(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        letterSpacing: 2.89),
                  )),
              top: Globals.getHeightLeftPanel(130),
            ),

            Positioned(
              child: Container(
                  child: TextButton(
                    onPressed: (){},
                    child: Icon(Icons.search,size: 30,color: Colors.white,),
                  )),
              top: Globals.getHeightLeftPanel(125),
              right: Globals.getWidth(16),
            ),
            Positioned(
              child: Container(
                height: Globals.getHeightLeftPanel(40),
                  width:Globals.getWidth(393) ,
                  child: Row(
                    children: [
                      SizedBox(
                        width: Globals.getWidth(2.64),
                      ),
                      Container(
                        height: Globals.getHeightLeftPanel(34),
                        width:Globals.getWidth(127.5) ,
                        child: TextButton(
                          onPressed: (){
                            setState(() {
                              isAllSelected = true;
                              isRequestSelected = false;
                              isTournamentSelected = false;
                            });
                          },
                          child: Text('All',style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white
                          ),),
                        ),
                        decoration: BoxDecoration(
                            color: isAllSelected?Color(0xFF7585FF):Colors.black,
                            borderRadius: BorderRadius.circular(Globals.getWidth(9))
                        ),
                      ),
                      SizedBox(
                        width: Globals.getWidth(2.64),
                      ),
                      Container(
                        height: Globals.getHeightLeftPanel(34),
                        width:Globals.getWidth(127.15) ,
                        child: TextButton(
                          onPressed: (){
                            setState(() {
                              isAllSelected = false;
                              isRequestSelected = true;
                              isTournamentSelected = false;
                            });
                          },
                          child: Text('Requests',style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                          ),),
                        ),
                        decoration: BoxDecoration(
                            color: isRequestSelected?Color(0xFF7585FF):Colors.black,
                            borderRadius: BorderRadius.circular(Globals.getWidth(9))
                        ),
                      ),
                      SizedBox(
                        width: Globals.getWidth(2.64),
                      ),
                      Container(
                        height: Globals.getHeightLeftPanel(34),
                        width:Globals.getWidth(127.15) ,
                        child: TextButton(
                          onPressed: (){
                            setState(() {
                              isAllSelected = false;
                              isRequestSelected = false;
                              isTournamentSelected = true;
                            });
                          },
                          child: Text('Tournaments',style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                          ),),
                        ),
                        decoration: BoxDecoration(
                            color: isTournamentSelected?Color(0xFF7585FF):Colors.black,
                            borderRadius: BorderRadius.circular(Globals.getWidth(9))
                        ),
                      ),
                    ],
                  ),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(Globals.getWidth(9))
              ),
              ),
              top: Globals.getHeightLeftPanel(224),
              right: Globals.getWidth(10.86),
            ),
            Positioned(
              top: Globals.getHeightLeftPanel(280),
              child: isAllSelected?
              Container(
                width: Globals.width,
                height: Globals.height - Globals.getHeightLeftPanel(280),
                child: ListView(
                  children: List.generate(all.length, (index) {
                    return all[index]=='new'?Container(
                      margin: EdgeInsets.symmetric(vertical: Globals.getHeightLeftPanel(6.0), horizontal: Globals.getWidth(9.0)),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.4),
                        borderRadius: BorderRadius.circular(Globals.getWidth(5.96))
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: Globals.getHeightLeftPanel(17.22),
                            left: Globals.getWidth(22.96),
                            child: Container(
                              height: Globals.getHeightLeftPanel(16.74),
                              width: Globals.getWidth(39.18),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Globals.getWidth(8.0)),
                                color: Color(0xFFFF3A79)
                              ),
                              child: Center(
                                child: Text('NEW',style: GoogleFonts.montserrat(fontSize: 10,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 2.0),),
                              ),
                            ),
                          ),
                          Positioned(
                            top: Globals.getHeightLeftPanel(50.93),
                            left: Globals.getWidth(23.51),
                            child: Container(
                              child: Text('Tagged in Raunak’s Lockeroom',style: GoogleFonts.montserrat(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 1.0),),
                            ),
                          ),
                          Positioned(
                            top: Globals.getHeightLeftPanel(70.02),
                            left: Globals.getWidth(22.96),
                            child: Container(
                              child: Text('Yo @arpit, do you have 5.5 size shoes?',style: GoogleFonts.montserrat(fontSize: 12,color: Color(0xFF6C7B8A),fontWeight: FontWeight.w500,letterSpacing: 1.0),),
                            ),
                          ),
                          Positioned(
                            bottom: Globals.getHeightLeftPanel(12.68),
                            left: Globals.getWidth(23.51),
                            child: Container(
                              height: Globals.getHeightLeftPanel(13.77),
                              width: Globals.getWidth(111.63),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Globals.getWidth(8.0)),
                                  color: Colors.black,
                                border: Border.all(
                                  color: Color(0xFF7585FF),
                                  width: 1.71
                                )
                              ),
                              child: Center(
                                child: Text('GO TO LOCKEROOM',style: GoogleFonts.montserrat(fontSize: 8,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 2.0),),
                              ),
                            ),
                          )
                        ],
                      ),
                      height: Globals.getHeightLeftPanel(138.31),
                      width: Globals.getWidth(396),
                    ):all[index]=='team'?Container(
                      margin: EdgeInsets.symmetric(vertical: Globals.getHeightLeftPanel(6.0), horizontal: Globals.getWidth(9.0)),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(Globals.getWidth(5.96))
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: Globals.getHeightLeftPanel(17.22),
                            left: Globals.getWidth(22.96),
                            child: Container(
                              height: Globals.getHeightLeftPanel(16.74),
                              width: Globals.getWidth(107.18),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Globals.getWidth(8.0)),
                                  color: Color(0xFF7585FF)
                              ),
                              child: Center(
                                child: Text('TEAM REQUEST',style: GoogleFonts.montserrat(fontSize: 10,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 2.0),),
                              ),
                            ),
                          ),
                          Positioned(
                            top: Globals.getHeightLeftPanel(50.93),
                            left: Globals.getWidth(23.51),
                            child: Container(
                              child: Text('By Shawn Mendes for Team Xcalibur',style: GoogleFonts.montserrat(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 1.0),),
                            ),
                          ),
                          Positioned(
                            top: Globals.getHeightLeftPanel(70.02),
                            left: Globals.getWidth(22.96),
                            child: Container(
                              child: Text('For 15/12/2021 game lising',style: GoogleFonts.montserrat(fontSize: 12,color: Color(0xFF6C7B8A),fontWeight: FontWeight.w500,letterSpacing: 1.0),),
                            ),
                          ),
                          Positioned(
                            bottom: Globals.getHeightLeftPanel(22.68),
                            left: Globals.getWidth(23.51),
                            child: Container(
                              height: Globals.getHeightLeftPanel(13.77),
                              width: Globals.getWidth(48.63),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Globals.getWidth(8.0)),
                                  color: Colors.black,
                                  border: Border.all(
                                      color: Color(0xFF1DCFC9),
                                      width: 1.71
                                  )
                              ),
                              child: Center(
                                child: Text('ACCEPT',style: GoogleFonts.montserrat(fontSize: 8,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 2.0),),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: Globals.getHeightLeftPanel(22.68),
                            left: Globals.getWidth(93.05),
                            child: Container(
                              height: Globals.getHeightLeftPanel(13.77),
                              width: Globals.getWidth(53.63),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Globals.getWidth(8.0)),
                                  color: Colors.black,
                                  border: Border.all(
                                      color: Color(0xFFFF3A79),
                                      width: 1.71
                                  )
                              ),
                              child: Center(
                                child: Text('DECLINE',style: GoogleFonts.montserrat(fontSize: 8,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 2.0),),
                              ),
                            ),
                          ),
                        ],
                      ),
                      height: Globals.getHeightLeftPanel(138.31),
                      width: Globals.getWidth(396),
                    ):Container(
                      margin: EdgeInsets.symmetric(vertical: Globals.getHeightLeftPanel(6.0), horizontal: Globals.getWidth(9.0)),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(0, 0, 0, 0.4),
                          borderRadius: BorderRadius.circular(Globals.getWidth(5.96))
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: Globals.getHeightLeftPanel(17.22),
                            left: Globals.getWidth(22.96),
                            child: Container(
                              height: Globals.getHeightLeftPanel(16.74),
                              width: Globals.getWidth(161.18),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Globals.getWidth(8.0)),
                                  color: Color(0xFF1DCFC9)
                              ),
                              child: Center(
                                child: Text('TOURNAMNET REQUEST',style: GoogleFonts.montserrat(fontSize: 10,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 2.0),),
                              ),
                            ),
                          ),
                          Positioned(
                            top: Globals.getHeightLeftPanel(50.93),
                            left: Globals.getWidth(23.51),
                            child: Container(
                              child: Text('Raksh Is Inviting You For Rookey Tournament',style: GoogleFonts.montserrat(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 1.0),),
                            ),
                          ),
                          Positioned(
                            top: Globals.getHeightLeftPanel(70.02),
                            left: Globals.getWidth(22.96),
                            child: Container(
                              child: Text('Tournament invite for Team Xcalibur',style: GoogleFonts.montserrat(fontSize: 12,color: Color(0xFF6C7B8A),fontWeight: FontWeight.w500,letterSpacing: 1.0),),
                            ),
                          ),
                          Positioned(
                            bottom: Globals.getHeightLeftPanel(22.68),
                            left: Globals.getWidth(23.51),
                            child: Container(
                              height: Globals.getHeightLeftPanel(13.77),
                              width: Globals.getWidth(48.63),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Globals.getWidth(8.0)),
                                  color: Colors.black,
                                  border: Border.all(
                                      color: Color(0xFF1DCFC9),
                                      width: 1.71
                                  )
                              ),
                              child: Center(
                                child: Text('ACCEPT',style: GoogleFonts.montserrat(fontSize: 8,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 2.0),),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: Globals.getHeightLeftPanel(22.68),
                            left: Globals.getWidth(93.05),
                            child: Container(
                              height: Globals.getHeightLeftPanel(13.77),
                              width: Globals.getWidth(53.63),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Globals.getWidth(8.0)),
                                  color: Colors.black,
                                  border: Border.all(
                                      color: Color(0xFFFF3A79),
                                      width: 1.71
                                  )
                              ),
                              child: Center(
                                child: Text('DECLINE',style: GoogleFonts.montserrat(fontSize: 8,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 2.0),),
                              ),
                            ),
                          ),
                        ],
                      ),
                      height: Globals.getHeightLeftPanel(138.31),
                      width: Globals.getWidth(396),
                    );
                  }),
                ),
              ):
              isTournamentSelected?
              Container(
                width: Globals.width,
                height: Globals.height - Globals.getHeightLeftPanel(280),
                child: ListView(
                  children: List.generate(all.length, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: Globals.getHeightLeftPanel(6.0), horizontal: Globals.getWidth(9.0)),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(0, 0, 0, 0.4),
                          borderRadius: BorderRadius.circular(Globals.getWidth(5.96))
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: Globals.getHeightLeftPanel(17.22),
                            left: Globals.getWidth(22.96),
                            child: Container(
                              height: Globals.getHeightLeftPanel(16.74),
                              width: Globals.getWidth(161.18),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Globals.getWidth(8.0)),
                                  color: Color(0xFF1DCFC9)
                              ),
                              child: Center(
                                child: Text('TOURNAMNET REQUEST',style: GoogleFonts.montserrat(fontSize: 10,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 2.0),),
                              ),
                            ),
                          ),
                          Positioned(
                            top: Globals.getHeightLeftPanel(50.93),
                            left: Globals.getWidth(23.51),
                            child: Container(
                              child: Text('Raksh Is Inviting You For Rookey Tournament',style: GoogleFonts.montserrat(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 1.0),),
                            ),
                          ),
                          Positioned(
                            top: Globals.getHeightLeftPanel(70.02),
                            left: Globals.getWidth(22.96),
                            child: Container(
                              child: Text('Tournament invite for Team Xcalibur',style: GoogleFonts.montserrat(fontSize: 12,color: Color(0xFF6C7B8A),fontWeight: FontWeight.w500,letterSpacing: 1.0),),
                            ),
                          ),
                          Positioned(
                            bottom: Globals.getHeightLeftPanel(22.68),
                            left: Globals.getWidth(23.51),
                            child: Container(
                              height: Globals.getHeightLeftPanel(13.77),
                              width: Globals.getWidth(48.63),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Globals.getWidth(8.0)),
                                  color: Colors.black,
                                  border: Border.all(
                                      color: Color(0xFF1DCFC9),
                                      width: 1.71
                                  )
                              ),
                              child: Center(
                                child: Text('ACCEPT',style: GoogleFonts.montserrat(fontSize: 8,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 2.0),),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: Globals.getHeightLeftPanel(22.68),
                            left: Globals.getWidth(93.05),
                            child: Container(
                              height: Globals.getHeightLeftPanel(13.77),
                              width: Globals.getWidth(53.63),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Globals.getWidth(8.0)),
                                  color: Colors.black,
                                  border: Border.all(
                                      color: Color(0xFFFF3A79),
                                      width: 1.71
                                  )
                              ),
                              child: Center(
                                child: Text('DECLINE',style: GoogleFonts.montserrat(fontSize: 8,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 2.0),),
                              ),
                            ),
                          ),
                        ],
                      ),
                      height: Globals.getHeightLeftPanel(138.31),
                      width: Globals.getWidth(396),
                    );
                  }),
                ),
              ):
              Container(
                width: Globals.width,
                height: Globals.height - Globals.getHeightLeftPanel(280),
                child: ListView(
                  children: List.generate(team.length, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: Globals.getHeightLeftPanel(6.0), horizontal: Globals.getWidth(9.0)),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(Globals.getWidth(5.96))
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: Globals.getHeightLeftPanel(17.22),
                            left: Globals.getWidth(22.96),
                            child: Container(
                              height: Globals.getHeightLeftPanel(16.74),
                              width: Globals.getWidth(107.18),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Globals.getWidth(8.0)),
                                  color: Color(0xFF7585FF)
                              ),
                              child: Center(
                                child: Text('TEAM REQUEST',style: GoogleFonts.montserrat(fontSize: 10,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 2.0),),
                              ),
                            ),
                          ),
                          Positioned(
                            top: Globals.getHeightLeftPanel(50.93),
                            left: Globals.getWidth(23.51),
                            child: Container(
                              child: Text('By Shawn Mendes for Team Xcalibur',style: GoogleFonts.montserrat(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 1.0),),
                            ),
                          ),
                          Positioned(
                            top: Globals.getHeightLeftPanel(70.02),
                            left: Globals.getWidth(22.96),
                            child: Container(
                              child: Text('For 15/12/2021 game lising',style: GoogleFonts.montserrat(fontSize: 12,color: Color(0xFF6C7B8A),fontWeight: FontWeight.w500,letterSpacing: 1.0),),
                            ),
                          ),
                          Positioned(
                            bottom: Globals.getHeightLeftPanel(22.68),
                            left: Globals.getWidth(23.51),
                            child: Container(
                              height: Globals.getHeightLeftPanel(13.77),
                              width: Globals.getWidth(48.63),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Globals.getWidth(8.0)),
                                  color: Colors.black,
                                  border: Border.all(
                                      color: Color(0xFF1DCFC9),
                                      width: 1.71
                                  )
                              ),
                              child: Center(
                                child: Text('ACCEPT',style: GoogleFonts.montserrat(fontSize: 8,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 2.0),),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: Globals.getHeightLeftPanel(22.68),
                            left: Globals.getWidth(93.05),
                            child: Container(
                              height: Globals.getHeightLeftPanel(13.77),
                              width: Globals.getWidth(53.63),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Globals.getWidth(8.0)),
                                  color: Colors.black,
                                  border: Border.all(
                                      color: Color(0xFFFF3A79),
                                      width: 1.71
                                  )
                              ),
                              child: Center(
                                child: Text('DECLINE',style: GoogleFonts.montserrat(fontSize: 8,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 2.0),),
                              ),
                            ),
                          ),
                        ],
                      ),
                      height: Globals.getHeightLeftPanel(138.31),
                      width: Globals.getWidth(396),
                    );
                  }),
                ),
              ),
            ),
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


            Positioned(
              top: Globals.getHeightLeftPanel(232),
              left: Globals.getWidth(115),
              child: Container(
                width: Globals.getWidth(17),
                height: Globals.getHeightLeftPanel(22.4),
                child: Center(
                  child: Text(
                    '4',
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
              top: Globals.getHeightLeftPanel(232),
              left: Globals.getWidth(244),
              child: Container(
                width: Globals.getWidth(17),
                height: Globals.getHeightLeftPanel(22.4),
                child: Center(
                  child: Text(
                    '2',
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
              top: Globals.getHeightLeftPanel(232),
              left: Globals.getWidth(385),
              child: Container(
                width: Globals.getWidth(12),
                height: Globals.getHeightLeftPanel(22.4),
                child: Center(
                  child: Text(
                    '1',
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