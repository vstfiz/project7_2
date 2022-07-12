import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../custom/globals.dart';

Widget match_data(BuildContext context,  List<String> texts, List<String> icons){
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
          height: Globals.getHeight(440),
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
              Positioned(top:  Globals.getHeight(50), child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children:  List.generate(texts.length, (index){
                  return Container(
                    width: Globals.width,
                    margin: EdgeInsets.symmetric(vertical: Globals.getHeight(20)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: Globals.getWidth(80),),
                        Container(
                          width: Globals.getWidth(45),
                          height: Globals.getHeight(45),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      icons[index]),
                                  fit: BoxFit.contain)),
                        ),
                        SizedBox(width: Globals.getWidth(58.78),),
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
              )),
            ],
          ),
        ),
      ),
    ),
  );
}