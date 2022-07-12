import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FencingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(Offset(size.width*0.5000000,0), Offset(size.width*0.5000000,size.height), [Color(0xff231F20).withOpacity(1),Color(0xff1DCFC9).withOpacity(1),Color(0xff1DCFC9).withOpacity(1),Color(0xff7585FF).withOpacity(1)], [0,0.432292,0.432292,1]);
    canvas.drawRRect(RRect.fromRectAndCorners(Rect.fromLTWH(0,0,size.width,size.height),bottomRight: Radius.circular(size.width*0.03128160),bottomLeft:  Radius.circular(size.width*0.03128160),topLeft:  Radius.circular(size.width*0.03128160),topRight:  Radius.circular(size.width*0.03128160)),paint_0_fill);

    Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
    paint_1_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawRect(Rect.fromLTWH(size.width*0.01210654,size.height*-0.04040404,size.width*0.002421308,size.height*0.9480519),paint_1_fill);

    Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
    paint_2_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawRect(Rect.fromLTWH(size.width*0.9878935,size.height*-0.04040404,size.width*0.004842615,size.height*0.9480519),paint_2_fill);

    Paint paint_3_fill = Paint()..style=PaintingStyle.fill;
    paint_3_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawRect(Rect.fromLTWH(size.width*0.01452785,size.height*0.9047619,size.width*0.9728596,size.height*0.001864257),paint_3_fill);

    Path path_4 = Path();
    path_4.moveTo(size.width*0.7966126,size.height*0.02246984);
    path_4.lineTo(size.width*0.7939153,size.height*0.02246984);
    path_4.lineTo(size.width*0.7939153,size.height*0.02453102);
    path_4.lineTo(size.width*0.7911743,size.height*0.02453102);
    path_4.lineTo(size.width*0.7911743,size.height*0.02246984);
    path_4.lineTo(size.width*0.7828208,size.height*0.02246984);
    path_4.lineTo(size.width*0.7828208,size.height*0.02130317);
    path_4.lineTo(size.width*0.7903269,size.height*0.01545700);
    path_4.lineTo(size.width*0.7933487,size.height*0.01545700);
    path_4.lineTo(size.width*0.7862809,size.height*0.02104401);
    path_4.lineTo(size.width*0.7912615,size.height*0.02104401);
    path_4.lineTo(size.width*0.7912615,size.height*0.01921616);
    path_4.lineTo(size.width*0.7939153,size.height*0.01921616);
    path_4.lineTo(size.width*0.7939153,size.height*0.02104401);
    path_4.lineTo(size.width*0.7966126,size.height*0.02104401);
    path_4.lineTo(size.width*0.7966126,size.height*0.02246984);
    path_4.close();
    path_4.moveTo(size.width*0.8006707,size.height*0.02025325);
    path_4.lineTo(size.width*0.8066513,size.height*0.02025325);
    path_4.lineTo(size.width*0.8066513,size.height*0.02160144);
    path_4.lineTo(size.width*0.8006707,size.height*0.02160144);
    path_4.lineTo(size.width*0.8006707,size.height*0.02025325);
    path_4.close();
    path_4.moveTo(size.width*0.8172736,size.height*0.01920317);
    path_4.cubicTo(size.width*0.8186804,size.height*0.01930693,size.width*0.8197554,size.height*0.01959206,size.width*0.8204939,size.height*0.02005873);
    path_4.cubicTo(size.width*0.8212324,size.height*0.02052540,size.width*0.8216029,size.height*0.02110880,size.width*0.8216029,size.height*0.02180880);
    path_4.cubicTo(size.width*0.8216029,size.height*0.02233593,size.width*0.8213777,size.height*0.02281558,size.width*0.8209298,size.height*0.02324762);
    path_4.cubicTo(size.width*0.8204794,size.height*0.02367980,size.width*0.8197990,size.height*0.02402540,size.width*0.8188838,size.height*0.02428470);
    path_4.cubicTo(size.width*0.8179855,size.height*0.02453535,size.width*0.8168838,size.height*0.02466061,size.width*0.8155787,size.height*0.02466061);
    path_4.cubicTo(size.width*0.8144915,size.height*0.02466061,size.width*0.8134383,size.height*0.02456999,size.width*0.8124237,size.height*0.02438846);
    path_4.cubicTo(size.width*0.8114237,size.height*0.02419827,size.width*0.8105690,size.height*0.02393911,size.width*0.8098571,size.height*0.02361068);
    path_4.lineTo(size.width*0.8110751,size.height*0.02230144);
    path_4.cubicTo(size.width*0.8116271,size.height*0.02257792,size.width*0.8122930,size.height*0.02279827,size.width*0.8130775,size.height*0.02296248);
    path_4.cubicTo(size.width*0.8138741,size.height*0.02311804,size.width*0.8146925,size.height*0.02319582,size.width*0.8155351,size.height*0.02319582);
    path_4.cubicTo(size.width*0.8165351,size.height*0.02319582,size.width*0.8173172,size.height*0.02307489,size.width*0.8178838,size.height*0.02283290);
    path_4.cubicTo(size.width*0.8184649,size.height*0.02258225,size.width*0.8187530,size.height*0.02224517,size.width*0.8187530,size.height*0.02182179);
    path_4.cubicTo(size.width*0.8187530,size.height*0.02139827,size.width*0.8184794,size.height*0.02106984,size.width*0.8179274,size.height*0.02083651);
    path_4.cubicTo(size.width*0.8173898,size.height*0.02059466,size.width*0.8165642,size.height*0.02047359,size.width*0.8154479,size.height*0.02047359);
    path_4.lineTo(size.width*0.8140557,size.height*0.02047359);
    path_4.lineTo(size.width*0.8140557,size.height*0.01931991);
    path_4.lineTo(size.width*0.8175133,size.height*0.01686984);
    path_4.lineTo(size.width*0.8105981,size.height*0.01686984);
    path_4.lineTo(size.width*0.8105981,size.height*0.01545700);
    path_4.lineTo(size.width*0.8209734,size.height*0.01545700);
    path_4.lineTo(size.width*0.8209734,size.height*0.01658470);
    path_4.lineTo(size.width*0.8172736,size.height*0.01920317);
    path_4.close();
    path_4.moveTo(size.width*0.8261090,size.height*0.02025325);
    path_4.lineTo(size.width*0.8320896,size.height*0.02025325);
    path_4.lineTo(size.width*0.8320896,size.height*0.02160144);
    path_4.lineTo(size.width*0.8261090,size.height*0.02160144);
    path_4.lineTo(size.width*0.8261090,size.height*0.02025325);
    path_4.close();
    path_4.moveTo(size.width*0.8427119,size.height*0.01920317);
    path_4.cubicTo(size.width*0.8441186,size.height*0.01930693,size.width*0.8451913,size.height*0.01959206,size.width*0.8459322,size.height*0.02005873);
    path_4.cubicTo(size.width*0.8466707,size.height*0.02052540,size.width*0.8470412,size.height*0.02110880,size.width*0.8470412,size.height*0.02180880);
    path_4.cubicTo(size.width*0.8470412,size.height*0.02233593,size.width*0.8468160,size.height*0.02281558,size.width*0.8463680,size.height*0.02324762);
    path_4.cubicTo(size.width*0.8459177,size.height*0.02367980,size.width*0.8452349,size.height*0.02402540,size.width*0.8443220,size.height*0.02428470);
    path_4.cubicTo(size.width*0.8434237,size.height*0.02453535,size.width*0.8423220,size.height*0.02466061,size.width*0.8410169,size.height*0.02466061);
    path_4.cubicTo(size.width*0.8399274,size.height*0.02466061,size.width*0.8388765,size.height*0.02456999,size.width*0.8378620,size.height*0.02438846);
    path_4.cubicTo(size.width*0.8368620,size.height*0.02419827,size.width*0.8360048,size.height*0.02393911,size.width*0.8352954,size.height*0.02361068);
    path_4.lineTo(size.width*0.8365133,size.height*0.02230144);
    path_4.cubicTo(size.width*0.8370654,size.height*0.02257792,size.width*0.8377312,size.height*0.02279827,size.width*0.8385157,size.height*0.02296248);
    path_4.cubicTo(size.width*0.8393123,size.height*0.02311804,size.width*0.8401308,size.height*0.02319582,size.width*0.8409734,size.height*0.02319582);
    path_4.cubicTo(size.width*0.8419734,size.height*0.02319582,size.width*0.8427554,size.height*0.02307489,size.width*0.8433220,size.height*0.02283290);
    path_4.cubicTo(size.width*0.8439007,size.height*0.02258225,size.width*0.8441913,size.height*0.02224517,size.width*0.8441913,size.height*0.02182179);
    path_4.cubicTo(size.width*0.8441913,size.height*0.02139827,size.width*0.8439153,size.height*0.02106984,size.width*0.8433656,size.height*0.02083651);
    path_4.cubicTo(size.width*0.8428281,size.height*0.02059466,size.width*0.8420024,size.height*0.02047359,size.width*0.8408862,size.height*0.02047359);
    path_4.lineTo(size.width*0.8394939,size.height*0.02047359);
    path_4.lineTo(size.width*0.8394939,size.height*0.01931991);
    path_4.lineTo(size.width*0.8429516,size.height*0.01686984);
    path_4.lineTo(size.width*0.8360339,size.height*0.01686984);
    path_4.lineTo(size.width*0.8360339,size.height*0.01545700);
    path_4.lineTo(size.width*0.8464092,size.height*0.01545700);
    path_4.lineTo(size.width*0.8464092,size.height*0.01658470);
    path_4.lineTo(size.width*0.8427119,size.height*0.01920317);
    path_4.close();

    Paint paint_4_fill = Paint()..style=PaintingStyle.fill;
    paint_4_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_4,paint_4_fill);

    Path path_5 = Path();
    path_5.moveTo(size.width*0.8585351,size.height*0.01230248);
    path_5.lineTo(size.width*0.8594068,size.height*0.01280854);
    path_5.lineTo(size.width*0.8570073,size.height*0.01420023);
    path_5.lineTo(size.width*0.8561356,size.height*0.01420023);
    path_5.lineTo(size.width*0.8561356,size.height*0.01369417);
    path_5.lineTo(size.width*0.8585351,size.height*0.01230248);
    path_5.lineTo(size.width*0.8585351,size.height*0.01230248);
    path_5.close();

    Paint paint_5_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.001755448;
    paint_5_stroke.color=Colors.white.withOpacity(1.0);
    paint_5_stroke.strokeCap = StrokeCap.round;
    paint_5_stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_5,paint_5_stroke);

    Paint paint_5_fill = Paint()..style=PaintingStyle.fill;
    paint_5_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_5,paint_5_fill);

    Path path_6 = Path();
    path_6.moveTo(size.width*0.8561356,size.height*0.01489942);
    path_6.lineTo(size.width*0.8600944,size.height*0.01489942);

    Paint paint_6_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.001755448;
    paint_6_stroke.color=Colors.white.withOpacity(1.0);
    paint_6_stroke.strokeCap = StrokeCap.round;
    paint_6_stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_6,paint_6_stroke);

    Paint paint_6_fill = Paint()..style=PaintingStyle.fill;
    paint_6_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_6,paint_6_fill);

    Paint paint_7_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_7_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.3535109,size.height*0.04906205),Offset(size.width*0.6464891,size.height*0.04906205),paint_7_stroke);

    Paint paint_8_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_8_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.2590799,size.height*0.2900433),Offset(size.width*0.7457627,size.height*0.2900433),paint_8_stroke);

    Paint paint_9_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_9_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.2590799,size.height*0.4617605),Offset(size.width*0.7457627,size.height*0.4617605),paint_9_stroke);

    Paint paint_10_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_10_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.2590799,size.height*0.6334776),Offset(size.width*0.7457627,size.height*0.6334776),paint_10_stroke);

    Paint paint_11_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_11_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.2590799,size.height*0.8051948),Offset(size.width*0.7457627,size.height*0.8051948),paint_11_stroke);

    Paint paint_12_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_12_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.09927361,size.height*0.8484848),Offset(size.width*0.9055690,size.height*0.8484848),paint_12_stroke);

    Paint paint_13_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_13_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.1016949,size.height*0.4776335),Offset(size.width*0.1016949,size.height*0.8499278),paint_13_stroke);

    Paint paint_14_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_14_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.2615012,size.height*0.008658009),Offset(size.width*0.2615012,size.height*0.8066378),paint_14_stroke);

    Paint paint_15_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_15_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.7433414,size.height*0.008658009),Offset(size.width*0.7433414,size.height*0.8066378),paint_15_stroke);

    Path path_16 = Path();
    path_16.moveTo(size.width*0.9055690,size.height*0.4776335);
    path_16.lineTo(size.width*0.9055690,size.height*0.8499278);

    Paint paint_16_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_16_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawPath(path_16,paint_16_stroke);

    Paint paint_16_fill = Paint()..style=PaintingStyle.fill;
    paint_16_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_16,paint_16_fill);

    Paint paint_17_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_17_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawRect(Rect.fromLTWH(size.width*0.2615012,size.height*0.4617605,size.width*0.4818402,size.height*0.1717172),paint_17_stroke);

    Paint paint_17_fill = Paint()..style=PaintingStyle.fill;
    paint_17_fill.color = Color(0xff979797).withOpacity(1.0);
    canvas.drawRect(Rect.fromLTWH(size.width*0.2615012,size.height*0.4617605,size.width*0.4818402,size.height*0.1717172),paint_17_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}