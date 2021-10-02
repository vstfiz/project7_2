import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/view/connect/connect.dart';

class RequestPermissions extends StatefulWidget {
  _RequestPermissionsState createState() => _RequestPermissionsState();
}

class _RequestPermissionsState extends State<RequestPermissions> {
  bool locationPermission = false;
  bool cameraPermission = false;
  bool micPermission = false;
  bool contactsPermissions = false;
  bool calendarPermissions = false;

  @override
  void initState() {
    _getPermissions();
    super.initState();
  }

  _getPermissions() async {
    bool perm = await Permission.location.isGranted;
    setState(() {
      locationPermission = perm;
    });
    perm = await Permission.camera.isGranted;
    setState(() {
      cameraPermission = perm;
    });
    perm = await Permission.microphone.isGranted;
    setState(() {
      micPermission = perm;
    });
    perm = await Permission.contacts.isGranted;
    setState(() {
      contactsPermissions = perm;
    });
    perm = await Permission.calendar.isGranted;
    setState(() {
      calendarPermissions = perm;
    });
  }
  @override
  Widget build(BuildContext context) {
    double h = Globals.height;
    double w = Globals.width;
    return WillPopScope(
        child: Scaffold(
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
                    icon: new Image.asset('assets/images/back_flip.png'),
                    iconSize: 40,
                  ),
                  left: w * 0.05,
                  top: h * 0.01,
                ),
                Positioned(
                  top: h * 0.1,
                  left: w * 0.1,
                  child: Text('Access Request',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 40)),
                ),
                Positioned(
                  child: Container(
                      height: h * 0.07,
                      width: w * 0.9,
                      child: Row(
                        children: [
                          Container(
                            child: Icon(
                              Icons.location_on,
                              color: Colors.black,
                              size: 40,
                            ),
                            width: w *0.1,
                          ),
                          SizedBox(
                            width: w *0.3,
                          ),
                          Container(
                            width: w *0.25,
                            height: h *0.05,
                            color: Colors.green,
                            child: TextButton(
                              onPressed: () async{
                                bool status = await Permission.location.request().isGranted;
                                setState(() {
                                  locationPermission = status;
                                });
                              },
                              child: Text(
                                'Allow',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: w *0.15,
                          ),
                          Container(
                            width: w *0.1,
                            child: CupertinoSwitch(
                              value: locationPermission,
                              onChanged: (value) async {
                                print(value);
                                if(value == true) {
                                  bool status = await Permission.location.request().isGranted;
                                    setState(() {
                                      locationPermission = status;
                                    });

                                }
                              },
                            ),
                          )
                        ],
                      )),
                  top: h * 0.3,
                  left: w * 0.05,
                ),
                Positioned(
                  child: Container(
                      height: h * 0.07,
                      width: w * 0.9,
                      child: Row(
                        children: [
                          Container(
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.black,
                              size: 40,
                            ),
                            width: w *0.1,
                          ),
                          SizedBox(
                            width: w *0.3,
                          ),
                          Container(
                            width: w *0.25,
                            height: h *0.05,
                            color: Colors.green,
                            child: TextButton(
                              onPressed: () async{
                                bool status = await Permission.camera.request().isGranted;
                                setState(() {
                                  cameraPermission = status;
                                });
                              },
                              child: Text(
                                'Allow',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: w *0.15,
                          ),
                          Container(
                            width: w *0.1,
                            child: CupertinoSwitch(
                              value: cameraPermission,
                              onChanged: (value) async {
                                print(value);
                                if(value == true) {
                                  bool status = await Permission.camera.request().isGranted;
                                  setState(() {
                                    cameraPermission = status;
                                  });

                                }
                              },
                            ),
                          )
                        ],
                      )),
                  top: h * 0.38,
                  left: w * 0.05,
                ),
                Positioned(
                  child: Container(
                      height: h * 0.07,
                      width: w * 0.9,
                      child: Row(
                        children: [
                          Container(
                            child: Icon(
                              Icons.mic,
                              color: Colors.black,
                              size: 40,
                            ),
                            width: w *0.1,
                          ),
                          SizedBox(
                            width: w *0.3,
                          ),
                          Container(
                            width: w *0.25,
                            height: h *0.05,
                            color: Colors.green,
                            child: TextButton(
                              onPressed: () async{
                                bool status = await Permission.microphone.request().isGranted;
                                setState(() {
                                  micPermission = status;
                                });
                              },
                              child: Text(
                                'Allow',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: w *0.15,
                          ),
                          Container(
                            width: w *0.1,
                            child: CupertinoSwitch(
                              value: micPermission,
                              onChanged: (value) async {
                                print(value);
                                if(value == true) {
                                  bool status = await Permission.microphone.request().isGranted;
                                  setState(() {
                                    micPermission = status;
                                  });

                                }
                              },
                            ),
                          )
                        ],
                      )),
                  top: h * 0.46,
                  left: w * 0.05,
                ),
                Positioned(
                  child: Container(
                      height: h * 0.07,
                      width: w * 0.9,
                      child: Row(
                        children: [
                          Container(
                            child: Icon(
                              Icons.people_outline_rounded,
                              color: Colors.black,
                              size: 40,
                            ),
                            width: w *0.1,
                          ),
                          SizedBox(
                            width: w *0.3,
                          ),
                          Container(
                            width: w *0.25,
                            height: h *0.05,
                            color: Colors.green,
                            child: TextButton(
                              onPressed: () async{
                                bool status = await Permission.contacts.request().isGranted;
                                setState(() {
                                  contactsPermissions = status;
                                });
                              },
                              child: Text(
                                'Allow',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: w *0.15,
                          ),
                          Container(
                            width: w *0.1,
                            child: CupertinoSwitch(
                              value: contactsPermissions,
                              onChanged: (value) async {
                                print(value);
                                if(value == true) {
                                  bool status = await Permission.contacts.request().isGranted;
                                  setState(() {
                                    contactsPermissions = status;
                                  });

                                }
                              },
                            ),
                          )
                        ],
                      )),
                  top: h * 0.54,
                  left: w * 0.05,
                ),
                Positioned(
                  child: Container(
                      height: h * 0.07,
                      width: w * 0.9,
                      child: Row(
                        children: [
                          Container(
                            child: Icon(
                              Icons.calendar_today,
                              color: Colors.black,
                              size: 40,
                            ),
                            width: w *0.1,
                          ),
                          SizedBox(
                            width: w *0.3,
                          ),
                          Container(
                            width: w *0.25,
                            height: h *0.05,
                            color: Colors.green,
                            child: TextButton(
                              onPressed: () async{
                                bool status = await Permission.calendar.request().isGranted;
                                setState(() {
                                  calendarPermissions = status;
                                });
                              },
                              child: Text(
                                'Allow',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: w *0.15,
                          ),
                          Container(
                            width: w *0.1,
                            child: CupertinoSwitch(
                              value: calendarPermissions,
                              onChanged: (value) async {
                                print(value);
                                if(value == true) {
                                  await Permission.calendar.request();
                                  // setState(() {
                                  //   locationPermission = status;
                                  // });

                                }
                              },
                            ),
                          )
                        ],
                      )),
                  top: h * 0.62,
                  left: w * 0.05,
                ),
                Positioned(
                    top: h * 0.75,
                    child: Container(
                      height: h * 0.05,
                      width: w * 0.9,
                      color: Colors.green,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              new MaterialPageRoute(builder: (context) {
                                return Connect();
                              }));
                        },
                        child:
                            Text('Next', style: TextStyle(color: Colors.white)),
                      ),
                    )),
                Positioned(
                    top: h * 0.85,
                    child: Container(
                      height: h * 0.05,
                      width: w * 0.9,
                      color: Colors.grey,
                      child: TextButton(
                        onPressed: () {},
                        child:
                            Text('Skip', style: TextStyle(color: Colors.white)),
                      ),
                    )),
              ],
            )),
        onWillPop: () {
          return Future.value(false);
        });
  }
}
