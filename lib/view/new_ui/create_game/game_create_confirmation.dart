import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project7_2/custom/dropdown_calendar/drop_down_calendar.dart';
import 'package:project7_2/custom/drop_down/custom_drop_down.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/model/interests.dart';
import 'package:project7_2/view/new_ui/create_game/create_game_event.dart';
import 'package:project7_2/view/new_ui/create_game/game_listing_confirmation.dart';
import 'package:project7_2/view/new_ui/create_game/pick_positions.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class GameCreateConfirmation extends StatefulWidget {
  @override
  _GameCreateConfirmationState createState() => _GameCreateConfirmationState();
}

class _GameCreateConfirmationState extends State<GameCreateConfirmation>{
  List<String> texts = [];
  List<String> icons = [];

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_5Iq04OCjzXHNrd',
      'amount': 2200,
      'name': 'Arpit',
      'description': 'Payment',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }


  var _razorpay;
  @override
  void initState() {
    texts.add(Globals.numberOfPlayers + ' Players');
    texts.add(Globals.time);
    texts.add(Globals.location);
    texts.add(Globals.date);
    texts.add(Globals.sport);
    texts.add(!Globals.publicEvent?'Private Event':'Public Event');
    icons.add('assets/images/onboarding/person_team.png');
    icons.add('assets/images/onboarding/watch.png');
    icons.add('assets/images/onboarding/location_pin.png');
    icons.add('assets/images/onboarding/calendar.png');
    icons.add('assets/images/onboarding/sport_football.png');
    icons.add('assets/images/onboarding/field.png');
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('success');
    // Do something when payment succeeds
    Navigator.of(context).pushReplacement(PageTransition(
            type: PageTransitionType.rightToLeft,
            child: GameListingConfirmation(),
            duration: new Duration(milliseconds: 300),
            curve: Curves.easeInOut));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('error');
    print(response.message);
    Navigator.of(context).pushReplacement(PageTransition(
            type: PageTransitionType.rightToLeft,
            child: GameListingConfirmation(),
            duration: new Duration(milliseconds: 300),
            curve: Curves.easeInOut));

    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('failed');
    Navigator.of(context).pushReplacement(PageTransition(
            type: PageTransitionType.rightToLeft,
            child: GameListingConfirmation(),
            duration: new Duration(milliseconds: 300),
            curve: Curves.easeInOut));

    // Do something when an external wallet was selected
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: Globals.getHeight(1000),
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
                  height: Globals.getHeight(1250),
                  width: Globals.width,
                ),
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
                    'Summary',
                    style: GoogleFonts.montserrat(
                        fontSize: Globals.getFontSize(26),
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  top: Globals.getHeight(394),
                ),
                Positioned(
                  child: Container(
                    child: Column(
                      children: List.generate(6, (index){
                        return Container(
                          width: Globals.width,
                          margin: EdgeInsets.symmetric(vertical: Globals.getHeight(20)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: Globals.getWidth(30),),
                              Container(
                                width: Globals.getWidth(30),
                                height: Globals.getHeight(30),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            icons[index]),
                                        fit: BoxFit.contain)),
                              ),
                              SizedBox(width: Globals.getWidth(58.78),),
                              Text(
                                texts[index],
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: Globals.getFontSize(20)),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                          width: Globals.width,
                          height: Globals.getHeight(550),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Globals.getWidth(8.57)),
                    ),
                  ),
                  top: Globals.getHeight(423),
                ),
                Positioned(
                    bottom: Globals.getHeight(100),
                    child: Container(
                      height: Globals.getHeight(50),
                      width: Globals.getWidth(185),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: CreateGameEvent(),
                              duration: new Duration(milliseconds: 300),
                              curve: Curves.easeInOut));
                        },
                        child: Text(
                          'Edit',
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
                Positioned(
                    bottom: Globals.getHeight(26),
                    child: Container(
                      height: Globals.getHeight(50),
                      width: Globals.getWidth(185),
                      child: TextButton(
                        onPressed: () {
                          print('trans');
                          openCheckout();
                          // Navigator.of(context).pushReplacement(PageTransition(
                          //     type: PageTransitionType.rightToLeft,
                          //     child: GameListingConfirmation(),
                          //     duration: new Duration(milliseconds: 300),
                          //     curve: Curves.easeInOut));
                        },
                        child: Text(
                          'Create Game',
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
