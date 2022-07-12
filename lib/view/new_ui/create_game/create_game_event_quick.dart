import 'dart:async';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:place_picker/entities/location_result.dart';
import 'package:place_picker/place_picker.dart';
import 'package:place_picker/widgets/place_picker.dart';
import 'package:project7_2/custom/dropdown_calendar/drop_down_calendar.dart';
import 'package:project7_2/custom/drop_down/custom_drop_down.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/utils/constants.dart';
import 'package:project7_2/view/new_ui/create_game/create_game_event.dart';
import 'package:project7_2/view/new_ui/create_game/find_invite_friend.dart';

import '../../../custom/calendar/calendar.dart';
import '../../../custom/calendar/event.dart';
import 'game_create_confirmation.dart';

class CreateGameEventQuick extends StatefulWidget {
  @override
  _CreateGameEventQuickState createState() => _CreateGameEventQuickState();
}

class _CreateGameEventQuickState extends State<CreateGameEventQuick>
    with SingleTickerProviderStateMixin {
  TextEditingController _numberOfPlayer = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _durationController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TabController _tabController;
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
  var venues = [
    'Loyola Artificial Football Court',
    'MMFC Football Turf',
    'HotFut',
    'Freekick-The Football Factory',
    'Sports Galaxy Tilekar Sports',
    'Goal Arena Football And Futsal Turf',
    'Metrocity Sports Club',
    'The Arena 5A Side Football Turf'
  ];
  List<String> slots = [];
  String selectedSport = 'Select';
  String selectedSlot = 'Select';
  int charactersRemaining = 200;
  String _widthUnit = 'mins';
  bool isNewVenue = false;

  // Future<void> _modeChooserDialog(){
  //   showDialog(context: context,barrierDismissible: false, builder: (context){
  //     return ClipRect(
  //       child: BackdropFilter(
  //         filter: ImageFilter.blur(
  //           sigmaX: 20.0,
  //           sigmaY: 20.0,
  //         ),
  //         child: AlertDialog(
  //           backgroundColor: Colors.black87.withOpacity(0.5),
  //           content: Container(
  //             height: Globals.height * 0.2,
  //             width: Globals.width * 0.8,
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: [
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   children: [
  //                     Icon(Icons.person,size: 18,color: Colors.white,),
  //                     GestureDetector(
  //                       onTap: (){
  //
  //                         Navigator.pop(context);
  //                       },
  //                       child: Text(
  //                         'Player with Friends',
  //                         style: GoogleFonts.montserrat(
  //                             color: Colors.white,
  //                             fontSize: Globals.getFontSize(15),
  //                             fontWeight: FontWeight.w500),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   children: [
  //                     Icon(Icons.group,size: 18,color: Colors.white,),
  //                     GestureDetector(
  //                       onTap: (){
  //
  //                         Navigator.pop(context);
  //                       },
  //                       child: Text(
  //                         'Team vs Team',
  //                         style: GoogleFonts.montserrat(
  //                             color: Colors.white,
  //                             fontSize: Globals.getFontSize(15),
  //                             fontWeight: FontWeight.w500),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ) ,
  //           ),
  //         ),
  //       ),
  //     );
  //   });
  // }
  TimeOfDay time = TimeOfDay.now();

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    for (int i = 1; i < 23; i++) {
      slots.add(i.toString() + ':30 - ' + (i + 1).toString() + ':30');
    }
    // getMode();
    _locationController.text = 'Select';
    super.initState();
  }

  //
  // getMode(){
  //   Timer t = Timer(Duration(seconds: 1),(){
  //     _modeChooserDialog();
  //
  //   });
  // }

  _selectTime(BuildContext context) async {
    final TimeOfDay timeOfDay = await showTimePicker(
      context: context,
      initialTime: time,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null) {
      setState(() {
        time = timeOfDay;
        selectedSlot = time.hour.toString() + ':' + time.minute.toString();
      });
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  String placePicked = 'Search Location';

  void showPlacePicker() async {
    Position customLocation = (await _determinePosition());
    LocationResult result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PlacePicker(
              Constants.mapsApiKey,
              displayLocation:
                  LatLng(customLocation.latitude, customLocation.longitude),
            )));

    // Handle the result in your way
    // setState(() {
    //   placePicked = result.formattedAddress;
    // });
    print("reuslt is " + result.toString());
  }

  DateTime _currentDate = DateTime.now();
  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.white, width: 2.0)),
    child: new Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {},
  );
  String selectedDate = 'Select';
  String privacyValue;
  String venueType;
  String gameMode;
  String selectedVenue = 'Select';

  Future<void> _selectSlotsDialog(slots) {
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
                      setState(() {});
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Okay',
                      style: GoogleFonts.montserrat(color: Colors.white),
                    ),
                  ),
                ],
                content: Container(
                  height: Globals.height * 0.15,
                  width: Globals.width * 0.8,
                  child: CarouselSlider(
                    options: CarouselOptions(height: 400.0),
                    items: slots.map<Widget>((slot) {
                      selectedSlot = slot;
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    slot,
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: Globals.getFontSize(22),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    'Rs. 500',
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: Globals.getFontSize(15),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ));
                        },
                      );
                    }).toList(),
                  ),
                  // child: ListView(
                  //   children: List.generate(slots.length, (index) {
                  //     return (slots.length-1==index)?Container(
                  //       width: Globals.width * 0.8,
                  //       height: Globals.getHeight(60),
                  //       decoration: BoxDecoration(
                  //         // color: Color(0xFF231F20),
                  //       ),
                  //       child: GestureDetector(
                  //         onTap: () {
                  //           setState(() {
                  //             selectedSlot = slots[index];
                  //             _durationController = TextEditingController(text: '60 mins');
                  //           });
                  //           Navigator.pop(context);
                  //         },
                  //         child: Stack(
                  //           alignment: Alignment.center,
                  //           children: [
                  //             Positioned(
                  //               child: Container(
                  //                 width: Globals.width * 0.8,
                  //                 padding: EdgeInsets.symmetric(
                  //                   horizontal: 20.0,
                  //                 ),
                  //                 child: Column(
                  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   children: [
                  //                     Text(
                  //                       slots[index],
                  //                       style: GoogleFonts.montserrat(
                  //                           color: Colors.white,
                  //                           fontSize: Globals.getFontSize(15),
                  //                           fontWeight: FontWeight.w500),
                  //                     ),
                  //                     Text(
                  //                       'Rs. 500',
                  //                       style: GoogleFonts.montserrat(
                  //                           color: Colors.white,
                  //                           fontSize: Globals.getFontSize(15),
                  //                           fontWeight: FontWeight.w500),
                  //                     ),
                  //                   ],
                  //                 )
                  //               ),
                  //               left: 0.0,
                  //             ),
                  //             Positioned(
                  //               child: Container(
                  //                   height: 20,
                  //                   width: 20,
                  //                   decoration: BoxDecoration(
                  //                       shape: BoxShape.circle,
                  //                       border: Border.all(
                  //                           color: Colors.white, width: 0.599)),
                  //                   child: slots[index] == selectedSlot
                  //                       ? Center(
                  //                     child: CircleAvatar(
                  //                       radius: 7,
                  //                       foregroundColor: Color(0xFF7585FF),
                  //                     ),
                  //                   )
                  //                       : SizedBox()),
                  //               right: 20,
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //     ):Container(
                  //       width: Globals.width * 0.8,
                  //       height: Globals.getHeight(60),
                  //       decoration: BoxDecoration(
                  //         border: Border(
                  //             bottom: BorderSide(
                  //                 color: Colors.white.withOpacity(0.5),
                  //                 width: 0.5)),
                  //       ),
                  //       child: GestureDetector(
                  //         onTap: () {
                  //           setState(() {
                  //             selectedSlot = slots[index];
                  //           });
                  //           Navigator.pop(context);
                  //         },
                  //         child: Stack(
                  //           alignment: Alignment.center,
                  //           children: [
                  //             Positioned(
                  //               child: Container(
                  //                 width: Globals.width * 0.8 ,
                  //                 padding: EdgeInsets.symmetric(
                  //                   horizontal: 20.0,
                  //                 ),
                  //                 child: Text(
                  //                   slots[index],
                  //                   style: GoogleFonts.montserrat(
                  //                       color: Colors.white,
                  //                       fontSize: Globals.getFontSize(15),
                  //                       fontWeight: FontWeight.w500),
                  //                 ),
                  //               ),
                  //               left: 0.0,
                  //             ),
                  //             Positioned(
                  //               child: Container(
                  //                   height: 20,
                  //                   width: 20,
                  //                   decoration: BoxDecoration(
                  //                       shape: BoxShape.circle,
                  //                       border: Border.all(
                  //                           color: Colors.white, width: 0.599)),
                  //                   child: slots[index] == selectedSlot
                  //                       ? Center(
                  //                     child: CircleAvatar(
                  //                       radius: 7,
                  //                       foregroundColor: Color(0xFF7585FF),
                  //                     ),
                  //                   )
                  //                       : SizedBox()),
                  //               right: 20,
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //     );
                  //   }),
                  // ) ,
                ),
              ),
            ),
          );
        });
  }

  Future<void> _selectVenueDialog(venue) {
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
                    children: List.generate(venues.length, (index) {
                      return (venues.length - 1 == index)
                          ? Container(
                              width: Globals.width * 0.8,
                              height: Globals.getHeight(60),
                              decoration: BoxDecoration(
                                  // color: Color(0xFF231F20),
                                  ),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedVenue = venues[index];
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
                                          venues[index],
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
                                          child: venues[index] == selectedVenue
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
                                    selectedVenue = venues[index];
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
                                          venues[index],
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
                                          child: venues[index] == selectedVenue
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

  Future<void> _selectDateDialog() {
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
                        selectedDate = date.day.toString() +
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: Globals.getHeight(1050),
        width: Globals.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black, Color(0xFF7585FF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: Globals.getHeight(1050),
              width: Globals.width,
            ),
            Positioned(
              top: Globals.getHeight(70),
              right: Globals.getWidth(20),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.clear,
                  size: Globals.getWidth(25),
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
                top: Globals.getHeight(70),
                left: Globals.getWidth(20),
                child: Row(
                  children: [
                    Switch(
                        activeTrackColor: Colors.white,
                        activeColor: Colors.pink,
                        inactiveTrackColor: Colors.white.withOpacity(0.5),
                        value: Globals.quickMode,
                        onChanged: (value) {
                          setState(() {
                            Globals.quickMode = value;
                          });
                          if (Globals.quickMode) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) {
                                  return CreateGameEventQuick();
                                }));
                          } else {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) {
                              return CreateGameEvent();
                            }));
                          }
                        }),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      Globals.quickMode ? 'Quick Mode' : 'Advanced Mode',
                      style: GoogleFonts.montserrat(
                          fontSize: Globals.getFontSize(15),
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )),
            Positioned(
                top: Globals.getHeight(108),
                child: Container(
                  width: Globals.getWidth(268),
                  height: Globals.getHeight(268),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/onboarding/layer.png'),
                          fit: BoxFit.contain)),
                )),
            Positioned(
                top: Globals.getHeight(125),
                child: Container(
                  width: Globals.getWidth(238),
                  height: Globals.getHeight(235),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/onboarding/layer_2.png'),
                          fit: BoxFit.scaleDown)),
                )),
            Positioned(
                top: Globals.getHeight(141),
                child: Opacity(
                  child: Container(
                    width: Globals.getWidth(200),
                    height: Globals.getHeight(200),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/onboarding/layer_3.png'),
                            fit: BoxFit.scaleDown),
                        backgroundBlendMode: BlendMode.overlay),
                  ),
                  opacity: 0.2861,
                )),
            Positioned(
                top: Globals.getHeight(170),
                child: Container(
                  width: Globals.getWidth(166),
                  height: Globals.getHeight(140),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/onboarding/field.png'),
                          fit: BoxFit.scaleDown)),
                )),
            Positioned(
              child: Text(
                'Creating Game Event',
                style: GoogleFonts.montserrat(
                    fontSize: Globals.getFontSize(26),
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              top: Globals.getHeight(390),
            ),

            Positioned(
              child: Text(
                'Select Game',
                style: GoogleFonts.montserrat(
                    fontSize: Globals.getFontSize(16),
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              top: Globals.getHeight(470),
            ),
            Positioned(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
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
                              fontSize: Globals.getFontSize(15),
                              fontWeight: FontWeight.w500),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        )
                      ],
                    )),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Globals.getWidth(8.57)),
                    border: Border.all(color: Color(0xFF4C5FEF)),
                    color: Color(0xFF231F20)),
                height: Globals.getHeight(45.73),
                width: Globals.getWidth(383),
              ),
              top: Globals.getHeight(505),
            ),
            Positioned(
              child: Text(
                'Select from Available Venues',
                style: GoogleFonts.montserrat(
                    fontSize: Globals.getFontSize(16),
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              top: Globals.getHeight(580),
            ),
            Positioned(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: TextButton(
                    onPressed: () {
                            _selectVenueDialog(venues);
                          },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedVenue,
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: Globals.getFontSize(15),
                              fontWeight: FontWeight.w500),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        )
                      ],
                    )),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Globals.getWidth(8.57)),
                    border: Border.all(color: Color(0xFF4C5FEF)),
                    color: Color(0xFF231F20)),
                height: Globals.getHeight(45.73),
                width: Globals.getWidth(383),
              ),
              top: Globals.getHeight(615),
            ),
            Positioned(
              child: Text(
                'Select Date',
                style: GoogleFonts.montserrat(
                    fontSize: Globals.getFontSize(16),
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              top: Globals.getHeight(690),
            ),
            Positioned(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: TextButton(
                    onPressed: () {
                      _selectDateDialog();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedDate,
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: Globals.getFontSize(15),
                              fontWeight: FontWeight.w500),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        )
                      ],
                    )),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Globals.getWidth(8.57)),
                    border: Border.all(color: Color(0xFF4C5FEF)),
                    color: Color(0xFF231F20)),
                height: Globals.getHeight(45.73),
                width: Globals.getWidth(383),
              ),
              top: Globals.getHeight(725),
            ),
            Positioned(
              child: Text(
                'Select Time Slots',
                style: GoogleFonts.montserrat(
                    fontSize: Globals.getFontSize(16),
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              top: Globals.getHeight(800),
            ),
            Positioned(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: TextButton(
                    onPressed: isNewVenue
                        ? () {
                            _selectTime(context);
                          }
                        : () {
                            _selectSlotsDialog(slots);
                          },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedSlot,
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: Globals.getFontSize(15),
                              fontWeight: FontWeight.w500),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        )
                      ],
                    )),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Globals.getWidth(8.57)),
                    border: Border.all(color: Color(0xFF4C5FEF)),
                    color: Color(0xFF231F20)),
                height: Globals.getHeight(45.73),
                width: Globals.getWidth(383),
              ),
              top: Globals.getHeight(835),
            ),





            Positioned(
                top: Globals.getHeight(940),
                child: Container(
                  height: Globals.getHeight(50),
                  width: Globals.getWidth(185),
                  child: TextButton(
                    onPressed: () {
                      Globals.numberOfPlayers = _numberOfPlayer.text ?? '';
                      Globals.sport = selectedSport;
                      Globals.location = selectedVenue;
                      Globals.time = selectedSlot;
                      Globals.date = selectedDate;
                      Navigator.of(context).pushReplacement(PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: GameCreateConfirmation(),
                          duration: new Duration(milliseconds: 300),
                          curve: Curves.easeInOut));
                    },
                    child: Text(
                      'Next',
                      style: GoogleFonts.montserrat(
                          fontSize: Globals.getFontSize(16),
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius:
                          BorderRadius.circular(Globals.getWidth(48))),
                )),
          ],
        ),
      ),
    ));
  }
}

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer t = new Timer(Duration(seconds: 2), () {
      Navigator.pop(context);
    });
    return WillPopScope(
        child: Scaffold(
          backgroundColor: Colors.black.withOpacity(0.5),
          body: Center(
            child: Container(
              width: 100,
              height: 100,
              child: Image.asset(
                "assets/images/Loader.gif",
                height: 100.0,
                width: 100.0,
              ),
            ),
          ),
        ),
        onWillPop: () {
          return Future.value(false);
        });
  }
}
