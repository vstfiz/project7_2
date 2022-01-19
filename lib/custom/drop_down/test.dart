import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project7_2/custom/dropdown_calendar/drop_down_calendar.dart';
import 'package:project7_2/custom/drop_down/custom_drop_down.dart';
import 'package:project7_2/custom/globals.dart';

class Test extends StatelessWidget {
  TextEditingController _numberOfPlayer = TextEditingController();
  var sports = ['Cricket', 'Basketball','Tennis','Squash','Golf','Football','Futsal','Pool','Billiards','Table Tennis','Badminton'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: Globals.getHeight(2906),
        width: Globals.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black, Color(0xFF7585FF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: Globals.getHeight(2906),
              width: Globals.width,
            ),
            Positioned(
                top: Globals.getHeight(108),
                child: Container(
                  width: Globals.getWidth(268),
                  height: Globals.getHeight(268),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/onboarding/layer.png'),
                          fit: BoxFit.contain)),
                )),
            Positioned(
                top: Globals.getHeight(125),
                child: Container(
                  width: Globals.getWidth(238),
                  height: Globals.getHeight(235),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/onboarding/layer_2.png'),
                          fit: BoxFit.scaleDown)),
                )),
            Positioned(
                top: Globals.getHeight(141),
                child: Opacity(
                  child: Container(
                    width: Globals.getWidth(200),
                    height: Globals.getHeight(200),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/onboarding/layer_3.png'),
                            fit: BoxFit.scaleDown),
                        backgroundBlendMode: BlendMode.overlay),
                  ),
                  opacity: 0.2861,
                )),
            Positioned(
                top: Globals.getHeight(170),
                child: Container(
                  width: Globals.getWidth(166),
                  height: Globals.getHeight(140),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/onboarding/field.png'),
                          fit: BoxFit.scaleDown)),
                )),
            Positioned(
              child: Text(
                'Creating Game Event',
                style: GoogleFonts.montserrat(
                    fontSize: Globals.getFontSize(26),
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              top: Globals.getHeight(390),
            ),
            Positioned(
              child: Text(
                'Number Of Players',
                style: GoogleFonts.montserrat(
                    fontSize: Globals.getFontSize(16),
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              top: Globals.getHeight(492),
            ),
            Positioned(
              child: Container(
                child: TextField(
                  controller: _numberOfPlayer,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffix:Padding(
                      child:  TextButton(
                        onPressed: (){
                          _numberOfPlayer.clear();
                        },
                        child: Icon(
                          Icons.clear,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      padding: EdgeInsets.only(top: 4.0),
                    ),
                    contentPadding: EdgeInsets.only(left: 20.0,bottom: 3.0),
                  ),
                  style: GoogleFonts.montserrat(
                      fontSize: Globals.getFontSize(20),
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Globals.getWidth(8.57)),
                    border: Border.all(
                    color: Color(0xFF4C5FEF)
                  ),
                  color: Color(0xFF231F20)
                ),
                height: Globals.getHeight(45.73),
                width: Globals.getWidth(383),
              ),
              top: Globals.getHeight(529.29),
            ),
            Positioned(
              child: Text(
                'Select Game',
                style: GoogleFonts.montserrat(
                    fontSize: Globals.getFontSize(16),
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              top: Globals.getHeight(622),
            ),
            Positioned(
              child: Container(
                child: CustomDropDown(
                  height: Globals.getHeight(45.73),
                  width: Globals.getWidth(383),
                  itemsCount: sports.length,
                  items: sports,
                  radius: Globals.getWidth(11.64),

                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Globals.getWidth(8.57)),
                    border: Border.all(
                        color: Color(0xFF4C5FEF)
                    ),
                    color: Color(0xFF231F20)
                ),
                height: Globals.getHeight(45.73),
                width: Globals.getWidth(383),
              ),
              top: Globals.getHeight(663.33),
            ),
            Positioned(
              child: Text(
                'Select from Available Venues',
                style: GoogleFonts.montserrat(
                    fontSize: Globals.getFontSize(16),
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              top: Globals.getHeight(756.04),
            ),
            Positioned(
              child: Container(
                child: CustomDropDown(
                  height: Globals.getHeight(45.73),
                  width: Globals.getWidth(383),
                  itemsCount: sports.length,
                  items: sports,
                  radius: Globals.getWidth(11.64),

                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Globals.getWidth(8.57)),
                    border: Border.all(
                        color: Color(0xFF4C5FEF)
                    ),
                    color: Color(0xFF231F20)
                ),
                height: Globals.getHeight(45.73),
                width: Globals.getWidth(383),
              ),
              top: Globals.getHeight(788.72),
            ),

            Positioned(
              child: Text(
                'Select Date',
                style: GoogleFonts.montserrat(
                    fontSize: Globals.getFontSize(16),
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              top: Globals.getHeight(882),
            ),
            Positioned(
              child: Container(
                child: DropDownCalendar(
                  height: Globals.getHeight(45.73),
                  width: Globals.getWidth(383),
                  dropdownHeight:  Globals.getHeight(420.73),
                  dropdownWidth: Globals.getWidth(383),
                  radius: Globals.getWidth(5.64),

                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Globals.getWidth(8.57)),
                    border: Border.all(
                        color: Color(0xFF4C5FEF)
                    ),
                    color: Color(0xFF231F20)
                ),
                height: Globals.getHeight(45.73),
                width: Globals.getWidth(383),
              ),
              top: Globals.getHeight(920.72),
            ),
            Positioned(
              child: Text(
                'Select Time Slots',
                style: GoogleFonts.montserrat(
                    fontSize: Globals.getFontSize(16),
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              top: Globals.getHeight(1020),
            ),
          ],
        ),
      ),
    ));
  }
}
