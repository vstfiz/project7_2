import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project7_2/custom/globals.dart';

class StatusUpdate extends StatefulWidget {
  _StatusUpdateState createState() => _StatusUpdateState();
}

class _StatusUpdateState extends State<StatusUpdate> {
  List<BottomNavigationBarItem> tabs = [
    new BottomNavigationBarItem(
        icon: Icon(Icons.rss_feed, size: 30), label: 'News & \nFixtures'),
    new BottomNavigationBarItem(
        icon: Icon(Icons.location_on_rounded, size: 30), label: 'Find Game'),
    new BottomNavigationBarItem(
        icon: new Image.asset(
          'assets/images/locker_room.png',
          height: 30,
          width: 30,
        ),
        label: 'Locker \nRoom')
  ];

  Map<String, String> messages = {
    'accepted' : 'Request Accepted',
    'bestofluck' : 'Best Of Luck!',
    'error': 'Error!',
    'pending': 'Locker Room Request\nPending',
    'rate': 'Don’t forget to Rate\nyour Team!',
    'rejected': 'Request Rejected',
    'scheduled': 'Match Scheduled',
    'sent': 'Request Sent',
    'today': 'Match Today',
    'updated': 'Your Game was\nUpdated'
  };

  Map<String, String> buttonText = {
    'accepted' : 'Join Team',
    'bestofluck' : 'Locker Room',
    'error': 'Try Again',
    'pending': 'Locker Room',
    'rate': 'Rate Skills',
    'rejected': 'Try Again',
    'scheduled': 'Locker Room',
    'sent': 'Locker Room',
    'today': 'Locker Room',
    'updated': 'Locker Room'
  };

  String defaultImageAddress = 'assets/images/alerts/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        child: BottomNavigationBar(
          backgroundColor:
              Globals.currentTab == 2 ? Color(0xFF1F1F23) : Colors.black,
          selectedItemColor: Color(0xFF7585FF),
          unselectedItemColor: Colors.grey,
          selectedIconTheme: IconThemeData(
            color: Color(0xFF7585FF),
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.grey,
          ),
          items: tabs,
          elevation: 20,
          currentIndex: Globals.currentTab,
          onTap: (index) {
            print(index);
            setState(() {
              Globals.currentTab = index;
              Globals.pageController.jumpToPage(index);
            });
            // if (index == 0) {
            //   setState(() {
            //     Globals.currentTab = 0;
            //   });
            //
            // } else if (index == 1) {
            //   if (Globals.user != null) {
            //     setState(() {
            //       Globals.currentTab = 1;
            //     });
            //
            //   } else {
            //     Navigator.push(context, MaterialPageRoute(builder: (_) {
            //       return SignIn();
            //     }));
            //   }
            // } else if (index == 2) {
            //   print(Globals.feedType);
            //   if(Globals.currentTab == 2){
            //     setState(() {
            //       Globals.feedType = !Globals.feedType;
            //     });
            //     Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context){return HomeScreen();}));
            //   }
            //   else{
            //     setState(() {
            //       Globals.currentTab = 2;
            //     });
            //   }
            //
            // } else if (index == 3) {
            //   String shareMessage;
            //   if(Globals.feedType){
            //     shareMessage = Globals.currentFeed.claim.length > 250
            //         ? Globals.currentFeed.claim.substring(0, 250) +
            //         "...\n\nTo read more, download: \n\n https://play.google.com/store/apps/details?id=com.codingdevs.facto_user"
            //         : Globals.currentFeed.claim +
            //         "\n\nTo read more, download: \n\n https://play.google.com/store/apps/details?id=com.codingdevs.facto_user";
            //   }
            //   else{
            //     shareMessage = Globals.currentFeed.claim.length > 250
            //         ? Globals.currentFeed.claim.substring(0, 250) +
            //         "...\n\nTo read more, download: \n\n https://play.google.com/store/apps/details?id=com.codingdevs.facto_user"
            //         : Globals.currentFeed.claim +
            //         "\n\nTo read more, download: \n\n https://play.google.com/store/apps/details?id=com.codingdevs.facto_user";
            //
            //   }
            //   Share.share(shareMessage);
            // }
          },
          type: BottomNavigationBarType.fixed,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      body: Container(
        height: Globals.height,
        width: Globals.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: Globals.width,
              height: Globals.height,
            ),
            Positioned(
              child: Container(
                height: Globals.getHeight(30),
                width: Globals.getWidth(30),
                child: TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.clear,
                      color: Colors.white,
                      size: 30,
                    )),
              ),
              top: Globals.getHeight(70),
              left: Globals.getWidth(10),
            ),
            Positioned(
              child: Container(
                height: Globals.getHeight(200),
                width: Globals.width * 0.8,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          defaultImageAddress + Globals.status + '.png' ,
                        ),
                        fit: BoxFit.contain)),
              ),
              top: Globals.getHeight(320),
            ),
            Positioned(
              child: Container(
                height: Globals.getHeight(50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Globals.getWidth(100))),
                child: Text(
                      messages[Globals.status],
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
              ),
              top: Globals.getHeight(540),
            ),
            Positioned(
              child: Container(
                height: Globals.getHeight(50),
                width: Globals.getWidth(185),
                decoration: BoxDecoration(
                    color: Color(0xFF606AD8),
                    borderRadius: BorderRadius.circular(Globals.getWidth(100))),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      buttonText[Globals.status],
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    )),
              ),
              top: Globals.getHeight(648),
            ),
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF0F0F0F), Color(0xFF231F20)])),
      ),
    );
  }
}
