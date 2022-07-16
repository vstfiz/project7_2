import 'dart:async';
import 'dart:ui';
import 'package:geocoder/geocoder.dart';
import 'package:achievement_view/achievement_view.dart';
import 'package:achievement_view/achievement_widget.dart';
import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project7_2/custom/calendar/event.dart';
import 'package:project7_2/custom/clipped_profile/clipped_profile.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/custom/hexagon_clipper/hexagon_clipper.dart';
import 'package:project7_2/custom/spinner_loader/spinner.dart';
import 'package:project7_2/custom/trapezium_clipper/trapezium_clipper.dart';
import 'package:project7_2/services/auth/auth.dart';
import 'package:project7_2/utils/constants.dart';
import 'package:project7_2/view/auth/signin.dart';
import 'package:project7_2/view/new_ui/create_game/create_game_event.dart';
import 'package:project7_2/view/new_ui/left_side_navigation/left_panel.dart';
import 'package:project7_2/view/new_ui/locker_room/request_confirmation.dart';
import 'package:project7_2/view/user_profile/user_profile.dart';

import '../../custom/calendar/calendar.dart';
import '../new_ui/locker_room/match_data.dart';
import '../new_ui/locker_room/request_confirmed.dart';
import '../new_ui/locker_room/request_sent.dart';

class FindPLaces extends StatefulWidget {
  _FindPLacesState createState() => _FindPLacesState();
}

class _FindPLacesState extends State<FindPLaces> {
  GoogleMapController _controller;
  Location _location = Location.instance;
  double radiusValue = 1;
  String selectedSport = 'Select';
  String selectedToDate = 'Select';
  String selectedFromDate = 'Select';
  String selectedGender = 'Select';
  String selectedPosition = 'Select';
  String selectedNumberOfPlayers = 'Select';
  TextEditingController _searchController = TextEditingController();
  bool isFilterOpen = false;
  Set<Marker> markers = Set.from([]);
  List<String> tags = [
    'Today',
    'Tomorrow',
    'Monday',
    'Friday',
    'Football',
    'Badminton'
  ];
  List<String> texts = [];
  List<String> icons = [];
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
  bool isGameAddOpen = false;
  String _darkMapStyle;

  @override
  void initState() {
    super.initState();
    _loadMapStyles();
    texts.add('5:00 PM');
    texts.add('Azad Nagar');
    texts.add('12/05/2000');
    texts.add('Football');
    icons.add('assets/images/onboarding/watch.png');
    icons.add('assets/images/onboarding/location_pin.png');
    icons.add('assets/images/onboarding/calendar.png');
    icons.add('assets/images/onboarding/sport_football.png');
  }

  _getCustomIcon(double latitude, double longitude) async {
    ImageConfiguration configuration = createLocalImageConfiguration(context);
    BitmapDescriptor ic = await createBitmapDescriptorFromIconData(
        'assets/images/google_markers/football.png');
    BitmapDescriptor ic1 = await createBitmapDescriptorFromIconData(
        'assets/images/google_markers/cricket.png');
    BitmapDescriptor ic2 = await createBitmapDescriptorFromIconData(
        'assets/images/google_markers/rugby.png');
    BitmapDescriptor ic3 = await createBitmapDescriptorFromIconData(
        'assets/images/google_markers/football.png');
    BitmapDescriptor ic4 = await createBitmapDescriptorFromIconData(
        'assets/images/google_markers/football.png');
    BitmapDescriptor ic5 = await createBitmapDescriptorFromIconData(
        'assets/images/google_markers/football.png');
    Marker m = new Marker(
        markerId: new MarkerId('gvfsae'),
        position: new LatLng(latitude + 0.0025341, 0.00462 + longitude),
        icon: BitmapDescriptor.fromJson(ic.toJson()),
        infoWindow: InfoWindow(title: 'Football Court 1'));
    Marker m1 = new Marker(
        markerId: new MarkerId('gvfsafeae'),
        position: new LatLng(
            0.03644718298059 + latitude, longitude + 0.00179475797103),
        icon: BitmapDescriptor.fromJson(ic1.toJson()),
        infoWindow: InfoWindow(title: 'Rugby Court 1'));
    Marker m2 = new Marker(
        markerId: new MarkerId('gvfsdwaae'),
        position:
            new LatLng(latitude + 0.0026789930289, longitude + 0.000434609267),
        icon: BitmapDescriptor.fromJson(ic2.toJson()),
        infoWindow: InfoWindow(title: 'Cricket Court 1'));
    setState(() {
      markers.add(m);
      markers.add(m1);
      markers.add(m2);
    });
  }

  Future<BitmapDescriptor> createBitmapDescriptorFromIconData(
      String key) async {
    final bytes = await rootBundle.load(key);
    Image(
      image: ResizeImage(AssetImage(key), width: 50),
    ).image;
    return BitmapDescriptor.fromBytes(bytes.buffer.asUint8List());
  }



  Future _loadMapStyles() async {
    _darkMapStyle =
        await rootBundle.loadString('assets/map_styles/dark_style.json');
  }

  var sports = [
    'Cricket',
    'Basketball',
    'Tennis',
    'Squash',
    'Golf',
    'Football',
    'Futsal',
    'Pool',
    'Billiards',
    'Table Tennis',
    'Badminton'
  ];
  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {},
  );
  DateTime _currentDate = DateTime.now();

  Future<void> _selectFromDateDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20.0,
                sigmaY: 20.0,
              ),
              child: Dialog(
                backgroundColor: Colors.black87.withOpacity(0.5),
                elevation: 5.0,
                insetAnimationCurve: Curves.bounceIn,
                insetAnimationDuration: Duration(milliseconds: 750),
                child: Container(
                  width: Globals.width,
                  height: Globals.getHeight(350),
                  child: CalendarCarousel<Event>(
                    onDayPressed: (DateTime date, List<Event> events) {
                      this.setState(() => _currentDate = date);
                    },
                    weekendTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                    thisMonthDayBorderColor: Colors.grey,
                    minSelectedDate: new DateTime(_currentDate.year,
                        _currentDate.month, _currentDate.day),
                    weekFormat: false,
                    markedDatesMap: _markedDateMap,
                    height: 420.0,
                    selectedDateTime: _currentDate,
                    daysHaveCircularBorder: true,
                    onDayLongPressed: (date) {
                      setState(() {
                        selectedFromDate = date.day.toString() +
                            "/" +
                            date.month.toString() +
                            "/" +
                            date.year.toString();
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),
          );
        });
  }

  Future<void> _selectToDateDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20.0,
                sigmaY: 20.0,
              ),
              child: Dialog(
                backgroundColor: Colors.black87.withOpacity(0.5),
                elevation: 5.0,
                insetAnimationCurve: Curves.bounceIn,
                insetAnimationDuration: Duration(milliseconds: 750),
                child: Container(
                  width: Globals.width,
                  height: Globals.getHeight(350),
                  child: CalendarCarousel<Event>(
                    onDayPressed: (DateTime date, List<Event> events) {
                      this.setState(() => _currentDate = date);
                    },
                    weekendTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                    thisMonthDayBorderColor: Colors.grey,
                    minSelectedDate: new DateTime(_currentDate.year,
                        _currentDate.month, _currentDate.day),
                    weekFormat: false,
                    markedDatesMap: _markedDateMap,
                    height: 420.0,
                    selectedDateTime: _currentDate,
                    daysHaveCircularBorder: true,
                    onDayLongPressed: (date) {
                      setState(() {
                        selectedToDate = date.day.toString() +
                            "/" +
                            date.month.toString() +
                            "/" +
                            date.year.toString();
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),
          );
        });
  }

  Future<void> _selectGameDialog(sports) {
    showDialog(
        context: context,
        builder: (context) {
          return ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20.0,
                sigmaY: 20.0,
              ),
              child: AlertDialog(
                backgroundColor: Colors.black87.withOpacity(0.5),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Okay',
                      style: GoogleFonts.montserrat(color: Colors.white),
                    ),
                  ),
                ],
                content: Container(
                  height: Globals.height * 0.65,
                  width: Globals.width * 0.8,
                  child: ListView(
                    children: List.generate(sports.length, (index) {
                      return (sports.length - 1 == index)
                          ? Container(
                              width: Globals.width * 0.8,
                              height: Globals.getHeight(60),
                              decoration: BoxDecoration(
                                  // color: Color(0xFF231F20),
                                  ),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedSport = sports[index];
                                  });
                                  Navigator.pop(context);
                                },
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                      child: Container(
                                        width: Globals.width * 0.8,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 20.0,
                                        ),
                                        child: Text(
                                          sports[index],
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white,
                                              fontSize: Globals.getFontSize(15),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      left: 0.0,
                                    ),
                                    Positioned(
                                      child: Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 0.599)),
                                          child: sports[index] == selectedSport
                                              ? Center(
                                                  child: CircleAvatar(
                                                    radius: 7,
                                                    foregroundColor:
                                                        Color(0xFF7585FF),
                                                  ),
                                                )
                                              : SizedBox()),
                                      right: 20,
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              width: Globals.width * 0.8,
                              height: Globals.getHeight(60),
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.white.withOpacity(0.5),
                                        width: 0.5)),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedSport = sports[index];
                                  });
                                  Navigator.pop(context);
                                },
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                      child: Container(
                                        width: Globals.width * 0.8,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 20.0,
                                        ),
                                        child: Text(
                                          sports[index],
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white,
                                              fontSize: Globals.getFontSize(15),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      left: 0.0,
                                    ),
                                    Positioned(
                                      child: Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 0.599)),
                                          child: sports[index] == selectedSport
                                              ? Center(
                                                  child: CircleAvatar(
                                                    radius: 7,
                                                    foregroundColor:
                                                        Color(0xFF7585FF),
                                                  ),
                                                )
                                              : SizedBox()),
                                      right: 20,
                                    )
                                  ],
                                ),
                              ),
                            );
                    }),
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget _filterPage(BuildContext context) {
    return Container(
      height: Globals.getHeight(463),
      width: Globals.getWidth(225),
      color: Colors.black.withOpacity(0.5),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: Text(
              'filter games by:'.toUpperCase(),
              style: GoogleFonts.montserrat(
                  fontSize: Globals.getFontSize(14),
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3.0,
                  color: Colors.white),
            ),
            top: Globals.getHeight(13),
            left: Globals.getWidth(22),
          ),
          Positioned(
            child: Divider(
              color: Colors.white.withOpacity(0.5),
              thickness: 1.0,
            ),
            top: Globals.getHeight(35.1),
            left: Globals.getWidth(0),
            width: Globals.getWidth(225),
          ),
          Positioned(
            child: Text(
              'Recent Filter',
              style: GoogleFonts.montserrat(
                  fontSize: Globals.getFontSize(14),
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            top: Globals.getHeight(55),
            left: Globals.getWidth(22),
          ),
          Positioned(
            child: Container(
              width: Globals.getWidth(200),
              height: Globals.getHeight(30),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(tags.length, (index) {
                  return Container(
                    margin: EdgeInsets.only(right: Globals.getWidth(20)),
                    padding: EdgeInsets.symmetric(
                        vertical: Globals.getHeight(5),
                        horizontal: Globals.getWidth(10)),
                    child: Row(
                      children: [
                        Text(
                          tags[index],
                          style: GoogleFonts.montserrat(
                              fontSize: Globals.getFontSize(14),
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.clear,
                          color: Colors.white,
                          size: 16,
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.black.withOpacity(0.5)),
                  );
                }),
              ),
            ),
            top: Globals.getHeight(73.3),
            left: Globals.getWidth(22),
          ),
          Positioned(
            width: Globals.getWidth(180),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Radius',
                      style: GoogleFonts.montserrat(
                          fontSize: Globals.getFontSize(14),
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    Text(
                      '${radiusValue.toInt()} km',
                      style: GoogleFonts.montserrat(
                          fontSize: Globals.getFontSize(14),
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ],
                ),
                Slider(
                  value: radiusValue,
                  onChanged: (value) {
                    setState(() {
                      radiusValue = value;
                    });
                  },
                  min: 1,
                  max: 50,
                  thumbColor: Colors.white,
                  activeColor: Colors.white,
                  inactiveColor: Colors.white,
                )
              ],
            ),
            top: Globals.getHeight(117),
            left: Globals.getWidth(22),
          ),
          Positioned(
              top: Globals.getHeight(168.71),
              left: 5.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Game',
                    style: GoogleFonts.montserrat(
                        fontSize: Globals.getFontSize(10),
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6C7B8A)),
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    child: TextButton(
                        onPressed: () {
                          _selectGameDialog(sports);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedSport,
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: Globals.getFontSize(10),
                                  fontWeight: FontWeight.w500),
                            ),
                            Icon(
                              Icons.clear,
                              color: Colors.white,
                              size: 10.0,
                            )
                          ],
                        )),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Globals.getWidth(8.57)),
                        color: Color(0xFF231F20)),
                    height: Globals.getHeight(24.25),
                    width: Globals.getWidth(204),
                  )
                ],
              )),
          Positioned(
              top: Globals.getHeight(210.71),
              left: 5.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'From Date',
                    style: GoogleFonts.montserrat(
                        fontSize: Globals.getFontSize(10),
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6C7B8A)),
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    child: TextButton(
                        onPressed: () {
                          _selectFromDateDialog();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedFromDate,
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: Globals.getFontSize(10),
                                  fontWeight: FontWeight.w500),
                            ),
                            Icon(
                              Icons.clear,
                              color: Colors.white,
                              size: 10.0,
                            )
                          ],
                        )),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Globals.getWidth(8.57)),
                        color: Color(0xFF231F20)),
                    height: Globals.getHeight(24.25),
                    width: Globals.getWidth(204),
                  )
                ],
              )),
          Positioned(
              top: Globals.getHeight(252.71),
              left: 5.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'To Date',
                    style: GoogleFonts.montserrat(
                        fontSize: Globals.getFontSize(10),
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6C7B8A)),
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    child: TextButton(
                        onPressed: () {
                          _selectToDateDialog();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedToDate,
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: Globals.getFontSize(10),
                                  fontWeight: FontWeight.w500),
                            ),
                            Icon(
                              Icons.clear,
                              color: Colors.white,
                              size: 10.0,
                            )
                          ],
                        )),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Globals.getWidth(8.57)),
                        color: Color(0xFF231F20)),
                    height: Globals.getHeight(24.25),
                    width: Globals.getWidth(204),
                  )
                ],
              )),
          Positioned(
              top: Globals.getHeight(294.71),
              left: 5.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Position',
                    style: GoogleFonts.montserrat(
                        fontSize: Globals.getFontSize(10),
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6C7B8A)),
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    child: TextButton(
                        onPressed: () {
                          _selectGameDialog(sports);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedPosition,
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: Globals.getFontSize(10),
                                  fontWeight: FontWeight.w500),
                            ),
                            Icon(
                              Icons.clear,
                              color: Colors.white,
                              size: 10.0,
                            )
                          ],
                        )),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Globals.getWidth(8.57)),
                        color: Color(0xFF231F20)),
                    height: Globals.getHeight(24.25),
                    width: Globals.getWidth(204),
                  )
                ],
              )),
          Positioned(
              top: Globals.getHeight(336.71),
              left: 5.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Players Needed',
                    style: GoogleFonts.montserrat(
                        fontSize: Globals.getFontSize(10),
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6C7B8A)),
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    child: TextButton(
                        onPressed: () {
                          _selectGameDialog(sports);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedNumberOfPlayers,
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: Globals.getFontSize(10),
                                  fontWeight: FontWeight.w500),
                            ),
                            Icon(
                              Icons.clear,
                              color: Colors.white,
                              size: 10.0,
                            )
                          ],
                        )),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Globals.getWidth(8.57)),
                        color: Color(0xFF231F20)),
                    height: Globals.getHeight(24.25),
                    width: Globals.getWidth(204),
                  )
                ],
              )),
          Positioned(
              top: Globals.getHeight(378.71),
              left: 5.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Gender',
                    style: GoogleFonts.montserrat(
                        fontSize: Globals.getFontSize(10),
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6C7B8A)),
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    child: TextButton(
                        onPressed: () {
                          _selectGameDialog(sports);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedGender,
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: Globals.getFontSize(10),
                                  fontWeight: FontWeight.w500),
                            ),
                            Icon(
                              Icons.clear,
                              color: Colors.white,
                              size: 10.0,
                            )
                          ],
                        )),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Globals.getWidth(8.57)),
                        color: Color(0xFF231F20)),
                    height: Globals.getHeight(24.25),
                    width: Globals.getWidth(204),
                  )
                ],
              )),
          Positioned(
              top: Globals.getHeight(422),
              child: Container(
                height: Globals.getHeight(31),
                width: Globals.getWidth(180),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'show results'.toUpperCase(),
                    style: GoogleFonts.montserrat(
                        fontSize: Globals.getFontSize(12),
                        fontWeight: FontWeight.w400,
                        letterSpacing: 2,
                        color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Globals.getWidth(8.57)),
                    border: Border.all(color: Color(0xFF4C5FEF)),
                    color: Color(0xFF231F20)),
              )),
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController _cntlr) async {
    _controller = _cntlr;
    _controller.setMapStyle(_darkMapStyle);
    var _data = await _location.getLocation();
    print(_data.longitude.toString() + 'dfeafe');
    print(_data.latitude.toString() + 'dfeafe');
    await _getCustomIcon(_data.latitude, _data.longitude);
    // Using geocoder2 but issue with maps api

    // var addresses = (await Geocoder2.getDataFromCoordinates(
    //     latitude: _data.latitude,
    //     longitude: _data.longitude,
    //     googleMapApiKey: Constants.mapsApiKey));
    // locationValue = addresses.address;

    final coordinates = new Coordinates(_data.latitude, _data.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    setState(() {
      locationValue = ("${first.subAdminArea}, ${first.adminArea}");
    });
    _location.onLocationChanged.listen((l) async {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
        ),
      );
    });
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(27.8856065, 78.0981966),
  );

  @override
  Widget build(BuildContext context) {
    double h = Globals.height;
    double w = Globals.width;
    return WillPopScope(
        child: SafeArea(
          top: true,
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xFF121217),
                leading: Container(
                  width: Globals.width * 0.07,
                  height: Globals.width * 0.07,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(PageTransition(
                          type: PageTransitionType.leftToRight,
                          child: LeftPanel(),
                          duration: new Duration(milliseconds: 300),
                          curve: Curves.easeInOut));
                    },
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                actions: [
                  Container(
                      width: Globals.width * 0.07,
                      height: Globals.width * 0.07,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[800].withOpacity(0.7),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // showDialog(barrierColor: Color(0x01000000),context: context, builder: (context){
                          //   return match_data(context,texts,icons);
                          // });
                          Globals.currentTab = 1;
                          Globals.pageController.jumpToPage(4);
                        },
                        child: Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.white,
                          size: 16,
                        ),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: Globals.width * 0.07,
                    height: Globals.width * 0.07,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[800].withOpacity(0.7),
                    ),
                    child: GestureDetector(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 18,
                      ),
                      onTap: () async {
                        setState(() {
                          isGameAddOpen = !isGameAddOpen;
                        });
                        // Provider.of<FindPLaces>(context,listen: false).updateGameAdd();
                        // _loadingDialog('Creating Locker Room');
                        // var ref = FirebaseFirestore.instance;
                        // await ref.collection('lockerRooms').add({
                        //   'createdByUid': Globals.uid,
                        //   'ownerName': Globals.name,
                        //   'sports': 'Football',
                        //   'location': 'NH2 Delhi Kanpur Highway',
                        // });
                        // await Globals.lockerRooms.add(1);
                        // Timer t = new Timer(new Duration(seconds: 3), () {
                        //   Navigator.pop(context);
                        //   setState(() {
                        //     Globals.currentTab = 2;
                        //     Globals.pageController.jumpToPage(2);
                        //   });
                        // });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: Globals.width * 0.07,
                    height: Globals.width * 0.07,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[800].withOpacity(0.7),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Globals.currentTab = 1;
                        Globals.pageController.jumpToPage(3);
                      },
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  )
                ],
              ),
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
                                color: isFilterOpen
                                    ? Color(0xFF7585FF)
                                    : Colors.white,
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
                  isGameAddOpen
                      ? Positioned(
                          top: h * 0.15 + Globals.getHeight(140),
                          child: ClipPath(
                            clipper: TrapeziumClipper(),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 20.0,
                                sigmaY: 20.0,
                              ),
                              child: Container(
                                height: Globals.getHeight(400),
                                width: Globals.getWidth(330),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: Globals.getHeight(15),
                                      right: Globals.getWidth(15),
                                      child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            isGameAddOpen = false;
                                          });
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          size: Globals.getWidth(20),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      child: Container(
                                        height: Globals.getHeight(120),
                                        width: Globals.getWidth(345),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: Globals.getWidth(16),
                                            ),
                                            Container(
                                              height: Globals.getHeight(120),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  ClipPath(
                                                    clipper: HexagonClipper(),
                                                    child: Container(
                                                      height:
                                                          Globals.getHeight(89),
                                                      width:
                                                          Globals.getWidth(80),
                                                      color: Colors.white,
                                                      child: TextButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            isFilterOpen =
                                                                false;
                                                          });
                                                          Navigator.of(context).push(PageTransition(
                                                              type: PageTransitionType
                                                                  .rightToLeft,
                                                              child:
                                                                  CreateGameEvent(),
                                                              duration:
                                                                  new Duration(
                                                                      milliseconds:
                                                                          300),
                                                              curve: Curves
                                                                  .easeInOut));
                                                        },
                                                        child: Image.asset(
                                                          'assets/images/homescreen/field.png',
                                                          height:
                                                              Globals.getHeight(
                                                                  29),
                                                          width:
                                                              Globals.getWidth(
                                                                  36.22),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'GAME',
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            color: Colors.white,
                                                            letterSpacing: 2.0,
                                                            fontSize: Globals
                                                                .getFontSize(
                                                                    16),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: Globals.getWidth(30),
                                            ),
                                            Container(
                                              height: Globals.getHeight(120),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  ClipPath(
                                                    clipper: HexagonClipper(),
                                                    child: Container(
                                                      height:
                                                          Globals.getHeight(89),
                                                      width:
                                                          Globals.getWidth(80),
                                                      color: Colors.white,
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: Image.asset(
                                                          'assets/images/homescreen/tournament.png',
                                                          height:
                                                              Globals.getHeight(
                                                                  31.71),
                                                          width:
                                                              Globals.getWidth(
                                                                  36),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'TOURNEY',
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            color: Colors.white,
                                                            letterSpacing: 2.0,
                                                            fontSize: Globals
                                                                .getFontSize(
                                                                    16),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: Globals.getWidth(30),
                                            ),
                                            Container(
                                              height: Globals.getHeight(120),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  ClipPath(
                                                    clipper: HexagonClipper(),
                                                    child: Container(
                                                      height:
                                                          Globals.getHeight(89),
                                                      width:
                                                          Globals.getWidth(80),
                                                      color: Colors.white,
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: Image.asset(
                                                          'assets/images/homescreen/team.png',
                                                          height:
                                                              Globals.getHeight(
                                                                  23),
                                                          width:
                                                              Globals.getWidth(
                                                                  36),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'TEAM',
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            color: Colors.white,
                                                            letterSpacing: 2.0,
                                                            fontSize: Globals
                                                                .getFontSize(
                                                                    16),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      top: Globals.getHeight(75),
                                    ),
                                    Positioned(
                                      child: Container(
                                        height: Globals.getHeight(120),
                                        width: Globals.getWidth(330),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: Globals.getWidth(16),
                                            ),
                                            Container(
                                              height: Globals.getHeight(120),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  ClipPath(
                                                    clipper: HexagonClipper(),
                                                    child: Container(
                                                      height:
                                                          Globals.getHeight(89),
                                                      width:
                                                          Globals.getWidth(80),
                                                      color: Colors.white,
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: Image.asset(
                                                          'assets/images/homescreen/venue.png',
                                                          height:
                                                              Globals.getHeight(
                                                                  36),
                                                          width:
                                                              Globals.getWidth(
                                                                  36),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'VENUE',
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            color: Colors.white,
                                                            letterSpacing: 2.0,
                                                            fontSize: Globals
                                                                .getFontSize(
                                                                    16),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: Globals.getWidth(30),
                                            ),
                                            Container(
                                              height: Globals.getHeight(120),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  ClipPath(
                                                    clipper: HexagonClipper(),
                                                    child: Container(
                                                      height:
                                                          Globals.getHeight(89),
                                                      width:
                                                          Globals.getWidth(80),
                                                      color: Colors.white,
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: Image.asset(
                                                          'assets/images/homescreen/alerts.png',
                                                          height:
                                                              Globals.getHeight(
                                                                  26),
                                                          width:
                                                              Globals.getWidth(
                                                                  36.23),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'ALERTS',
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            color: Colors.white,
                                                            letterSpacing: 2.0,
                                                            fontSize: Globals
                                                                .getFontSize(
                                                                    16),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: Globals.getWidth(30),
                                            ),
                                            Container(
                                              height: Globals.getHeight(120),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  ClipPath(
                                                    clipper: HexagonClipper(),
                                                    child: Container(
                                                      height:
                                                          Globals.getHeight(89),
                                                      width:
                                                          Globals.getWidth(80),
                                                      color: Colors.white,
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: Image.asset(
                                                          'assets/images/homescreen/settings.png',
                                                          height:
                                                              Globals.getHeight(
                                                                  26.25),
                                                          width:
                                                              Globals.getWidth(
                                                                  26.25),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'SETTINGS',
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            color: Colors.white,
                                                            letterSpacing: 2.0,
                                                            fontSize: Globals
                                                                .getFontSize(
                                                                    16),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      top: Globals.getHeight(220),
                                    ),
                                    // Positioned(
                                    //     top: Globals.getHeight(360),
                                    //     left: Globals.getWidth(15),
                                    //     child: ClipRRect(
                                    //       child: BackdropFilter(
                                    //         filter: ImageFilter.blur(
                                    //           sigmaX: 100.0,
                                    //           sigmaY: 100.0,
                                    //         ),
                                    //         child: Container(
                                    //           width: Globals.getWidth(300),
                                    //           height: Globals.getHeight(62),
                                    //           decoration: BoxDecoration(
                                    //               color: Color.fromRGBO(
                                    //                   255, 255, 255, 0.3),
                                    //               borderRadius:
                                    //                   BorderRadius.circular(
                                    //                       Globals.getWidth(100)),
                                    //               backgroundBlendMode:
                                    //                   BlendMode.difference),
                                    //           child: TextField(
                                    //             controller: _searchController,
                                    //             textAlignVertical:
                                    //                 TextAlignVertical.center,
                                    //             cursorHeight: Globals.getHeight(25),
                                    //             cursorColor: Color(0xFF7585FF),
                                    //             style: GoogleFonts.montserrat(
                                    //               fontSize: Globals.getFontSize(16),
                                    //               fontWeight: FontWeight.w300,
                                    //               color: Colors.white,
                                    //             ),
                                    //             decoration: InputDecoration(
                                    //                 border: InputBorder.none,
                                    //                 suffixIcon: Padding(
                                    //                   padding: EdgeInsets.only(
                                    //                       top: Globals.getHeight(
                                    //                           12.0),
                                    //                       right: 12.0),
                                    //                   child: Icon(
                                    //                     Icons.search,
                                    //                     color: Colors.white,
                                    //                     size: 30,
                                    //                   ),
                                    //                 ),
                                    //                 hintText: 'Find Something...',
                                    //                 hintStyle:
                                    //                     GoogleFonts.montserrat(
                                    //                   fontSize:
                                    //                       Globals.getFontSize(16),
                                    //                   fontWeight: FontWeight.w300,
                                    //                   color: Colors.white,
                                    //                 ),
                                    //                 contentPadding: EdgeInsets.only(
                                    //                     left: 25.0,
                                    //                     top: Globals.getHeight(12),
                                    //                     right: 15.0)),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     )),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF140F26).withOpacity(0.5),
                                        Color(0xFF7585FF).withOpacity(0.5)
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        Globals.getWidth(25))),
                              ),
                            ),
                          ))
                      : SizedBox(),
                  isFilterOpen
                      ? Positioned(
                          top: Globals.getHeight(150),
                          right: Globals.getWidth(15),
                          child: ClipPath(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 10.0,
                                sigmaY: 10.0,
                              ),
                              child: _filterPage(context),
                            ),
                          ))
                      : SizedBox(),
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
                                _offset =
                                    Offset(0, _offset.dy - details.delta.dy);
                                if (_offset.dy < _FindPLacesState._minHeight) {
                                  _offset =
                                      Offset(0, _FindPLacesState._minHeight);
                                  _isOpen = false;
                                } else if (_offset.dy >
                                    _FindPLacesState._maxHeight) {
                                  _offset =
                                      Offset(0, _FindPLacesState._maxHeight);
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
                                  child: (_offset.dy == _FindPLacesState._maxHeight)? Column(
                                    children: [
                                      SizedBox(
                                        height: 60.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            height: Globals.getHeight(243),
                                            width: Globals.getWidth(171),
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    Globals.getWidth(10))),
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Positioned(
                                                  top: Globals.getHeight(8),
                                                  child: Container(
                                                    height:
                                                    Globals.getHeight(95),
                                                    width:
                                                    Globals.getWidth(155),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(Globals
                                                            .getWidth(
                                                            10)),
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/images/match_back.png'),
                                                            fit: BoxFit.cover)),
                                                    child: Center(
                                                      child: Image.asset(
                                                        'assets/images/football_generic.png',
                                                        height:
                                                        Globals.getWidth(
                                                            61),
                                                        width: Globals.getWidth(
                                                            61),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                    top: Globals.getHeight(73),
                                                    right: Globals.getWidth(15),
                                                    child: Container(
                                                      padding:
                                                      EdgeInsets.symmetric(
                                                          horizontal:
                                                          Globals
                                                              .getWidth(
                                                              4),
                                                          vertical: Globals
                                                              .getWidth(4)),
                                                      height:
                                                      Globals.getWidth(42),
                                                      width:
                                                      Globals.getWidth(42),
                                                      child: Image.asset(
                                                        'assets/images/left_panel/profile_image.png',
                                                        height:
                                                        Globals.getWidth(
                                                            34),
                                                        width: Globals.getWidth(
                                                            34),
                                                      ),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          shape:
                                                          BoxShape.circle),
                                                    )),
                                                Positioned(
                                                    top: Globals.getHeight(123),
                                                    left: Globals.getWidth(14),
                                                    child: Text(
                                                      'Event Name',
                                                      style: GoogleFonts.montserrat(
                                                          color: Colors.white,
                                                          letterSpacing: 2.0,
                                                          fontSize:
                                                          Globals.getFontSize(12),
                                                          fontWeight: FontWeight.w600),
                                                    )),
                                                Positioned(
                                                  child:  Column(
                                                    children: [
                                                      Container(
                                                        width: Globals.width,
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Container(
                                                              width: Globals.getWidth(20),
                                                              height: Globals.getHeight(20),
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          'assets/images/time_icon.png'),
                                                                      fit: BoxFit.contain)),
                                                            ),
                                                            SizedBox(width: Globals.getWidth(5.78),),
                                                            Text(
                                                              '05PM to 06PM ',
                                                              style: GoogleFonts.montserrat(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: Globals.getFontSize(12)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),

                                                      SizedBox(height: 7,),
                                                      Container(
                                                        width: Globals.width,
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Container(
                                                              width: Globals.getWidth(12),
                                                              height: Globals.getHeight(12),
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          'assets/images/calendar_icon.png'),
                                                                      fit: BoxFit.contain)),
                                                            ),
                                                            SizedBox(width: Globals.getWidth(5.78),),
                                                            Text(
                                                              '12th October 2021',
                                                              style: GoogleFonts.montserrat(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: Globals.getFontSize(12)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height: 7,),
                                                      Container(
                                                        width: Globals.width,
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Container(
                                                              width: Globals.getWidth(15),
                                                              height: Globals.getHeight(15),
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          'assets/images/location_icon.png'),
                                                                      fit: BoxFit.contain)),
                                                            ),
                                                            SizedBox(width: Globals.getWidth(5.78),),
                                                            Text(
                                                              'Andheri, Mumbai',
                                                              style: GoogleFonts.montserrat(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: Globals.getFontSize(12)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                  top: Globals.getHeight(148),
                                                  left: Globals.getWidth(10),
                                                ),
                                                Positioned(
                                                    top: Globals.getHeight(212),
                                                    child: Container(
                                                      height: Globals.getHeight(22),
                                                      width: Globals.getWidth(83),
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: Text(
                                                          'Rs. 600/person',
                                                          style: GoogleFonts.montserrat(
                                                              fontSize: Globals.getFontSize(8),
                                                              fontWeight: FontWeight.w400,
                                                              color: Colors.white),
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(Globals.getWidth(8.57)),
                                                          color: Color(0xFF1ECFCC)),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: Globals.getHeight(243),
                                            width: Globals.getWidth(171),
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    Globals.getWidth(10))),
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Positioned(
                                                  top: Globals.getHeight(8),
                                                  child: Container(
                                                    height:
                                                    Globals.getHeight(95),
                                                    width:
                                                    Globals.getWidth(155),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(Globals
                                                            .getWidth(
                                                            10)),
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/images/field_1.png'),
                                                            fit: BoxFit.cover)),
                                                  ),
                                                ),
                                                Positioned(
                                                    top: Globals.getHeight(73),
                                                    right: Globals.getWidth(15),
                                                    child: Container(
                                                      padding:
                                                      EdgeInsets.symmetric(
                                                          horizontal:
                                                          Globals
                                                              .getWidth(
                                                              4),
                                                          vertical: Globals
                                                              .getWidth(4)),
                                                      height:
                                                      Globals.getWidth(42),
                                                      width:
                                                      Globals.getWidth(42),
                                                      child: Image.asset(
                                                        'assets/images/left_panel/profile-image.png',
                                                        height:
                                                        Globals.getWidth(
                                                            34),
                                                        width: Globals.getWidth(
                                                            34),
                                                      ),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          shape:
                                                          BoxShape.circle),
                                                    )),
                                                Positioned(
                                                    top: Globals.getHeight(123),
                                                    left: Globals.getWidth(14),
                                                    child: Text(
                                                      'Event Name',
                                                      style: GoogleFonts.montserrat(
                                                          color: Colors.white,
                                                          letterSpacing: 2.0,
                                                          fontSize:
                                                          Globals.getFontSize(12),
                                                          fontWeight: FontWeight.w600),
                                                    )),
                                                Positioned(
                                                  child:  Column(
                                                    children: [
                                                      Container(
                                                        width: Globals.width,
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Container(
                                                              width: Globals.getWidth(20),
                                                              height: Globals.getHeight(20),
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          'assets/images/time_icon.png'),
                                                                      fit: BoxFit.contain)),
                                                            ),
                                                            SizedBox(width: Globals.getWidth(5.78),),
                                                            Text(
                                                              '05PM to 06PM ',
                                                              style: GoogleFonts.montserrat(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: Globals.getFontSize(12)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),

                                                      SizedBox(height: 7,),
                                                      Container(
                                                        width: Globals.width,
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Container(
                                                              width: Globals.getWidth(12),
                                                              height: Globals.getHeight(12),
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          'assets/images/calendar_icon.png'),
                                                                      fit: BoxFit.contain)),
                                                            ),
                                                            SizedBox(width: Globals.getWidth(5.78),),
                                                            Text(
                                                              '12th October 2021',
                                                              style: GoogleFonts.montserrat(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: Globals.getFontSize(12)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height: 7,),
                                                      Container(
                                                        width: Globals.width,
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Container(
                                                              width: Globals.getWidth(15),
                                                              height: Globals.getHeight(15),
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          'assets/images/location_icon.png'),
                                                                      fit: BoxFit.contain)),
                                                            ),
                                                            SizedBox(width: Globals.getWidth(5.78),),
                                                            Text(
                                                              'Andheri, Mumbai',
                                                              style: GoogleFonts.montserrat(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: Globals.getFontSize(12)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                  top: Globals.getHeight(148),
                                                  left: Globals.getWidth(10),
                                                ),
                                                Positioned(
                                                    top: Globals.getHeight(212),
                                                    child: Container(
                                                      height: Globals.getHeight(22),
                                                      width: Globals.getWidth(83),
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: Text(
                                                          'Rs. 600/person',
                                                          style: GoogleFonts.montserrat(
                                                              fontSize: Globals.getFontSize(8),
                                                              fontWeight: FontWeight.w400,
                                                              color: Colors.white),
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(Globals.getWidth(8.57)),
                                                          color: Color(0xFF1ECFCC)),
                                                    )),
                                              ],
                                            ),
                                          ),

                                        ],
                                      ),
                                      SizedBox(
                                        height: 60.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            height: Globals.getHeight(243),
                                            width: Globals.getWidth(171),
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    Globals.getWidth(10))),
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Positioned(
                                                  top: Globals.getHeight(8),
                                                  child: Container(
                                                    height:
                                                    Globals.getHeight(95),
                                                    width:
                                                    Globals.getWidth(155),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(Globals
                                                            .getWidth(
                                                            10)),
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/images/field_2.png'),
                                                            fit: BoxFit.cover)),
                                                  ),
                                                ),
                                                Positioned(
                                                    top: Globals.getHeight(73),
                                                    right: Globals.getWidth(15),
                                                    child: Container(
                                                      padding:
                                                      EdgeInsets.symmetric(
                                                          horizontal:
                                                          Globals
                                                              .getWidth(
                                                              4),
                                                          vertical: Globals
                                                              .getWidth(4)),
                                                      height:
                                                      Globals.getWidth(42),
                                                      width:
                                                      Globals.getWidth(42),
                                                      child: Image.asset(
                                                        'assets/images/left_panel/profile-image2.png',
                                                        height:
                                                        Globals.getWidth(
                                                            34),
                                                        width: Globals.getWidth(
                                                            34),
                                                      ),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          shape:
                                                          BoxShape.circle),
                                                    )),
                                                Positioned(
                                                    top: Globals.getHeight(123),
                                                    left: Globals.getWidth(14),
                                                    child: Text(
                                                      'Event Name',
                                                      style: GoogleFonts.montserrat(
                                                          color: Colors.white,
                                                          letterSpacing: 2.0,
                                                          fontSize:
                                                          Globals.getFontSize(12),
                                                          fontWeight: FontWeight.w600),
                                                    )),
                                                Positioned(
                                                  child:  Column(
                                                    children: [
                                                      Container(
                                                        width: Globals.width,
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Container(
                                                              width: Globals.getWidth(20),
                                                              height: Globals.getHeight(20),
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          'assets/images/time_icon.png'),
                                                                      fit: BoxFit.contain)),
                                                            ),
                                                            SizedBox(width: Globals.getWidth(5.78),),
                                                            Text(
                                                              '05PM to 06PM ',
                                                              style: GoogleFonts.montserrat(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: Globals.getFontSize(12)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),

                                                      SizedBox(height: 7,),
                                                      Container(
                                                        width: Globals.width,
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Container(
                                                              width: Globals.getWidth(12),
                                                              height: Globals.getHeight(12),
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          'assets/images/calendar_icon.png'),
                                                                      fit: BoxFit.contain)),
                                                            ),
                                                            SizedBox(width: Globals.getWidth(5.78),),
                                                            Text(
                                                              '12th October 2021',
                                                              style: GoogleFonts.montserrat(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: Globals.getFontSize(12)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height: 7,),
                                                      Container(
                                                        width: Globals.width,
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Container(
                                                              width: Globals.getWidth(15),
                                                              height: Globals.getHeight(15),
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          'assets/images/location_icon.png'),
                                                                      fit: BoxFit.contain)),
                                                            ),
                                                            SizedBox(width: Globals.getWidth(5.78),),
                                                            Text(
                                                              'Andheri, Mumbai',
                                                              style: GoogleFonts.montserrat(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: Globals.getFontSize(12)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                  top: Globals.getHeight(148),
                                                  left: Globals.getWidth(10),
                                                ),
                                                Positioned(
                                                    top: Globals.getHeight(212),
                                                    child: Container(
                                                      height: Globals.getHeight(22),
                                                      width: Globals.getWidth(83),
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: Text(
                                                          'Rs. 600/person',
                                                          style: GoogleFonts.montserrat(
                                                              fontSize: Globals.getFontSize(8),
                                                              fontWeight: FontWeight.w400,
                                                              color: Colors.white),
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(Globals.getWidth(8.57)),
                                                          color: Color(0xFF1ECFCC)),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: Globals.getHeight(243),
                                            width: Globals.getWidth(171),
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    Globals.getWidth(10))),
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Positioned(
                                                  top: Globals.getHeight(8),
                                                  child: Container(
                                                    height:
                                                    Globals.getHeight(95),
                                                    width:
                                                    Globals.getWidth(155),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(Globals
                                                            .getWidth(
                                                            10)),
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/images/match_back.png'),
                                                            fit: BoxFit.cover)),
                                                    child: Center(
                                                      child: Image.asset(
                                                        'assets/images/cricket_generic.png',
                                                        height:
                                                        Globals.getWidth(
                                                            61),
                                                        width: Globals.getWidth(
                                                            61),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                    top: Globals.getHeight(73),
                                                    right: Globals.getWidth(15),
                                                    child: Container(
                                                      padding:
                                                      EdgeInsets.symmetric(
                                                          horizontal:
                                                          Globals
                                                              .getWidth(
                                                              4),
                                                          vertical: Globals
                                                              .getWidth(4)),
                                                      height:
                                                      Globals.getWidth(42),
                                                      width:
                                                      Globals.getWidth(42),
                                                      child: Image.asset(
                                                        'assets/images/left_panel/profile_image.png',
                                                        height:
                                                        Globals.getWidth(
                                                            34),
                                                        width: Globals.getWidth(
                                                            34),
                                                      ),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          shape:
                                                          BoxShape.circle),
                                                    )),
                                                Positioned(
                                                    top: Globals.getHeight(123),
                                                    left: Globals.getWidth(14),
                                                    child: Text(
                                                      'Event Name',
                                                      style: GoogleFonts.montserrat(
                                                          color: Colors.white,
                                                          letterSpacing: 2.0,
                                                          fontSize:
                                                          Globals.getFontSize(12),
                                                          fontWeight: FontWeight.w600),
                                                    )),
                                                Positioned(
                                                  child:  Column(
                                                    children: [
                                                      Container(
                                                        width: Globals.width,
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Container(
                                                              width: Globals.getWidth(20),
                                                              height: Globals.getHeight(20),
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          'assets/images/time_icon.png'),
                                                                      fit: BoxFit.contain)),
                                                            ),
                                                            SizedBox(width: Globals.getWidth(5.78),),
                                                            Text(
                                                              '05PM to 06PM ',
                                                              style: GoogleFonts.montserrat(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: Globals.getFontSize(12)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),

                                                      SizedBox(height: 7,),
                                                      Container(
                                                        width: Globals.width,
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Container(
                                                              width: Globals.getWidth(12),
                                                              height: Globals.getHeight(12),
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          'assets/images/calendar_icon.png'),
                                                                      fit: BoxFit.contain)),
                                                            ),
                                                            SizedBox(width: Globals.getWidth(5.78),),
                                                            Text(
                                                              '12th October 2021',
                                                              style: GoogleFonts.montserrat(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: Globals.getFontSize(12)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height: 7,),
                                                      Container(
                                                        width: Globals.width,
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Container(
                                                              width: Globals.getWidth(15),
                                                              height: Globals.getHeight(15),
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          'assets/images/location_icon.png'),
                                                                      fit: BoxFit.contain)),
                                                            ),
                                                            SizedBox(width: Globals.getWidth(5.78),),
                                                            Text(
                                                              'Andheri, Mumbai',
                                                              style: GoogleFonts.montserrat(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: Globals.getFontSize(12)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                  top: Globals.getHeight(148),
                                                  left: Globals.getWidth(10),
                                                ),
                                                Positioned(
                                                    top: Globals.getHeight(212),
                                                    child: Container(
                                                      height: Globals.getHeight(22),
                                                      width: Globals.getWidth(83),
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: Text(
                                                          'Rs. 600/person',
                                                          style: GoogleFonts.montserrat(
                                                              fontSize: Globals.getFontSize(8),
                                                              fontWeight: FontWeight.w400,
                                                              color: Colors.white),
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(Globals.getWidth(8.57)),
                                                          color: Color(0xFF1ECFCC)),
                                                    )),
                                              ],
                                            ),
                                          ),

                                        ],
                                      ),
                                    ],
                                  ):null),
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

// My Sql
// Maria Db
// Ms Server
// Oracle 19c
// Postgres
// Neo4j
// Cassandra
