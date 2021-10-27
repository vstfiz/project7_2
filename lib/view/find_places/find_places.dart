
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
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

  Future<void> _loadingDialog(String value) {
    return showDialog<void>(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            backgroundColor: Colors.white,
            content: Container(
                height: 60,
                child: Center(
                  child: Row(
                    children: <Widget>[
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        value,
                        style: TextStyle(
                            fontFamily: "Livvic",
                            fontSize: 23,
                            letterSpacing: 1),
                      )
                    ],
                  ),
                ))));
  }


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
              body: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    color:  Color(0xFF121217),
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
                        Icons.menu,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    left: w * 0.01,
                    top: h * 0.01,
                  ),
                  Positioned(
                    child: Container(
                      width: w * 0.5,
                      height: h * 0.025,
                      decoration: BoxDecoration(
                        color: Colors.grey[800].withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    left: w * 0.15,
                    top: h * 0.022,
                  ),
                  Positioned(child: Row(
                    children: [
                      Container(
                          width: w * 0.07,
                          height:  w * 0.07,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                              color: Colors.grey[800].withOpacity(0.7),
                          ),
                        child: Icon(Icons.calendar_today_outlined,color: Colors.white,size: 16,),
                        ),
                      SizedBox(width: 10,),
                      Container(
                        width: w * 0.07,
                        height:  w * 0.07,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[800].withOpacity(0.7),
                        ),
                        child: TextButton(
                          child: Icon(Icons.add,color: Colors.white,size: 18,),
                          onPressed: () async{
                            _loadingDialog('Creating Locker Room');
                            var ref = FirebaseFirestore.instance;
                            await ref.collection('lockerRooms').add({
                              'createdByUid': Globals.uid,
                              'ownerName' : Globals.name,
                              'sports': 'Football',
                              'location' : 'NH2 Delhi Kanpur Highway',
                            });
                            await Globals.lockerRooms.add(1);
                            Timer t = new Timer(new Duration(seconds: 3),(){
                              Navigator.pop(context);
                              setState(() {
                                Globals.currentTab = 2;
                                Globals.pageController.jumpToPage(2);
                              });
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        width: w * 0.07,
                        height:  w * 0.07,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[800].withOpacity(0.7),
                        ),
                        child: Icon(Icons.person,color: Colors.white,size: 18,),
                      ),
                    ],
                  ),
                  right: w * 0.01,top: h * 0.02,),
                  Positioned(
                      top: h *0.15,
                      left: w *0.0,
                      child: Container(
                        height: h * 0.75,
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
