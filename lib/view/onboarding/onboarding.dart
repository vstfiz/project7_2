import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:language_pickers/language_picker_dropdown.dart';
import 'package:language_pickers/languages.dart';
import 'package:language_pickers/utils/utils.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/view/auth/signin.dart';
import 'package:swipedetector/swipedetector.dart';

class OnBoarding extends StatefulWidget {
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int index = 1;
  var widgets = [];
  PageController _pageController;
  Duration pageTurnDuration = Duration(milliseconds: 500);
  Curve pageTurnCurve = Curves.ease;
  Language _selectedDropdownLanguage =  LanguagePickerUtils.getLanguageByIsoCode('en');

  @override
  void initState() {
    widgets = [
      _firstPage(Globals.height, Globals.width),
      _secondPage(Globals.height, Globals.width),
      _thirdPage(Globals.height, Globals.width)
    ];
    _pageController = PageController();
    super.initState();
  }

  void _goForward() {
    _pageController.nextPage(duration: pageTurnDuration, curve: pageTurnCurve);
  }

  void _goBack() {
    _pageController.previousPage(
        duration: pageTurnDuration, curve: pageTurnCurve);
  }

  Widget _buildDropdownItem(Language language) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 8.0,
        ),
        Text("${language.name} (${language.isoCode})"),
      ],
    );
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
               Positioned(child:
                 Opacity(opacity: index == 2?1.0:0.0,child: Container(
                   decoration: BoxDecoration(
                     color: Colors.white,
                     border: Border.all(
                       color: Colors.grey,
                       width: 1.0
                     )
                   ),
                   width: w *0.55,
                   height: h *0.04,
                   child: LanguagePickerDropdown(
                     initialValue: 'en',
                     itemBuilder: _buildDropdownItem,
                     onValuePicked: (Language language) {
                       _selectedDropdownLanguage = language;
                       print(_selectedDropdownLanguage.name);
                       print(_selectedDropdownLanguage.isoCode);
                     },
                   ),
                 ),),top: h * 0.05,
               ),
                Positioned(
                  child: Container(
                    height: h * 0.5,
                    width: w * 0.8,
                    child: SwipeDetector(
                      onSwipeLeft: () {
                        if (index == 1) {
                          setState(() {
                            index += 1;
                          });
                          _goForward();
                        } else if (index == 2) {
                          setState(() {
                            index += 1;
                          });
                          _goForward();
                        }
                      },
                      onSwipeRight: () {
                        if (index == 2) {
                          setState(() {
                            index -= 1;
                          });
                          _goBack();
                        } else if (index == 3) {
                          setState(() {
                            index -= 1;
                          });
                          _goBack();
                        }
                      },
                      child: PageView.builder(
                          itemCount: 3,
                          controller: _pageController,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return widgets[index];
                          }),
                    ),
                  ),
                  top: h * 0.15,
                  left: w * 0.1,
                  right: w * 0.1,
                ),
                Positioned(
                    bottom: h * 0.18,
                    child: DotsIndicator(
                      dotsCount: 3,
                      onTap: (pos) {
                        setState(() {
                          index = (pos + 1).toInt();
                          _pageController.jumpToPage(index - 1);
                        });
                      },
                      position: (index - 1).toDouble(),
                      decorator: DotsDecorator(
                        size: Size.square(9.0),
                        activeSize: Size(18.0, 9.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    )),
                Positioned(
                    bottom: h * 0.1,
                    left: w * 0.05,
                    child: Container(
                      height: h * 0.07,
                      width: w * 0.9,
                      color: Colors.lightGreen,
                      child: TextButton(
                        onPressed: () {
                          if (index == 1) {
                            setState(() {
                              index += 1;
                            });
                            _goForward();
                          } else if (index == 2) {
                            setState(() {
                              index += 1;
                            });
                            _goForward();
                          } else {
                            Navigator.of(context).pushReplacement(
                                new MaterialPageRoute(builder: (context) {
                              return SignIn();
                            }));
                          }
                        },
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                    ))
              ],
            )),
        onWillPop: () {
          return Future.value(false);
        });
  }

  Widget _firstPage(h, w) {
    return Container(
      height: w * 0.8,
      width: w * 0.8,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Center(
        child: Text('LOGO'),
      ),
    );
  }

  Widget _secondPage(h, w) {
    return Container(
      height: w * 0.8,
      width: w * 0.8,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Center(
        child: Text('Start Matches'),
      ),
    );
  }

  Widget _thirdPage(h, w) {
    return Container(
      height: w * 0.8,
      width: w * 0.8,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Center(
        child: Text('Find a Team'),
      ),
    );
  }
}
