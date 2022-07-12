import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GolfPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(Offset(size.width*0.5000000,0), Offset(size.width*0.5000000,size.height), [Color(0xff231F20).withOpacity(1),Color(0xff1DCFC9).withOpacity(1),Color(0xff1DCFC9).withOpacity(1),Color(0xff7585FF).withOpacity(1)], [0,0.432292,0.432292,1]);
    canvas.drawRRect(RRect.fromRectAndCorners(Rect.fromLTWH(0,0,size.width,size.height),bottomRight: Radius.circular(size.width*0.03128160),bottomLeft:  Radius.circular(size.width*0.03128160),topLeft:  Radius.circular(size.width*0.03128160),topRight:  Radius.circular(size.width*0.03128160)),paint_0_fill);

    Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
    paint_1_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawRect(Rect.fromLTWH(size.width*0.01210654,size.height*-0.04040404,size.width*0.004842615,size.height*0.9480519),paint_1_fill);

    Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
    paint_2_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawRect(Rect.fromLTWH(size.width*0.9878935,size.height*-0.04040404,size.width*0.004842615,size.height*0.9480519),paint_2_fill);

    Paint paint_3_fill = Paint()..style=PaintingStyle.fill;
    paint_3_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawRect(Rect.fromLTWH(size.width*0.01452785,size.height*0.9047619,size.width*0.9728596,size.height*0.002886003),paint_3_fill);

    Paint paint_4_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_4_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.01452785,size.height*0.005772049),Offset(size.width*0.9878935,size.height*0.005772006),paint_4_stroke);

    Path path_5 = Path();
    path_5.moveTo(size.width*0.9588378,size.height*0.5930736);
    path_5.cubicTo(size.width*0.9588378,size.height*0.6288889,size.width*0.9470000,size.height*0.6643535,size.width*0.9240024,size.height*0.6974416);
    path_5.cubicTo(size.width*0.9010048,size.height*0.7305310,size.width*0.8672954,size.height*0.7605960,size.width*0.8248015,size.height*0.7859206);
    path_5.cubicTo(size.width*0.7823075,size.height*0.8112453,size.width*0.7318596,size.height*0.8313348,size.width*0.6763366,size.height*0.8450404);
    path_5.cubicTo(size.width*0.6208160,size.height*0.8587460,size.width*0.5613075,size.height*0.8658009,size.width*0.5012107,size.height*0.8658009);
    path_5.cubicTo(size.width*0.4411138,size.height*0.8658009,size.width*0.3816053,size.height*0.8587460,size.width*0.3260847,size.height*0.8450404);
    path_5.cubicTo(size.width*0.2705617,size.height*0.8313348,size.width*0.2201140,size.height*0.8112453,size.width*0.1776194,size.height*0.7859206);
    path_5.cubicTo(size.width*0.1351247,size.height*0.7605960,size.width*0.1014162,size.height*0.7305310,size.width*0.07841840,size.height*0.6974416);
    path_5.cubicTo(size.width*0.05542034,size.height*0.6643535,size.width*0.04358354,size.height*0.6288889,size.width*0.04358354,size.height*0.5930736);
    path_5.lineTo(size.width*0.04753438,size.height*0.5930736);
    path_5.cubicTo(size.width*0.04753438,size.height*0.6285801,size.width*0.05926901,size.height*0.6637374,size.width*0.08206852,size.height*0.6965411);
    path_5.cubicTo(size.width*0.1048678,size.height*0.7293434,size.width*0.1382855,size.height*0.7591501,size.width*0.1804131,size.height*0.7842554);
    path_5.cubicTo(size.width*0.2225409,size.height*0.8093622,size.width*0.2725545,size.height*0.8292785,size.width*0.3275956,size.height*0.8428658);
    path_5.cubicTo(size.width*0.3826392,size.height*0.8564531,size.width*0.4416320,size.height*0.8634459,size.width*0.5012107,size.height*0.8634459);
    path_5.cubicTo(size.width*0.5607893,size.height*0.8634459,size.width*0.6197821,size.height*0.8564531,size.width*0.6748257,size.height*0.8428658);
    path_5.cubicTo(size.width*0.7298668,size.height*0.8292785,size.width*0.7798814,size.height*0.8093622,size.width*0.8220073,size.height*0.7842554);
    path_5.cubicTo(size.width*0.8641356,size.height*0.7591501,size.width*0.8975545,size.height*0.7293434,size.width*0.9203535,size.height*0.6965411);
    path_5.cubicTo(size.width*0.9431525,size.height*0.6637374,size.width*0.9548862,size.height*0.6285801,size.width*0.9548862,size.height*0.5930736);
    path_5.lineTo(size.width*0.9588378,size.height*0.5930736);
    path_5.close();

    Paint paint_5_fill = Paint()..style=PaintingStyle.fill;
    paint_5_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_5,paint_5_fill);

    Path path_6 = Path();
    path_6.moveTo(size.width*0.9588378,size.height*0.5930736);
    path_6.cubicTo(size.width*0.9588378,size.height*0.6288889,size.width*0.9470000,size.height*0.6643535,size.width*0.9240024,size.height*0.6974416);
    path_6.cubicTo(size.width*0.9010048,size.height*0.7305310,size.width*0.8672954,size.height*0.7605960,size.width*0.8248015,size.height*0.7859206);
    path_6.cubicTo(size.width*0.7823075,size.height*0.8112453,size.width*0.7318596,size.height*0.8313348,size.width*0.6763366,size.height*0.8450404);
    path_6.cubicTo(size.width*0.6208160,size.height*0.8587460,size.width*0.5613075,size.height*0.8658009,size.width*0.5012107,size.height*0.8658009);
    path_6.cubicTo(size.width*0.4411138,size.height*0.8658009,size.width*0.3816053,size.height*0.8587460,size.width*0.3260847,size.height*0.8450404);
    path_6.cubicTo(size.width*0.2705617,size.height*0.8313348,size.width*0.2201140,size.height*0.8112453,size.width*0.1776194,size.height*0.7859206);
    path_6.cubicTo(size.width*0.1351247,size.height*0.7605960,size.width*0.1014162,size.height*0.7305310,size.width*0.07841840,size.height*0.6974416);
    path_6.cubicTo(size.width*0.05542034,size.height*0.6643535,size.width*0.04358354,size.height*0.6288889,size.width*0.04358354,size.height*0.5930736);
    path_6.lineTo(size.width*0.04753438,size.height*0.5930736);
    path_6.cubicTo(size.width*0.04753438,size.height*0.6285801,size.width*0.05926901,size.height*0.6637374,size.width*0.08206852,size.height*0.6965411);
    path_6.cubicTo(size.width*0.1048678,size.height*0.7293434,size.width*0.1382855,size.height*0.7591501,size.width*0.1804131,size.height*0.7842554);
    path_6.cubicTo(size.width*0.2225409,size.height*0.8093622,size.width*0.2725545,size.height*0.8292785,size.width*0.3275956,size.height*0.8428658);
    path_6.cubicTo(size.width*0.3826392,size.height*0.8564531,size.width*0.4416320,size.height*0.8634459,size.width*0.5012107,size.height*0.8634459);
    path_6.cubicTo(size.width*0.5607893,size.height*0.8634459,size.width*0.6197821,size.height*0.8564531,size.width*0.6748257,size.height*0.8428658);
    path_6.cubicTo(size.width*0.7298668,size.height*0.8292785,size.width*0.7798814,size.height*0.8093622,size.width*0.8220073,size.height*0.7842554);
    path_6.cubicTo(size.width*0.8641356,size.height*0.7591501,size.width*0.8975545,size.height*0.7293434,size.width*0.9203535,size.height*0.6965411);
    path_6.cubicTo(size.width*0.9431525,size.height*0.6637374,size.width*0.9548862,size.height*0.6285801,size.width*0.9548862,size.height*0.5930736);
    path_6.lineTo(size.width*0.9588378,size.height*0.5930736);
    path_6.close();

    Paint paint_6_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.009685230;
    paint_6_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawPath(path_6,paint_6_stroke);

    Paint paint_6_fill = Paint()..style=PaintingStyle.fill;
    paint_6_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_6,paint_6_fill);

    Path path_7 = Path();
    path_7.moveTo(size.width*0.9564165,size.height*0.3304473);
    path_7.cubicTo(size.width*0.9564165,size.height*0.2946320,size.width*0.9445787,size.height*0.2591674,size.width*0.9215811,size.height*0.2260794);
    path_7.cubicTo(size.width*0.8985835,size.height*0.1929899,size.width*0.8648741,size.height*0.1629250,size.width*0.8223801,size.height*0.1376000);
    path_7.cubicTo(size.width*0.7798862,size.height*0.1122749,size.width*0.7294383,size.height*0.09218600,size.width*0.6739153,size.height*0.07848023);
    path_7.cubicTo(size.width*0.6183947,size.height*0.06477431,size.width*0.5588862,size.height*0.05772006,size.width*0.4987893,size.height*0.05772006);
    path_7.cubicTo(size.width*0.4386925,size.height*0.05772006,size.width*0.3791840,size.height*0.06477431,size.width*0.3236634,size.height*0.07848023);
    path_7.cubicTo(size.width*0.2681404,size.height*0.09218600,size.width*0.2176927,size.height*0.1122749,size.width*0.1751981,size.height*0.1376000);
    path_7.cubicTo(size.width*0.1327034,size.height*0.1629250,size.width*0.09899492,size.height*0.1929899,size.width*0.07599709,size.height*0.2260794);
    path_7.cubicTo(size.width*0.05299903,size.height*0.2591674,size.width*0.04116223,size.height*0.2946320,size.width*0.04116223,size.height*0.3304473);
    path_7.lineTo(size.width*0.04511308,size.height*0.3304473);
    path_7.cubicTo(size.width*0.04511308,size.height*0.2949408,size.width*0.05684770,size.height*0.2597835,size.width*0.07964722,size.height*0.2269798);
    path_7.cubicTo(size.width*0.1024465,size.height*0.1941775,size.width*0.1358642,size.height*0.1643709,size.width*0.1779918,size.height*0.1392649);
    path_7.cubicTo(size.width*0.2201196,size.height*0.1141586,size.width*0.2701332,size.height*0.09424300,size.width*0.3251743,size.height*0.08065556);
    path_7.cubicTo(size.width*0.3802179,size.height*0.06706797,size.width*0.4392107,size.height*0.06007460,size.width*0.4987893,size.height*0.06007460);
    path_7.cubicTo(size.width*0.5583680,size.height*0.06007460,size.width*0.6173608,size.height*0.06706797,size.width*0.6724044,size.height*0.08065556);
    path_7.cubicTo(size.width*0.7274455,size.height*0.09424300,size.width*0.7774600,size.height*0.1141586,size.width*0.8195860,size.height*0.1392649);
    path_7.cubicTo(size.width*0.8617143,size.height*0.1643709,size.width*0.8951332,size.height*0.1941775,size.width*0.9179322,size.height*0.2269798);
    path_7.cubicTo(size.width*0.9407312,size.height*0.2597835,size.width*0.9524649,size.height*0.2949408,size.width*0.9524649,size.height*0.3304473);
    path_7.lineTo(size.width*0.9564165,size.height*0.3304473);
    path_7.close();

    Paint paint_7_fill = Paint()..style=PaintingStyle.fill;
    paint_7_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_7,paint_7_fill);

    Path path_8 = Path();
    path_8.moveTo(size.width*0.9564165,size.height*0.3304473);
    path_8.cubicTo(size.width*0.9564165,size.height*0.2946320,size.width*0.9445787,size.height*0.2591674,size.width*0.9215811,size.height*0.2260794);
    path_8.cubicTo(size.width*0.8985835,size.height*0.1929899,size.width*0.8648741,size.height*0.1629250,size.width*0.8223801,size.height*0.1376000);
    path_8.cubicTo(size.width*0.7798862,size.height*0.1122749,size.width*0.7294383,size.height*0.09218600,size.width*0.6739153,size.height*0.07848023);
    path_8.cubicTo(size.width*0.6183947,size.height*0.06477431,size.width*0.5588862,size.height*0.05772006,size.width*0.4987893,size.height*0.05772006);
    path_8.cubicTo(size.width*0.4386925,size.height*0.05772006,size.width*0.3791840,size.height*0.06477431,size.width*0.3236634,size.height*0.07848023);
    path_8.cubicTo(size.width*0.2681404,size.height*0.09218600,size.width*0.2176927,size.height*0.1122749,size.width*0.1751981,size.height*0.1376000);
    path_8.cubicTo(size.width*0.1327034,size.height*0.1629250,size.width*0.09899492,size.height*0.1929899,size.width*0.07599709,size.height*0.2260794);
    path_8.cubicTo(size.width*0.05299903,size.height*0.2591674,size.width*0.04116223,size.height*0.2946320,size.width*0.04116223,size.height*0.3304473);
    path_8.lineTo(size.width*0.04511308,size.height*0.3304473);
    path_8.cubicTo(size.width*0.04511308,size.height*0.2949408,size.width*0.05684770,size.height*0.2597835,size.width*0.07964722,size.height*0.2269798);
    path_8.cubicTo(size.width*0.1024465,size.height*0.1941775,size.width*0.1358642,size.height*0.1643709,size.width*0.1779918,size.height*0.1392649);
    path_8.cubicTo(size.width*0.2201196,size.height*0.1141586,size.width*0.2701332,size.height*0.09424300,size.width*0.3251743,size.height*0.08065556);
    path_8.cubicTo(size.width*0.3802179,size.height*0.06706797,size.width*0.4392107,size.height*0.06007460,size.width*0.4987893,size.height*0.06007460);
    path_8.cubicTo(size.width*0.5583680,size.height*0.06007460,size.width*0.6173608,size.height*0.06706797,size.width*0.6724044,size.height*0.08065556);
    path_8.cubicTo(size.width*0.7274455,size.height*0.09424300,size.width*0.7774600,size.height*0.1141586,size.width*0.8195860,size.height*0.1392649);
    path_8.cubicTo(size.width*0.8617143,size.height*0.1643709,size.width*0.8951332,size.height*0.1941775,size.width*0.9179322,size.height*0.2269798);
    path_8.cubicTo(size.width*0.9407312,size.height*0.2597835,size.width*0.9524649,size.height*0.2949408,size.width*0.9524649,size.height*0.3304473);
    path_8.lineTo(size.width*0.9564165,size.height*0.3304473);
    path_8.close();

    Paint paint_8_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.009685230;
    paint_8_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawPath(path_8,paint_8_stroke);

    Paint paint_8_fill = Paint()..style=PaintingStyle.fill;
    paint_8_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_8,paint_8_fill);

    Path path_9 = Path();
    path_9.moveTo(size.width*0.04295133,size.height*0.3063550);
    path_9.cubicTo(size.width*0.03481622,size.height*0.3610202,size.width*0.05454383,size.height*0.4158773,size.width*0.09955569,size.height*0.4637547);
    path_9.lineTo(size.width*0.1030024,size.height*0.4626032);
    path_9.cubicTo(size.width*0.05837942,size.height*0.4151400,size.width*0.03882203,size.height*0.3607561,size.width*0.04688692,size.height*0.3065628);
    path_9.lineTo(size.width*0.04295133,size.height*0.3063550);
    path_9.close();

    Paint paint_9_fill = Paint()..style=PaintingStyle.fill;
    paint_9_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_9,paint_9_fill);

    Path path_10 = Path();
    path_10.moveTo(size.width*0.04295133,size.height*0.3063550);
    path_10.cubicTo(size.width*0.03481622,size.height*0.3610202,size.width*0.05454383,size.height*0.4158773,size.width*0.09955569,size.height*0.4637547);
    path_10.lineTo(size.width*0.1030024,size.height*0.4626032);
    path_10.cubicTo(size.width*0.05837942,size.height*0.4151400,size.width*0.03882203,size.height*0.3607561,size.width*0.04688692,size.height*0.3065628);
    path_10.lineTo(size.width*0.04295133,size.height*0.3063550);
    path_10.close();

    Paint paint_10_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.009685230;
    paint_10_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawPath(path_10,paint_10_stroke);

    Paint paint_10_fill = Paint()..style=PaintingStyle.fill;
    paint_10_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_10,paint_10_fill);

    Path path_11 = Path();
    path_11.moveTo(size.width*0.9546271,size.height*0.3077980);
    path_11.cubicTo(size.width*0.9626053,size.height*0.3614069,size.width*0.9437893,size.height*0.4152251,size.width*0.9005496,size.height*0.4624747);
    path_11.lineTo(size.width*0.8970799,size.height*0.4613478);
    path_11.cubicTo(size.width*0.9399467,size.height*0.4145051,size.width*0.9586005,size.height*0.3611515,size.width*0.9506925,size.height*0.3080058);
    path_11.lineTo(size.width*0.9546271,size.height*0.3077980);
    path_11.close();

    Paint paint_11_fill = Paint()..style=PaintingStyle.fill;
    paint_11_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_11,paint_11_fill);

    Path path_12 = Path();
    path_12.moveTo(size.width*0.9546271,size.height*0.3077980);
    path_12.cubicTo(size.width*0.9626053,size.height*0.3614069,size.width*0.9437893,size.height*0.4152251,size.width*0.9005496,size.height*0.4624747);
    path_12.lineTo(size.width*0.8970799,size.height*0.4613478);
    path_12.cubicTo(size.width*0.9399467,size.height*0.4145051,size.width*0.9586005,size.height*0.3611515,size.width*0.9506925,size.height*0.3080058);
    path_12.lineTo(size.width*0.9546271,size.height*0.3077980);
    path_12.close();

    Paint paint_12_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.009685230;
    paint_12_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawPath(path_12,paint_12_stroke);

    Paint paint_12_fill = Paint()..style=PaintingStyle.fill;
    paint_12_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_12,paint_12_fill);

    Path path_13 = Path();
    path_13.moveTo(size.width*0.9570484,size.height*0.6171659);
    path_13.cubicTo(size.width*0.9651743,size.height*0.5625570,size.width*0.9454964,size.height*0.5077561,size.width*0.9005811,size.height*0.4599105);
    path_13.lineTo(size.width*0.8971332,size.height*0.4610606);
    path_13.cubicTo(size.width*0.9416610,size.height*0.5084921,size.width*0.9611695,size.height*0.5628211,size.width*0.9531138,size.height*0.6169582);
    path_13.lineTo(size.width*0.9570484,size.height*0.6171659);
    path_13.close();

    Paint paint_13_fill = Paint()..style=PaintingStyle.fill;
    paint_13_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_13,paint_13_fill);

    Path path_14 = Path();
    path_14.moveTo(size.width*0.9570484,size.height*0.6171659);
    path_14.cubicTo(size.width*0.9651743,size.height*0.5625570,size.width*0.9454964,size.height*0.5077561,size.width*0.9005811,size.height*0.4599105);
    path_14.lineTo(size.width*0.8971332,size.height*0.4610606);
    path_14.cubicTo(size.width*0.9416610,size.height*0.5084921,size.width*0.9611695,size.height*0.5628211,size.width*0.9531138,size.height*0.6169582);
    path_14.lineTo(size.width*0.9570484,size.height*0.6171659);
    path_14.close();

    Paint paint_14_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.009685230;
    paint_14_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawPath(path_14,paint_14_stroke);

    Paint paint_14_fill = Paint()..style=PaintingStyle.fill;
    paint_14_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_14,paint_14_fill);

    Path path_15 = Path();
    path_15.moveTo(size.width*0.04537264,size.height*0.6157229);
    path_15.cubicTo(size.width*0.03740363,size.height*0.5621732,size.width*0.05616925,size.height*0.5084127,size.width*0.09931211,size.height*0.4611977);
    path_15.lineTo(size.width*0.1027818,size.height*0.4623247);
    path_15.cubicTo(size.width*0.06001162,size.height*0.5091313,size.width*0.04140775,size.height*0.5624271,size.width*0.04930823,size.height*0.6155152);
    path_15.lineTo(size.width*0.04537264,size.height*0.6157229);
    path_15.close();

    Paint paint_15_fill = Paint()..style=PaintingStyle.fill;
    paint_15_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_15,paint_15_fill);

    Path path_16 = Path();
    path_16.moveTo(size.width*0.04537264,size.height*0.6157229);
    path_16.cubicTo(size.width*0.03740363,size.height*0.5621732,size.width*0.05616925,size.height*0.5084127,size.width*0.09931211,size.height*0.4611977);
    path_16.lineTo(size.width*0.1027818,size.height*0.4623247);
    path_16.cubicTo(size.width*0.06001162,size.height*0.5091313,size.width*0.04140775,size.height*0.5624271,size.width*0.04930823,size.height*0.6155152);
    path_16.lineTo(size.width*0.04537264,size.height*0.6157229);
    path_16.close();

    Paint paint_16_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.009685230;
    paint_16_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawPath(path_16,paint_16_stroke);

    Paint paint_16_fill = Paint()..style=PaintingStyle.fill;
    paint_16_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_16,paint_16_fill);

    Path path_17 = Path();
    path_17.moveTo(size.width*0.5440751,size.height*0.1227566);
    path_17.cubicTo(size.width*0.5440751,size.height*0.1251240,size.width*0.5318741,size.height*0.1269841,size.width*0.5165521,size.height*0.1269841);
    path_17.cubicTo(size.width*0.5012300,size.height*0.1269841,size.width*0.4890291,size.height*0.1251240,size.width*0.4890291,size.height*0.1227566);
    path_17.cubicTo(size.width*0.4890291,size.height*0.1203892,size.width*0.5012300,size.height*0.1185290,size.width*0.5165521,size.height*0.1185290);
    path_17.cubicTo(size.width*0.5315908,size.height*0.1185290,size.width*0.5440751,size.height*0.1205583,size.width*0.5440751,size.height*0.1227566);
    path_17.close();

    Paint paint_17_fill = Paint()..style=PaintingStyle.fill;
    paint_17_fill.color = Color(0xffCCCCCC).withOpacity(1.0);
    canvas.drawPath(path_17,paint_17_fill);

    Path path_18 = Path();
    path_18.moveTo(size.width*0.6289153,size.height*0.04869004);
    path_18.cubicTo(size.width*0.6235254,size.height*0.04716811,size.width*0.5349952,size.height*0.02231010,size.width*0.5219419,size.height*0.01875902);
    path_18.lineTo(size.width*0.5219419,size.height*0.08555426);
    path_18.cubicTo(size.width*0.5347119,size.height*0.08200303,size.width*0.6232397,size.height*0.05714517,size.width*0.6286320,size.height*0.05562323);
    path_18.cubicTo(size.width*0.6331719,size.height*0.05443954,size.width*0.6331719,size.height*0.04987374,size.width*0.6289153,size.height*0.04869004);
    path_18.close();

    Paint paint_18_fill = Paint()..style=PaintingStyle.fill;
    paint_18_fill.color = Color(0xffED4C5C).withOpacity(1.0);
    canvas.drawPath(path_18,paint_18_fill);

    Path path_19 = Path();
    path_19.moveTo(size.width*0.5108765,size.height*0.01875902);
    path_19.lineTo(size.width*0.5219419,size.height*0.01875902);
    path_19.lineTo(size.width*0.5219419,size.height*0.1227566);
    path_19.lineTo(size.width*0.5108765,size.height*0.1227566);
    path_19.lineTo(size.width*0.5108765,size.height*0.01875902);
    path_19.close();

    Paint paint_19_fill = Paint()..style=PaintingStyle.fill;
    paint_19_fill.color = Color(0xffD3976E).withOpacity(1.0);
    canvas.drawPath(path_19,paint_19_fill);

    Paint paint_20_fill = Paint()..style=PaintingStyle.fill;
    paint_20_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5108959,size.height*0.5757576),size.width*0.04842615,paint_20_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}