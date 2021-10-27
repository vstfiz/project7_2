import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/database/firebase.dart';
import 'package:project7_2/view/find_places/find_places.dart';
import 'package:toast/toast.dart';

class AddDetails extends StatefulWidget {

  _AddDetailsState createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  String sport;
  String team;
  String position;
  String experience;
  String rating;


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


  @override
  Widget build(BuildContext context) {
    double h = Globals.height;
    double w = Globals.width;
    return WillPopScope(
        child: Scaffold(
            backgroundColor: Colors.grey[300],
            body: ListView(
                scrollDirection: Axis.vertical,
                children:[Container(
                  width: w,
                  child:  Stack(
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
                        child: Text('Hi, tell us a little \nbit about \nyourself',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 40)),
                      ),
                      Positioned(
                        child: Container(
                          height: 100,
                          width: w * 0.9,
                          padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),),

                          child: Row(
                            children: [
                              Text('Favorite Sports :            ',style: TextStyle(fontSize: 18),),
                              DropdownButton<String>(
                                icon: Icon(Icons.arrow_drop_down),
                                value: sport,
                                hint: Text(
                                  "          ",
                                  style: TextStyle(
                                      fontFamily: "Livvic",
                                      fontSize: 17,
                                      color: Colors
                                          .grey[650]),
                                ),
                                iconSize: 24,
                                elevation: 16,
                                style:
                                TextStyle(fontFamily: "Livvic",
                                    color: Colors
                                        .black),
                                onChanged: (String newValue) {
                                  setState(() {
                                    sport = newValue;
                                    print(newValue);
                                  });
                                },
                                items: <String>['Football', 'Cricket', 'Baseball' , 'Polo' , 'Tennis' , 'Rugby']
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value, style: TextStyle(
                                        color:  Colors
                                            .black,fontSize: 18),),
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                        ),
                        top: 220,
                        left: w * 0.05,
                      ),
                      Positioned(
                        child: Container(
                            height: h * 0.05,
                            width: w * 0.9,
                            padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),

                            child:  Row(
                              children: [
                                Text('Favorite Team :            ',style: TextStyle(fontSize: 18),),
                                DropdownButton<String>(
                                  icon: Icon(Icons.arrow_drop_down),
                                  value: team,
                                  hint: Text(
                                    "          ",
                                    style: TextStyle(
                                        fontFamily: "Livvic",
                                        fontSize: 17,
                                        color: Colors
                                            .grey[650]),
                                  ),
                                  iconSize: 24,
                                  elevation: 16,
                                  style:
                                  TextStyle(fontFamily: "Livvic",
                                      color: Colors
                                          .black),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      team = newValue;
                                      print(newValue);
                                    });
                                  },
                                  items: <String>['Team 1', 'Team 2', 'Team 3', 'Team 4', 'Team 5']
                                      .map<DropdownMenuItem<String>>((String value1) {
                                    return DropdownMenuItem<String>(
                                      value: value1,
                                      child: Text(value1, style: TextStyle(
                                          color:  Colors
                                              .black,fontSize: 18),),
                                    );
                                  }).toList(),
                                )
                              ],
                            )
                        ),
                        top:  340 ,
                        left: w * 0.05,
                      ),
                      Positioned(
                        child: Container(
                            height: 100,
                            width: w * 0.9,
                            padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),

                            child:  Row(
                              children: [
                                Text('Position :            ',style: TextStyle(fontSize: 18),),
                                DropdownButton<String>(
                                  icon: Icon(Icons.arrow_drop_down),
                                  value: position,
                                  hint: Text(
                                    "          ",
                                    style: TextStyle(
                                        fontFamily: "Livvic",
                                        fontSize: 17,
                                        color: Colors
                                            .grey[650]),
                                  ),
                                  iconSize: 24,
                                  elevation: 16,
                                  style:
                                  TextStyle(fontFamily: "Livvic",
                                      color: Colors
                                          .black),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      position = newValue;
                                      print(newValue);
                                    });
                                  },
                                  items: <String>['Position 1', 'Position 2', 'Position 3', 'Position 4', 'Position 5']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value, style: TextStyle(
                                          color:  Colors
                                              .black,fontSize: 18),),
                                    );
                                  }).toList(),
                                )
                              ],
                            )
                        ),
                        top: 460,
                        left: w * 0.05,
                      ),
                      Positioned(
                        child: Container(
                            height:100,
                            width: w * 0.9,
                            padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),

                            child:  Row(
                              children: [
                                Text('Experience :            ',style: TextStyle(fontSize: 18),),
                                DropdownButton<String>(
                                  icon: Icon(Icons.arrow_drop_down),
                                  value: experience,
                                  hint: Text(
                                    "          ",
                                    style: TextStyle(
                                        fontFamily: "Livvic",
                                        fontSize: 17,
                                        color: Colors
                                            .grey[650]),
                                  ),
                                  iconSize: 24,
                                  elevation: 16,
                                  style:
                                  TextStyle(fontFamily: "Livvic",
                                      color: Colors
                                          .black),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      experience = newValue;
                                      print(newValue);
                                    });
                                  },
                                  items: <String>['1 Year', '2 Years', '3 Years', '4 Years', '5 Years']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value, style: TextStyle(
                                          color:  Colors
                                              .black,fontSize: 18),),
                                    );
                                  }).toList(),
                                )
                              ],
                            )
                        ),
                        top: 580,
                        left: w * 0.05,
                      ),
                      Positioned(
                        child: Container(
                            height:100,
                            width: w * 0.9,
                            padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),

                            child: Row(
                              children: [
                                Text('Skill Rating :            ',style: TextStyle(fontSize: 18),),
                                DropdownButton<String>(
                                  icon: Icon(Icons.arrow_drop_down),
                                  value: rating,
                                  hint: Text(
                                    "          ",
                                    style: TextStyle(
                                        fontFamily: "Livvic",
                                        fontSize: 17,
                                        color: Colors
                                            .grey[650]),
                                  ),
                                  iconSize: 24,
                                  elevation: 16,
                                  style:
                                  TextStyle(fontFamily: "Livvic",
                                      color: Colors
                                          .black),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      rating = newValue;
                                      print(newValue);
                                    });
                                  },
                                  items: <String>['1', '2', '3', '4', '5','6','7','8','9','10']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value, style: TextStyle(
                                          color:  Colors
                                              .black,fontSize: 18),),
                                    );
                                  }).toList(),
                                )
                              ],
                            )
                        ),
                        top: 700,
                        left: w * 0.05,
                      ),
                      Positioned(
                          top: 820,
                          child: Container(
                            height: h * 0.05,
                            width: w * 0.9,
                            color: Colors.green,
                            child: TextButton(
                              onPressed: () async {
                                _loadingDialog('Updating Data');
                                try{
                                  await FirebaseDB.addUserData(sport!=null?sport:'', team!=null?team:'', position!=null?position:'', experience!=null?experience:'', rating!=null?rating:'', context);
                                  Navigator.pop(context);
                                  Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context){
                                    return FindPLaces();
                                  }));
                                }
                                catch(e){
                                  Navigator.pop(context);
                                  Toast.show(e.message,context);
                                }
                              },
                              child:
                              Text('Next', style: TextStyle(color: Colors.white)),
                            ),
                          )),
                      Positioned(
                          top: 890,
                          child: Container(
                            height: h * 0.05,
                            width: w * 0.9,
                            color: Colors.grey,
                            child: TextButton(
                              onPressed: () async {
                                _loadingDialog('Updating Data');
                                try{
                                  print('part 1');
                                  await FirebaseDB.addUserData('','','','','', context);
                                  Navigator.pop(context);
                                  Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context){
                                    return FindPLaces();
                                  }));
                                }
                                catch(e){
                                  Navigator.pop(context);
                                }
                              },
                              child:
                              Text('Skip', style: TextStyle(color: Colors.white)),
                            ),
                          )),
                    ],
                  ),
                ),]
              ),
            ),
        onWillPop: () {
          return Future.value(false);
        });
  }
}
