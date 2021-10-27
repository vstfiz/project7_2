import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project7_2/custom/globals.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  List<BottomNavigationBarItem> tabs = [
    new BottomNavigationBarItem(
        icon: Icon(Icons.rss_feed,size:30),
        label: 'News & \nFixtures'),
    new BottomNavigationBarItem(
        icon: Icon(Icons.location_on_rounded,size:30),
        label: 'Find Game'),
    new BottomNavigationBarItem(
        icon: new Image.asset('assets/images/locker_room.png',height: 30,width: 30,),
        label: 'Locker \nRoom')
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: ClipRRect(
        child: BottomNavigationBar(
          backgroundColor: Globals.currentTab==2?Color(0xFF1F1F23):Colors.black,
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
      body: PageView.builder(
        controller: Globals.pageController,
        itemCount: Globals.screens.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Globals.screens[index];
        },
      ),
    ),top: true,);
  }

}