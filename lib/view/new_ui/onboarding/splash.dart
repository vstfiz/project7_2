import 'dart:async';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/database/firebase.dart';
import 'package:project7_2/view/home_screen/home_screen.dart';
import 'package:project7_2/view/new_ui/onboarding/gender.dart';
import 'package:project7_2/view/new_ui/onboarding/location.dart' as l;


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController scaleController;
  Animation<double> scaleAnimation;

  double _opacity = 0;
  bool _value = true;

  @override
  void initState() {
    super.initState();
    _getUser();
    _finishAnimation();
  }

  _finishAnimation(){

    scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    )..addStatusListener(
          (status) {
        if (status == AnimationStatus.completed) {
          if(Globals.hasLogin){
            if(hasData){
              Navigator.of(context).pushReplacement(
                ThisIsFadeRoute(
                  route: HomeScreen(),
                ),
              );
            }
            else{
              Navigator.of(context).pushReplacement(
                ThisIsFadeRoute(
                  route: SelectGender(),
                ),
              );
            }
          }
          else{
            Navigator.of(context).pushReplacement(
              ThisIsFadeRoute(
                route: HomeScreen(),
              ),
            );
          }
          Timer(
            Duration(milliseconds: 300),
                () {
              scaleController.reset();
            },
          );
        }
      },
    );

    scaleAnimation =
        Tween<double>(begin: 0.0, end: 12).animate(scaleController);

    Timer(Duration(milliseconds: 600), () {
      setState(() {
        _opacity = 1.0;
        _value = false;
      });
    });
    Timer(Duration(milliseconds: 2000), () {
      setState(() {
        scaleController.forward();
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scaleController.dispose();
    super.dispose();
  }

  bool hasData;
  _getUser()async{
    hasData = await FirebaseDB.getUserDetails(Globals.uid, context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
      Center(
        child: AnimatedOpacity(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(seconds: 6),
          opacity: _opacity,
          child: AnimatedContainer(
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(seconds: 2),
            height: _value ? 50 : 200,
            width: _value ? 50 : 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/onboarding/logo.png'),
                    fit: BoxFit.contain)
            ),
            child: Center(

              child: AnimatedBuilder(
                animation: scaleAnimation,
                builder: (c, child) => Transform.scale(
                  scale: scaleAnimation.value,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/onboarding/logo.png'),
                            fit: BoxFit.contain)
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ThisIsFadeRoute extends PageRouteBuilder {
  final Widget page;
  final Widget route;

  ThisIsFadeRoute({this.page, this.route})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        FadeTransition(
          opacity: animation,
          child: route,
        ),
  );
}






