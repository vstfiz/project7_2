import 'package:firebase_auth/firebase_auth.dart' as fAuth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/services/auth/auth.dart';
import 'package:project7_2/view/find_places/3DDrawer.dart';
import 'package:project7_2/view/find_places/find_places.dart';
import 'package:project7_2/view/home_screen/home_screen.dart';
import 'package:project7_2/view/new_ui/bottom_navigation/bottom_navigation.dart';
import 'package:project7_2/view/new_ui/create_game/create_game_event.dart';
import 'package:project7_2/view/new_ui/create_game/create_game_event_quick.dart';
import 'package:project7_2/view/new_ui/create_game/game_create_confirmation.dart';
import 'package:project7_2/view/new_ui/create_game/pick_positions.dart';
import 'package:project7_2/view/new_ui/fields/badminton.dart';
import 'package:project7_2/view/new_ui/fields/basketball.dart';
import 'package:project7_2/view/new_ui/onboarding/splash.dart';
import 'package:project7_2/view/new_ui/right_side_drawer/right_navigation.dart';
import 'package:project7_2/view/new_ui/score_card/score_card.dart';

import 'package:project7_2/view/new_ui/splash/splash.dart';
import 'package:project7_2/view/user_profile/user_profile.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'custom/drop_down/test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Paint.enableDithering = true;
  await Firebase.initializeApp();
  SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
  bool res = _sharedPreferences.getBool('firstRun');
  if (!(res != null)) {
    Globals.isFirstRun = true;
    _sharedPreferences.setBool('firstRun', false);
  }
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  final _timePickerTheme = TimePickerThemeData(
    backgroundColor: Colors.blueGrey,
    hourMinuteShape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      side: BorderSide(color: Colors.orange, width: 4),
    ),
    dayPeriodBorderSide: const BorderSide(color: Colors.orange, width: 4),
    dayPeriodColor: Colors.blueGrey.shade600,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      side: BorderSide(color: Colors.orange, width: 4),
    ),
    dayPeriodTextColor: Colors.white,
    dayPeriodShape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      side: BorderSide(color: Colors.orange, width: 4),
    ),
    hourMinuteColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected)
            ? Colors.orange
            : Colors.blueGrey.shade800),
    hourMinuteTextColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected) ? Colors.white : Colors.orange),
    dialHandColor: Colors.blueGrey.shade700,
    dialBackgroundColor: Colors.blueGrey.shade800,
    hourMinuteTextStyle:
        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    dayPeriodTextStyle:
        const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
    helpTextStyle: const TextStyle(
        fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      contentPadding: EdgeInsets.all(0),
    ),
    dialTextColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected) ? Colors.orange : Colors.white),
    entryModeIconColor: Colors.orange,
  );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        Globals.height = constraints.maxHeight;
        Globals.width = constraints.maxWidth;
        print(Globals.height);
        print(Globals.width);
        // print(MediaQuery.of(context).devicePixelRatio);
        return MaterialApp(
            title: 'OnField',
            theme: ThemeData(
              timePickerTheme: _timePickerTheme,
              primarySwatch: Colors.lightBlue,
            ),
            home: StreamBuilder(
              stream: auth.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  fAuth.User u = snapshot.data;
                  Globals.uid = u.uid;
                  Globals.name = u.displayName;
                  print(u.uid);
                  Globals.hasLogin = true;
                }
                return ScoreCard();
              },
            ));
      });
    });
  }
}
