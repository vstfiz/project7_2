
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/services/auth/auth.dart';
import 'package:project7_2/view/auth/signin.dart';
import 'package:project7_2/view/fill_details/fill_details.dart';
import 'package:project7_2/view/user_profile/user_profile.dart';

class FindPLaces extends StatefulWidget {
  _FindPLacesState createState() => _FindPLacesState();
}

class _FindPLacesState extends State<FindPLaces> {
  GoogleMapController _controller;
  Location _location = Location();


  void _onMapCreated(GoogleMapController _cntlr)
  {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude),zoom: 15),
        ),
      );
    });
  }

  List<BottomNavigationBarItem> tabs = [
    new BottomNavigationBarItem(
        icon: Icon(Icons.rss_feed,color: Colors.black,size:40),
        label: 'News & Fixtures'),
    new BottomNavigationBarItem(
        icon: Icon(Icons.location_on_rounded,color: Colors.black,size:30),
        label: 'Find Game'),
    new BottomNavigationBarItem(
        icon: Icon(Icons.send,color: Colors.black,size:40),
        label: 'Locker Room')
  ];

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
  );
  @override
  Widget build(BuildContext context) {
    double h = Globals.height;
    double w = Globals.width;
    return WillPopScope(
        child: SafeArea(
          top: true,
          child: Scaffold(
            bottomNavigationBar: ClipRRect(
              child: BottomNavigationBar(
                backgroundColor: Colors.red,
                items: tabs,
                elevation: 20,
                currentIndex: 1,
                onTap: (index) {
                  // print(index);
                  // if (index == 0) {
                  //   setState(() {
                  //     Globals.currentTab = 0;
                  //   });
                  //   Globals.pageController.jumpToPage(0);
                  // } else if (index == 1) {
                  //   if (Globals.user != null) {
                  //     setState(() {
                  //       Globals.currentTab = 1;
                  //     });
                  //     Globals.pageController.jumpToPage(1);
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
                  //     Globals.pageController.jumpToPage(2);
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
                type: BottomNavigationBarType.shifting,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
              backgroundColor: Colors.grey[300],
              body: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: h,
                    width: w,
                  ),
                  Positioned(
                    child: IconButton(
                      onPressed: (){
                        Navigator.of(context).push(new MaterialPageRoute(builder: (context){
                          return ProfilePage();
                        }));
                      },
                      icon: Icon(
                        Icons.person,
                        color: Colors.black,
                        size: 40,
                      ),
                    ),
                    right: w * 0.05,
                    top: h * 0.01,
                  ),
                  Positioned(
                    child: IconButton(
                      onPressed: () async{
                        await auth.signOut();
                        Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context){return SignIn();}));
                      },
                      icon: new Image.asset('assets/images/back_flip.png'),
                      iconSize: 40,
                    ),
                    left: w * 0.05,
                    top: h * 0.01,
                  ),
                  Positioned(
                      top: h *0.18,
                      left: w *0.0,
                      child: Container(
                        height: h * 0.65,
                        width: w,
                        child: GoogleMap(
                            onMapCreated: _onMapCreated,
                            mapType: MapType.normal,
                            initialCameraPosition: _kGooglePlex,
                            zoomGesturesEnabled: true,
                            zoomControlsEnabled: false,
                            myLocationButtonEnabled: true,
                            myLocationEnabled: true,
                            minMaxZoomPreference: MinMaxZoomPreference(13,17)
                        ),
                      )
                  ),
                ],
              )),
        ),
        onWillPop: () {
          SystemNavigator.pop();
          return Future.value(false);
        });
  }
}
