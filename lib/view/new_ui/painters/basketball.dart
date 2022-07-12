import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BasketballPainter extends CustomPainter {
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
    canvas.drawRect(Rect.fromLTWH(size.width*0.01452785,size.height*0.9062049,size.width*0.9728596,size.height*0.001864257),paint_3_fill);

    Path path_4 = Path();
    path_4.moveTo(size.width*0.8619879,size.height*0.02246984);
    path_4.lineTo(size.width*0.8592906,size.height*0.02246984);
    path_4.lineTo(size.width*0.8592906,size.height*0.02453102);
    path_4.lineTo(size.width*0.8565496,size.height*0.02453102);
    path_4.lineTo(size.width*0.8565496,size.height*0.02246984);
    path_4.lineTo(size.width*0.8481961,size.height*0.02246984);
    path_4.lineTo(size.width*0.8481961,size.height*0.02130317);
    path_4.lineTo(size.width*0.8557022,size.height*0.01545700);
    path_4.lineTo(size.width*0.8587240,size.height*0.01545700);
    path_4.lineTo(size.width*0.8516562,size.height*0.02104401);
    path_4.lineTo(size.width*0.8566368,size.height*0.02104401);
    path_4.lineTo(size.width*0.8566368,size.height*0.01921616);
    path_4.lineTo(size.width*0.8592906,size.height*0.01921616);
    path_4.lineTo(size.width*0.8592906,size.height*0.02104401);
    path_4.lineTo(size.width*0.8619879,size.height*0.02104401);
    path_4.lineTo(size.width*0.8619879,size.height*0.02246984);
    path_4.close();
    path_4.moveTo(size.width*0.8660460,size.height*0.02025325);
    path_4.lineTo(size.width*0.8720266,size.height*0.02025325);
    path_4.lineTo(size.width*0.8720266,size.height*0.02160144);
    path_4.lineTo(size.width*0.8660460,size.height*0.02160144);
    path_4.lineTo(size.width*0.8660460,size.height*0.02025325);
    path_4.close();
    path_4.moveTo(size.width*0.8826489,size.height*0.01920317);
    path_4.cubicTo(size.width*0.8840557,size.height*0.01930693,size.width*0.8851308,size.height*0.01959206,size.width*0.8858692,size.height*0.02005873);
    path_4.cubicTo(size.width*0.8866077,size.height*0.02052540,size.width*0.8869782,size.height*0.02110880,size.width*0.8869782,size.height*0.02180880);
    path_4.cubicTo(size.width*0.8869782,size.height*0.02233593,size.width*0.8867530,size.height*0.02281558,size.width*0.8863051,size.height*0.02324762);
    path_4.cubicTo(size.width*0.8858547,size.height*0.02367980,size.width*0.8851743,size.height*0.02402540,size.width*0.8842591,size.height*0.02428470);
    path_4.cubicTo(size.width*0.8833608,size.height*0.02453535,size.width*0.8822591,size.height*0.02466061,size.width*0.8809540,size.height*0.02466061);
    path_4.cubicTo(size.width*0.8798668,size.height*0.02466061,size.width*0.8788136,size.height*0.02456999,size.width*0.8777990,size.height*0.02438846);
    path_4.cubicTo(size.width*0.8767990,size.height*0.02419827,size.width*0.8759443,size.height*0.02393911,size.width*0.8752324,size.height*0.02361068);
    path_4.lineTo(size.width*0.8764504,size.height*0.02230144);
    path_4.cubicTo(size.width*0.8770024,size.height*0.02257792,size.width*0.8776683,size.height*0.02279827,size.width*0.8784528,size.height*0.02296248);
    path_4.cubicTo(size.width*0.8792494,size.height*0.02311804,size.width*0.8800678,size.height*0.02319582,size.width*0.8809104,size.height*0.02319582);
    path_4.cubicTo(size.width*0.8819104,size.height*0.02319582,size.width*0.8826925,size.height*0.02307489,size.width*0.8832591,size.height*0.02283290);
    path_4.cubicTo(size.width*0.8838402,size.height*0.02258225,size.width*0.8841283,size.height*0.02224517,size.width*0.8841283,size.height*0.02182179);
    path_4.cubicTo(size.width*0.8841283,size.height*0.02139827,size.width*0.8838547,size.height*0.02106984,size.width*0.8833027,size.height*0.02083651);
    path_4.cubicTo(size.width*0.8827651,size.height*0.02059466,size.width*0.8819395,size.height*0.02047359,size.width*0.8808232,size.height*0.02047359);
    path_4.lineTo(size.width*0.8794310,size.height*0.02047359);
    path_4.lineTo(size.width*0.8794310,size.height*0.01931991);
    path_4.lineTo(size.width*0.8828886,size.height*0.01686984);
    path_4.lineTo(size.width*0.8759734,size.height*0.01686984);
    path_4.lineTo(size.width*0.8759734,size.height*0.01545700);
    path_4.lineTo(size.width*0.8863487,size.height*0.01545700);
    path_4.lineTo(size.width*0.8863487,size.height*0.01658470);
    path_4.lineTo(size.width*0.8826489,size.height*0.01920317);
    path_4.close();
    path_4.moveTo(size.width*0.8914843,size.height*0.02025325);
    path_4.lineTo(size.width*0.8974649,size.height*0.02025325);
    path_4.lineTo(size.width*0.8974649,size.height*0.02160144);
    path_4.lineTo(size.width*0.8914843,size.height*0.02160144);
    path_4.lineTo(size.width*0.8914843,size.height*0.02025325);
    path_4.close();
    path_4.moveTo(size.width*0.9080872,size.height*0.01920317);
    path_4.cubicTo(size.width*0.9094939,size.height*0.01930693,size.width*0.9105666,size.height*0.01959206,size.width*0.9113075,size.height*0.02005873);
    path_4.cubicTo(size.width*0.9120460,size.height*0.02052540,size.width*0.9124165,size.height*0.02110880,size.width*0.9124165,size.height*0.02180880);
    path_4.cubicTo(size.width*0.9124165,size.height*0.02233593,size.width*0.9121913,size.height*0.02281558,size.width*0.9117433,size.height*0.02324762);
    path_4.cubicTo(size.width*0.9112930,size.height*0.02367980,size.width*0.9106102,size.height*0.02402540,size.width*0.9096973,size.height*0.02428470);
    path_4.cubicTo(size.width*0.9087990,size.height*0.02453535,size.width*0.9076973,size.height*0.02466061,size.width*0.9063923,size.height*0.02466061);
    path_4.cubicTo(size.width*0.9053027,size.height*0.02466061,size.width*0.9042518,size.height*0.02456999,size.width*0.9032373,size.height*0.02438846);
    path_4.cubicTo(size.width*0.9022373,size.height*0.02419827,size.width*0.9013801,size.height*0.02393911,size.width*0.9006707,size.height*0.02361068);
    path_4.lineTo(size.width*0.9018886,size.height*0.02230144);
    path_4.cubicTo(size.width*0.9024407,size.height*0.02257792,size.width*0.9031065,size.height*0.02279827,size.width*0.9038910,size.height*0.02296248);
    path_4.cubicTo(size.width*0.9046877,size.height*0.02311804,size.width*0.9055061,size.height*0.02319582,size.width*0.9063487,size.height*0.02319582);
    path_4.cubicTo(size.width*0.9073487,size.height*0.02319582,size.width*0.9081308,size.height*0.02307489,size.width*0.9086973,size.height*0.02283290);
    path_4.cubicTo(size.width*0.9092760,size.height*0.02258225,size.width*0.9095666,size.height*0.02224517,size.width*0.9095666,size.height*0.02182179);
    path_4.cubicTo(size.width*0.9095666,size.height*0.02139827,size.width*0.9092906,size.height*0.02106984,size.width*0.9087409,size.height*0.02083651);
    path_4.cubicTo(size.width*0.9082034,size.height*0.02059466,size.width*0.9073777,size.height*0.02047359,size.width*0.9062615,size.height*0.02047359);
    path_4.lineTo(size.width*0.9048692,size.height*0.02047359);
    path_4.lineTo(size.width*0.9048692,size.height*0.01931991);
    path_4.lineTo(size.width*0.9083269,size.height*0.01686984);
    path_4.lineTo(size.width*0.9014092,size.height*0.01686984);
    path_4.lineTo(size.width*0.9014092,size.height*0.01545700);
    path_4.lineTo(size.width*0.9117845,size.height*0.01545700);
    path_4.lineTo(size.width*0.9117845,size.height*0.01658470);
    path_4.lineTo(size.width*0.9080872,size.height*0.01920317);
    path_4.close();

    Paint paint_4_fill = Paint()..style=PaintingStyle.fill;
    paint_4_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_4,paint_4_fill);

    Path path_5 = Path();
    path_5.moveTo(size.width*0.9358741,size.height*0.01468254);
    path_5.lineTo(size.width*0.9394818,size.height*0.01677662);
    path_5.lineTo(size.width*0.9295569,size.height*0.02253535);
    path_5.lineTo(size.width*0.9259492,size.height*0.02253535);
    path_5.lineTo(size.width*0.9259492,size.height*0.02044127);
    path_5.lineTo(size.width*0.9358741,size.height*0.01468254);
    path_5.lineTo(size.width*0.9358741,size.height*0.01468254);
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
    path_6.moveTo(size.width*0.9259492,size.height*0.02542843);
    path_6.lineTo(size.width*0.9423317,size.height*0.02542843);

    Paint paint_6_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.001755448;
    paint_6_stroke.color=Colors.white.withOpacity(1.0);
    paint_6_stroke.strokeCap = StrokeCap.round;
    paint_6_stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_6,paint_6_stroke);

    Paint paint_6_fill = Paint()..style=PaintingStyle.fill;
    paint_6_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_6,paint_6_fill);

    Paint paint_7_fill = Paint()..style=PaintingStyle.fill;
    paint_7_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawRect(Rect.fromLTWH(size.width*0.01564097,size.height*0.03542121,size.width*0.9728596,size.height*0.001864257),paint_7_fill);

    Paint paint_8_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.003128160;
    paint_8_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5005061,size.height*0.03542121),size.width*0.1548443,paint_8_stroke);

    Paint paint_8_fill = Paint()..style=PaintingStyle.fill;
    paint_8_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5005061,size.height*0.03542121),size.width*0.1548443,paint_8_fill);

    Path path_9 = Path();
    path_9.moveTo(size.width*0.3728814,size.height*0.5613276);
    path_9.cubicTo(size.width*0.3728814,size.height*0.5410447,size.width*0.3864019,size.height*0.5215916,size.width*0.4104673,size.height*0.5072482);
    path_9.cubicTo(size.width*0.4345351,size.height*0.4929062,size.width*0.4671768,size.height*0.4848485,size.width*0.5012107,size.height*0.4848485);
    path_9.cubicTo(size.width*0.5352446,size.height*0.4848485,size.width*0.5678862,size.height*0.4929062,size.width*0.5919540,size.height*0.5072482);
    path_9.cubicTo(size.width*0.6160194,size.height*0.5215916,size.width*0.6295400,size.height*0.5410447,size.width*0.6295400,size.height*0.5613276);
    path_9.lineTo(size.width*0.5012107,size.height*0.5613276);
    path_9.lineTo(size.width*0.3728814,size.height*0.5613276);
    path_9.close();

    Paint paint_9_fill = Paint()..style=PaintingStyle.fill;
    paint_9_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_9,paint_9_fill);

    Path path_10 = Path();
    path_10.moveTo(size.width*0.3728814,size.height*0.5613276);
    path_10.cubicTo(size.width*0.3728814,size.height*0.5410447,size.width*0.3864019,size.height*0.5215916,size.width*0.4104673,size.height*0.5072482);
    path_10.cubicTo(size.width*0.4345351,size.height*0.4929062,size.width*0.4671768,size.height*0.4848485,size.width*0.5012107,size.height*0.4848485);
    path_10.cubicTo(size.width*0.5352446,size.height*0.4848485,size.width*0.5678862,size.height*0.4929062,size.width*0.5919540,size.height*0.5072482);
    path_10.cubicTo(size.width*0.6160194,size.height*0.5215916,size.width*0.6295400,size.height*0.5410447,size.width*0.6295400,size.height*0.5613276);
    path_10.lineTo(size.width*0.5012107,size.height*0.5613276);
    path_10.lineTo(size.width*0.3728814,size.height*0.5613276);
    path_10.close();

    Paint paint_10_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.009685230;
    paint_10_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawPath(path_10,paint_10_stroke);

    Paint paint_10_fill = Paint()..style=PaintingStyle.fill;
    paint_10_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_10,paint_10_fill);

    Path path_11 = Path();
    path_11.moveTo(size.width*0.06537530,size.height*0.7049062);
    path_11.cubicTo(size.width*0.06537530,size.height*0.6362107,size.width*0.1111661,size.height*0.5703276,size.width*0.1926738,size.height*0.5217518);
    path_11.cubicTo(size.width*0.2741816,size.height*0.4731775,size.width*0.3847312,size.height*0.4458874,size.width*0.5000000,size.height*0.4458874);
    path_11.cubicTo(size.width*0.6152688,size.height*0.4458874,size.width*0.7258184,size.height*0.4731775,size.width*0.8073269,size.height*0.5217518);
    path_11.cubicTo(size.width*0.8888329,size.height*0.5703276,size.width*0.9346247,size.height*0.6362107,size.width*0.9346247,size.height*0.7049062);
    path_11.lineTo(size.width*0.9302978,size.height*0.7049062);
    path_11.cubicTo(size.width*0.9302978,size.height*0.6368947,size.width*0.8849613,size.height*0.5716681,size.width*0.8042663,size.height*0.5235758);
    path_11.cubicTo(size.width*0.7235690,size.height*0.4754848,size.width*0.6141211,size.height*0.4484661,size.width*0.5000000,size.height*0.4484675);
    path_11.cubicTo(size.width*0.3858789,size.height*0.4484675,size.width*0.2764310,size.height*0.4754848,size.width*0.1957344,size.height*0.5235758);
    path_11.cubicTo(size.width*0.1150380,size.height*0.5716681,size.width*0.06970339,size.height*0.6368947,size.width*0.06970339,size.height*0.7049062);
    path_11.lineTo(size.width*0.06537530,size.height*0.7049062);
    path_11.close();

    Paint paint_11_fill = Paint()..style=PaintingStyle.fill;
    paint_11_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_11,paint_11_fill);

    Paint paint_12_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_12_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.06779661,size.height*0.7012987),Offset(size.width*0.06779661,size.height*0.9062049),paint_12_stroke);

    Paint paint_13_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_13_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.9322034,size.height*0.7012987),Offset(size.width*0.9322034,size.height*0.9062049),paint_13_stroke);

    Paint paint_14_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_14_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.3752542,size.height*0.5601732),Offset(size.width*0.2566102,size.height*0.9064935),paint_14_stroke);

    Paint paint_15_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_15_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.6270726,size.height*0.5596032),Offset(size.width*0.7432954,size.height*0.9073665),paint_15_stroke);

    Paint paint_16_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_16_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.6464891,size.height*0.6118326),Offset(size.width*0.6682809,size.height*0.6118326),paint_16_stroke);

    Paint paint_17_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_17_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*double.nan,size.height*-0.001443001),Offset(size.width*0.02179177,size.height*-0.001443001),paint_17_stroke);

    Paint paint_18_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_18_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.7167070,size.height*0.8268398),Offset(size.width*0.7409201,size.height*0.8268398),paint_18_stroke);

    Paint paint_19_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_19_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*double.nan,size.height*-0.001443001),Offset(size.width*0.02421308,size.height*-0.001443001),paint_19_stroke);

    Paint paint_20_fill = Paint()..style=PaintingStyle.fill;
    paint_20_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawRect(Rect.fromLTWH(size.width*0.6941162,size.height*0.7084805,size.width*0.04842615,size.height*0.008658009),paint_20_fill);

    Paint paint_21_fill = Paint()..style=PaintingStyle.fill;
    paint_21_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawRect(Rect.fromLTWH(0,0,size.width*0.04842615,size.height*0.008658009),paint_21_fill);

    Paint paint_22_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_22_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.4067797,size.height*0.8600289),Offset(size.width*0.5907990,size.height*0.8600289),paint_22_stroke);

    Paint paint_23_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_23_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.4963680,size.height*0.8585859),Offset(size.width*0.4963680,size.height*0.8441558),paint_23_stroke);

    Paint paint_24_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_24_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.4963680,size.height*0.8354978),size.width*0.01694915,paint_24_stroke);

    Paint paint_24_fill = Paint()..style=PaintingStyle.fill;
    paint_24_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.4963680,size.height*0.8354978),size.width*0.01694915,paint_24_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}