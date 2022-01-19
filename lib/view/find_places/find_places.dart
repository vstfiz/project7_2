import 'dart:async';

import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project7_2/custom/clipped_profile/clipped_profile.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/custom/spinner_loader/spinner.dart';
import 'package:project7_2/services/auth/auth.dart';
import 'package:project7_2/view/auth/signin.dart';
import 'package:project7_2/view/new_ui/left_side_navigation/left_panel.dart';
import 'package:project7_2/view/user_profile/user_profile.dart';

class FindPLaces extends StatefulWidget {
  _FindPLacesState createState() => _FindPLacesState();
}

class _FindPLacesState extends State<FindPLaces> {
  GoogleMapController _controller;
  Location _location = Location.instance;
  bool isFilterOpen = false;
  Set<Marker> markers = Set.from([]);
  var tags = ['Today', 'Tomorrow', 'Monday', 'Friday', 'Football', 'Badminton'];
  String locationValue = '...';

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
BitmapDescriptor customIcon;
  String _darkMapStyle;

  @override
  void initState() {
    super.initState();
    _loadMapStyles();

    }
    _getCustomIcon()async{
        ImageConfiguration configuration = createLocalImageConfiguration(context);
        BitmapDescriptor ic = await createBitmapDescriptorFromIconData('assets/images/google_markers/football.png');
        BitmapDescriptor ic1 = await createBitmapDescriptorFromIconData('assets/images/google_markers/cricket.png');
        BitmapDescriptor ic2= await createBitmapDescriptorFromIconData('assets/images/google_markers/rugby.png');
        BitmapDescriptor ic3 = await createBitmapDescriptorFromIconData('assets/images/google_markers/football.png');
        BitmapDescriptor ic4= await createBitmapDescriptorFromIconData('assets/images/google_markers/football.png');
        BitmapDescriptor ic5 = await createBitmapDescriptorFromIconData('assets/images/google_markers/football.png');

        Marker m = new Marker(
            markerId: new MarkerId('gvfsae'),
            position: new LatLng(27.887452, 78.102636),
            icon: BitmapDescriptor.fromJson(ic.toJson()),
            infoWindow: InfoWindow(title: 'Football Court 1'));
        Marker m1 = new Marker(
            markerId: new MarkerId('gvfsafeae'),
            position: new LatLng(27.885749182980597, 78.09622124202897),
            icon: BitmapDescriptor.fromJson(ic1.toJson()),
            infoWindow: InfoWindow(title: 'Rugby Court 1'));
        Marker m2 = new Marker(
            markerId: new MarkerId('gvfsdwaae'),
            position: new LatLng(27.88224040697118, 78.0976159907334),
            icon: BitmapDescriptor.fromJson(ic2.toJson()),
            infoWindow: InfoWindow(title: 'Cricket Court 1'));
        setState(() {
          markers.add(m);
          markers.add(m1);
          markers.add(m2);

        });
    }

  Future<BitmapDescriptor> createBitmapDescriptorFromIconData(String key) async {
    final bytes = await rootBundle.load(key);
    Image(image: ResizeImage(AssetImage(key),width: 50),).image;
    return BitmapDescriptor.fromBytes(bytes.buffer.asUint8List());
  }

  Future _loadMapStyles() async {
    _darkMapStyle =
        await rootBundle.loadString('assets/map_styles/dark_style.json');
  }

  void _onMapCreated(GoogleMapController _cntlr) async{
    await _getCustomIcon();
    _controller = _cntlr;
    _controller.setMapStyle(_darkMapStyle);
    var _data = await _location.getLocation();
    final coordinates = new Coordinates(_data.latitude, _data.longitude);
    var addresses =
    await Geocoder.local.findAddressesFromCoordinates(coordinates);
    locationValue =
        addresses.first.subAdminArea + ", " + addresses.first.subLocality;
    _location.onLocationChanged.listen((l) async {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
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
                color: Color(0xFF121217),
                height: h,
                width: w,
              ),
              Positioned(
                child: Container(
                  width: Globals.getWidth(392),
                  height: Globals.getHeight(46.81),
                  decoration: BoxDecoration(
                      color: Colors.grey[800].withOpacity(0.7),
                      borderRadius: BorderRadius.circular(8.8)),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              isFilterOpen = !isFilterOpen;
                            });
                          },
                          child: Icon(
                            Icons.settings_input_composite_outlined,
                            color:
                                isFilterOpen ? Color(0xFF7585FF) : Colors.white,
                          ),
                        ),
                        right: Globals.getWidth(0.0),
                      ),
                      Positioned(
                        child: TextButton(
                          onPressed: () {
                            setState(() {});
                          },
                          child: Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                          ),
                        ),
                        left: Globals.getWidth(0.0),
                      ),
                      Positioned(
                        child: TextButton(
                            onPressed: () {
                              setState(() {});
                            },
                            child: Text(
                              locationValue,
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: Globals.getWidth(16)),
                            )),
                        left: Globals.getWidth(40.0),
                      ),
                    ],
                  ),
                ),
                left: Globals.getWidth(5),
                top: Globals.getHeight(30),
              ),
              Positioned(
                child: Container(
                    width: Globals.width,
                    height: Globals.getHeight(30),
                    decoration: BoxDecoration(),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(6, (index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  color: Color(0xFF7585FF), width: 2.0)),
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          height: Globals.getHeight(10),
                          margin: EdgeInsets.all(5.0),
                          child: Text(
                            tags[index],
                            style: GoogleFonts.montserrat(
                                // fontSize: Globals.getWidth(13),
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        );
                      }),
                    )),
                left: 0.0,
                top: Globals.getHeight(90),
              ),
              Positioned(
                  top: h * 0.15,
                  left: w * 0.0,
                  child: Container(
                    height: h * 0.61,
                    width: w,
                    child: GoogleMap(
                        onMapCreated: _onMapCreated,
                        mapType: MapType.normal,
                        compassEnabled: true,
                        markers: markers,
                        initialCameraPosition: _kGooglePlex,
                        zoomGesturesEnabled: true,
                        zoomControlsEnabled: false,
                        myLocationButtonEnabled: true,
                        myLocationEnabled: true,
                        minMaxZoomPreference: MinMaxZoomPreference(10, 50)),
                  )),
              Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  child: Container(
                    // height: Globals.getHeight(65),
                    width: w,

                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        GestureDetector(
                          onPanUpdate: (details) {
                            _offset = Offset(0, _offset.dy - details.delta.dy);
                            if (_offset.dy < _FindPLacesState._minHeight) {
                              _offset = Offset(0, _FindPLacesState._minHeight);
                              _isOpen = false;
                            } else if (_offset.dy >
                                _FindPLacesState._maxHeight) {
                              _offset = Offset(0, _FindPLacesState._maxHeight);
                              _isOpen = true;
                            }
                            setState(() {});
                          },
                          child: AnimatedContainer(
                            duration: Duration.zero,
                            curve: Curves.easeOut,
                            height: _offset.dy,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF606CCD),
                                      Color(0xFF231F20),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    stops: [0.05, 1.0])),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ClippedProfileContainer(
                                  height: 50,
                                  width: 50,
                                  imageUrl: 'https://i.pinimg.com/1200x/19/6a/35/196a35d09631dcdcb84578ce0f60146b.jpg',
                                )
                              ],
                            )
                          ),
                        ),
                        // Positioned(child: child),
                        Positioned(
                            // bottom: 2 * _FindPLacesState._minHeight - _offset.dy - 40,
                            top: 0.0,
                            child: TextButton(
                              onPressed: _handleClick,
                              child: Icon(
                                _isOpen ? Icons.clear : Icons.menu,
                                color: Colors.white,
                                size: 24,
                              ),
                            )),
                      ],
                    ),
                  )

                  // OpenContainer(
                  //   closedBuilder: (context,action){
                  //     return Container(
                  //       height: Globals.getHeight(65),
                  //       width: w,
                  //       child: Stack(
                  //         alignment: Alignment.center,
                  //         children: [
                  //           Positioned(top: 5.0,child: Icon(Icons.menu,color: Colors.white,size: 24,),)
                  //         ],
                  //       ),
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12),),
                  //           gradient: LinearGradient(
                  //               colors: [Color(0xFF606CCD),Color(0xFF231F20),],
                  //               begin: Alignment.topCenter,
                  //               end: Alignment.bottomCenter,
                  //               stops: [0.05,1.0]
                  //           )
                  //       ),
                  //     );
                  //   },
                  //   openBuilder: (context,action){
                  //     return Container(
                  //       height: Globals.getHeight(605),
                  //       width: w,
                  //       child: Stack(
                  //         alignment: Alignment.center,
                  //         children: [
                  //           Positioned(top: 5.0,child: Icon(Icons.menu,color: Colors.white,size: 24,),)
                  //         ],
                  //       ),
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12),),
                  //           gradient: LinearGradient(
                  //               colors: [Color(0xFF606CCD),Color(0xFF231F20),],
                  //               begin: Alignment.topCenter,
                  //               end: Alignment.bottomCenter,
                  //               stops: [0.05,1.0]
                  //           )
                  //       ),
                  //     );
                  //   },
                  // )

                  ),
            ],
          )),
        ),
        onWillPop: () {
          SystemNavigator.pop();
          return Future.value(false);
        });
  }

  static double _minHeight = Globals.getHeight(65),
      _maxHeight = Globals.getHeight(657);
  Offset _offset = Offset(0, _minHeight);
  bool _isOpen = false;

  void _handleClick() {
    _isOpen = !_isOpen;
    Timer.periodic(Duration(milliseconds: 5), (timer) {
      if (_isOpen) {
        double value = _offset.dy + Globals.getHeight(25);
        _offset = Offset(0, value);
        if (_offset.dy > _maxHeight) {
          _offset = Offset(0, _maxHeight);
          timer.cancel();
        }
      } else {
        double value = _offset.dy - Globals.getHeight(25);
        _offset = Offset(0, value);
        if (_offset.dy < _minHeight) {
          _offset = Offset(0, _minHeight);
          timer.cancel();
        }
      }
      setState(() {});
    });
  }
}
