import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../custom/globals.dart';

Widget lineup_confirmation(BuildContext context){
  return Dialog(
    backgroundColor: Colors.transparent,
    child:  ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 15.0,
          sigmaY: 5.0,
        ),
        child: Container(
          width: Globals.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFF726F7E80).withOpacity(0.5)
          ),
          height: Globals.getHeight(435),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(child: GestureDetector(
                child: Icon(
                  Icons.clear,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
                right: Globals.getWidth(20),top: Globals.getHeight(20),),
              Positioned(top:  Globals.getHeight(50), child:   Container(
                width: Globals.getWidth(200),
                height: Globals.getWidth(250),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                        AssetImage('assets/images/request_confirmation.png'),
                        fit: BoxFit.contain)),
              )),
              Positioned(top:  Globals.getHeight(300), child:   Text(
                'Confirm Lineup?',
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: Globals.getFontSize(22),
                    fontWeight: FontWeight.w600),
              ),),
              Positioned(top:  Globals.getHeight(350), child:   Container(
                width: Globals.getWidth(185),
                height: Globals.getWidth(50),
                decoration: BoxDecoration(
                    color: Color(0xFF606AD8),
                    borderRadius: BorderRadius.circular(Globals.getWidth(100))
                ),
                child: TextButton(
                  child: Text(
                    'Yes!',
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: Globals.getFontSize(16),
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    ),
  );
}