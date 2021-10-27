import 'package:firebase_auth/firebase_auth.dart' as fAuth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/services/auth/auth.dart';
import 'package:project7_2/view/auth/signin.dart';
import 'package:project7_2/view/home_screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        Globals.height = constraints.maxHeight;
        Globals.width = constraints.maxWidth;
        print(Globals.height);
        print(Globals.width);
        return MaterialApp(
            title: 'Pitch Stories',
            theme: ThemeData(
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
                  if (u.emailVerified) {
                    return HomeScreen();
                  } else {
                    if (u.isAnonymous) {
                      return SignIn();
                    } else {
                      return SignIn();
                    }
                  }
                }
                return SignIn();
              },
            ));
      });
    });
  }
}
