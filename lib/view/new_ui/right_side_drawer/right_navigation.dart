import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animated_cards/flutter_animated_cards.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/view/new_ui/left_side_navigation/notifications.dart';
import 'package:project7_2/view/new_ui/left_side_navigation/teams.dart';
import 'package:project7_2/view/new_ui/left_side_navigation/venue_bookings.dart';
import 'package:url_launcher/url_launcher.dart';

import '3DCard.dart';
import 'card_model.dart';

class RightPanel extends StatefulWidget{
  _RightPanelState createState()=> _RightPanelState();
}

class _RightPanelState extends State<RightPanel>{
  TextEditingController _searchController = new TextEditingController();
  List<CardModel> _cardList;
  CardModel _cardModel;
  @override
  void initState() {
    var data = CardData();
    _cardList = data.getCardList();
    _cardModel = _cardList[1];

    super.initState();
  }

  _launchUrl(Uri url) async{
    if (!await launchUrl(url)) throw 'Could not launch $url';
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
        child: Center(
          child : Container(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 50),
              children: [
                Card3D(
                    child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox.expand(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Football Event',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900)),
                                  Text('Andheri, Mumbai',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900)),

                                ])))),
                Card3D(
                    child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox.expand(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Cricket Event',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900)),
                                  Text('Ramghat Road, Aligarh',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900)),

                                ])))),
                Card3D(
                    child: GestureDetector(
                      onTap: _launchUrl(Uri.parse('https://www.google.com/maps/place/2%2F325A,+Nagla+Tikona,+Surendra+Nagar,+Aligarh,+Uttar+Pradesh+202001/@27.8858756,78.089526,17.25z/data=!4m5!3m4!1s0x3974a4bd4ce17025:0xbbacb371ca17c526!8m2!3d27.8860302!4d78.0889151')),
                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SizedBox.expand(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('BasketBall Event',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900)),
                                    Text('Jawan, Aligarh',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900)),
                                  ]))),
                    )
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}