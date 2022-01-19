import 'package:firebase_auth/firebase_auth.dart' as fAuth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/services/auth/auth.dart';
import 'package:project7_2/view/home_screen/home_screen.dart';
import 'package:project7_2/view/new_ui/left_side_navigation/teams.dart';
import 'package:project7_2/view/new_ui/left_side_navigation/venue_bookings.dart';
import 'package:project7_2/view/new_ui/onboarding/account_created.dart';
import 'package:project7_2/view/new_ui/onboarding/fill.dart';
import 'package:project7_2/view/new_ui/onboarding/forgot_password.dart';
import 'package:project7_2/view/new_ui/onboarding/gender.dart';
import 'package:project7_2/view/new_ui/onboarding/invite.dart';
import 'package:project7_2/view/new_ui/onboarding/login.dart';
import 'package:project7_2/view/new_ui/onboarding/loginSocial.dart';
import 'package:project7_2/view/new_ui/onboarding/signup.dart' as s;
import 'package:project7_2/view/new_ui/onboarding/otp_login.dart';
import 'package:project7_2/view/new_ui/onboarding/phone_login.dart';
import 'package:project7_2/view/new_ui/onboarding/pick_intrests.dart';
import 'package:project7_2/view/new_ui/onboarding/position.dart';
import 'package:project7_2/view/new_ui/onboarding/signup.dart';
import 'package:project7_2/view/new_ui/onboarding/splash.dart';
import 'package:project7_2/view/new_ui/onboarding/sport.dart';
import 'package:project7_2/view/new_ui/onboarding/teams.dart';
import 'package:project7_2/view/new_ui/onboarding/validate_password.dart';
import 'package:project7_2/view/new_ui/onboarding/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Paint.enableDithering = true;
  await Firebase.initializeApp();
  SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
  bool res = _sharedPreferences.getBool('firstRun');
  if(!(res!=null)){
    Globals.isFirstRun = true;
    _sharedPreferences.setBool('firstRun', false);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        Globals.height = constraints.maxHeight;
        Globals.width = constraints.maxWidth;
        return MaterialApp(
            title: 'OnField',
            theme: ThemeData(
              primarySwatch: Colors.lightBlue,
            ),
            home:
            StreamBuilder(
              stream: auth.authStateChanges(),
              builder: (context, snapshot) {

                if (snapshot.hasData) {
                  fAuth.User u = snapshot.data;
                  Globals.uid = u.uid;
                  Globals.name = u.displayName;
                  print(u.uid);
                  Globals.hasLogin = true;
                }
                return SplashScreen();
              },
            )
        );
      });
    });
  }
}
