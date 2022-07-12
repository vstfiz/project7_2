import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project7_2/custom/globals.dart';

import '../../../custom/draggable_card/dragable_card.dart';
import '../painters/basketball.dart';

class BasketballField extends StatefulWidget {
  _BasketballFieldState createState() => _BasketballFieldState();
}

class _BasketballFieldState extends State<BasketballField> {

  int playerAmount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black54,
          actions: [
            SizedBox(
              width: 25.0,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  playerAmount++;
                });
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 25.0,
            ),
            GestureDetector(
              onTap: () {
              },
              child: Icon(
                Icons.check,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
          ],
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.clear,
              color: Colors.white,
            ),
          ),
        ),
        body: Stack(
          children: [
            CustomPaint(
              size: Size(Globals.width, Globals.height),
              painter: BasketballPainter(),
            ),
            Container(
              height: Globals.height,
              width: Globals.width,
              child: Stack(
                children: List.generate(playerAmount, (index) {
                  return DraggableCard(
                      child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: 33,
                    width: 33,
                    child: Center(
                      child: Text(
                          playerAmount.toString(),style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ));
                }),
              ),
            )
          ],
        ));
  }
}
