// import 'dart:ui';
//
// import 'package:achievement_view/achievement_view.dart';
// import 'package:achievement_view/achievement_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:project7_2/custom/globals.dart';
// import 'package:project7_2/database/firebase.dart';
// import 'package:project7_2/services/auth/auth.dart';
// import 'package:project7_2/view/auth/signin.dart';
// import 'package:project7_2/view/new_ui/onboarding/login.dart';
// import 'package:project7_2/view/new_ui/onboarding/loginSocial.dart';
//
// import '../../custom/clipped_profile/clipped_profile.dart';
// import '../../custom/hexagon_clipper/hexagon_clipper.dart';
// import '../../custom/trapezium_clipper/trapezium_clipper.dart';
// import '../new_ui/create_game/create_game_event.dart';
// import '../new_ui/left_side_navigation/left_panel.dart';
//
// class TestChart extends StatefulWidget {
//   @override
//   _TestChartState createState() => _TestChartState();
// }
//
// class _TestChartState extends State<TestChart> {
//
//   @override
//   Widget build(BuildContext context) {
//     final List<ChartData> chartData = [
//       ChartData('David', 25, Color.fromRGBO(9,0,136,1)),
//       ChartData('Steve', 38, Color.fromRGBO(147,0,119,1)),
//       ChartData('Jack', 34, Color.fromRGBO(228,0,124,1)),
//       ChartData('Others', 52, Color.fromRGBO(255,189,57,1))
//     ];
//     return Scaffold(
//         body: Center(
//             child: Container(
//                 child: SfCircularChart(
//                     series: <CircularSeries>[
//                       // Renders doughnut chart
//                       DoughnutSeries<ChartData, String>(
//                           dataSource: chartData,
//                           pointColorMapper:(ChartData data,  _) => data.color,
//                           xValueMapper: (ChartData data, _) => data.x,
//                           yValueMapper: (ChartData data, _) => data.y
//                       )
//                     ]
//                 )
//             )
//         )
//     );
//   }
// }
//
//   class ChartData {
//   ChartData(this.x, this.y, [this.color]);
//   final String x;
//   final double y;
//   final Color color;
//   }