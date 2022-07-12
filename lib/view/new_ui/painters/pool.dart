import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PoolPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(Offset(size.width*0.5000000,0), Offset(size.width*0.5000000,size.height), [Color(0xff231F20).withOpacity(1),Color(0xff1DCFC9).withOpacity(1),Color(0xff1DCFC9).withOpacity(1),Color(0xff7585FF).withOpacity(1)], [0,0.432292,0.432292,1]);
    canvas.drawRRect(RRect.fromRectAndCorners(Rect.fromLTWH(0,0,size.width,size.height),bottomRight: Radius.circular(size.width*0.03128160),bottomLeft:  Radius.circular(size.width*0.03128160),topLeft:  Radius.circular(size.width*0.03128160),topRight:  Radius.circular(size.width*0.03128160)),paint_0_fill);

    Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
    paint_1_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawRect(Rect.fromLTWH(size.width*0.01210654,size.height*0.01587302,size.width*0.004842615,size.height*0.8802309),paint_1_fill);

    Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
    paint_2_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawRect(Rect.fromLTWH(size.width*0.9878935,size.height*0.01587302,size.width*0.004842615,size.height*0.8802309),paint_2_fill);

    Paint paint_3_fill = Paint()..style=PaintingStyle.fill;
    paint_3_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawRect(Rect.fromLTWH(size.width*0.01694915,size.height*0.8932179,size.width*0.9728596,size.height*0.002886003),paint_3_fill);

    Paint paint_4_fill = Paint()..style=PaintingStyle.fill;
    paint_4_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawRect(Rect.fromLTWH(size.width*0.01452785,size.height*0.01529105,size.width*0.9728596,size.height*0.001864257),paint_4_fill);

    Paint paint_5_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=2;
    paint_5_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.4043584,size.height*0.1746032),size.width*0.02300242,paint_5_stroke);

    Paint paint_5_fill = Paint()..style=PaintingStyle.fill;
    paint_5_fill.color = Color(0xff5D5FEF).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.4043584,size.height*0.1746032),size.width*0.02300242,paint_5_fill);

    Paint paint_6_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=2;
    paint_6_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.4285714,size.height*0.1991342),size.width*0.02300242,paint_6_stroke);

    Paint paint_6_fill = Paint()..style=PaintingStyle.fill;
    paint_6_fill.color = Color(0xff5D5FEF).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.4285714,size.height*0.1991342),size.width*0.02300242,paint_6_fill);

    Paint paint_7_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=2;
    paint_7_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.4527845,size.height*0.2236652),size.width*0.02300242,paint_7_stroke);

    Paint paint_7_fill = Paint()..style=PaintingStyle.fill;
    paint_7_fill.color = Color(0xff5D5FEF).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.4527845,size.height*0.2236652),size.width*0.02300242,paint_7_fill);

    Paint paint_8_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=2;
    paint_8_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.4769976,size.height*0.2481962),size.width*0.02300242,paint_8_stroke);

    Paint paint_8_fill = Paint()..style=PaintingStyle.fill;
    paint_8_fill.color = Color(0xff5D5FEF).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.4769976,size.height*0.2481962),size.width*0.02300242,paint_8_fill);

    Paint paint_9_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=2;
    paint_9_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5012107,size.height*0.2727273),size.width*0.02300242,paint_9_stroke);

    Paint paint_9_fill = Paint()..style=PaintingStyle.fill;
    paint_9_fill.color = Color(0xff5D5FEF).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5012107,size.height*0.2727273),size.width*0.02300242,paint_9_fill);

    Paint paint_10_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_10_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.08232446,size.height*0.4545455),size.width*0.02179177,paint_10_stroke);

    Paint paint_10_fill = Paint()..style=PaintingStyle.fill;
    paint_10_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.08232446,size.height*0.4545455),size.width*0.02179177,paint_10_fill);

    Paint paint_11_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_11_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*double.nan,size.height*double.nan),size.width*0.02179177,paint_11_stroke);

    Paint paint_11_fill = Paint()..style=PaintingStyle.fill;
    paint_11_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*double.nan,size.height*double.nan),size.width*0.02179177,paint_11_fill);

    Paint paint_12_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=2;
    paint_12_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.4527845,size.height*0.1746032),size.width*0.02300242,paint_12_stroke);

    Paint paint_12_fill = Paint()..style=PaintingStyle.fill;
    paint_12_fill.color = Color(0xff5D5FEF).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.4527845,size.height*0.1746032),size.width*0.02300242,paint_12_fill);

    Paint paint_13_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=2;
    paint_13_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.4769976,size.height*0.1991342),size.width*0.02300242,paint_13_stroke);

    Paint paint_13_fill = Paint()..style=PaintingStyle.fill;
    paint_13_fill.color = Color(0xff5D5FEF).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.4769976,size.height*0.1991342),size.width*0.02300242,paint_13_fill);

    Paint paint_14_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=2;
    paint_14_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5012107,size.height*0.2236652),size.width*0.02300242,paint_14_stroke);

    Paint paint_14_fill = Paint()..style=PaintingStyle.fill;
    paint_14_fill.color = Color(0xff5D5FEF).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5012107,size.height*0.2236652),size.width*0.02300242,paint_14_fill);

    Paint paint_15_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=2;
    paint_15_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5254237,size.height*0.2481962),size.width*0.02300242,paint_15_stroke);

    Paint paint_15_fill = Paint()..style=PaintingStyle.fill;
    paint_15_fill.color = Color(0xff5D5FEF).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5254237,size.height*0.2481962),size.width*0.02300242,paint_15_fill);

    Paint paint_16_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=2;
    paint_16_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5012107,size.height*0.1746032),size.width*0.02300242,paint_16_stroke);

    Paint paint_16_fill = Paint()..style=PaintingStyle.fill;
    paint_16_fill.color = Color(0xff5D5FEF).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5012107,size.height*0.1746032),size.width*0.02300242,paint_16_fill);

    Paint paint_17_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=2;
    paint_17_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5254237,size.height*0.1991342),size.width*0.02300242,paint_17_stroke);

    Paint paint_17_fill = Paint()..style=PaintingStyle.fill;
    paint_17_fill.color = Color(0xff5D5FEF).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5254237,size.height*0.1991342),size.width*0.02300242,paint_17_fill);

    Paint paint_18_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=2;
    paint_18_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5496368,size.height*0.2236652),size.width*0.02300242,paint_18_stroke);

    Paint paint_18_fill = Paint()..style=PaintingStyle.fill;
    paint_18_fill.color = Color(0xff5D5FEF).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5496368,size.height*0.2236652),size.width*0.02300242,paint_18_fill);

    Paint paint_19_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=2;
    paint_19_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5496368,size.height*0.1746032),size.width*0.02300242,paint_19_stroke);

    Paint paint_19_fill = Paint()..style=PaintingStyle.fill;
    paint_19_fill.color = Color(0xff5D5FEF).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5496368,size.height*0.1746032),size.width*0.02300242,paint_19_fill);

    Paint paint_20_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=2;
    paint_20_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5738499,size.height*0.1991342),size.width*0.02300242,paint_20_stroke);

    Paint paint_20_fill = Paint()..style=PaintingStyle.fill;
    paint_20_fill.color = Color(0xff5D5FEF).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5738499,size.height*0.1991342),size.width*0.02300242,paint_20_fill);

    Paint paint_21_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=2;
    paint_21_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5980630,size.height*0.1746032),size.width*0.02300242,paint_21_stroke);

    Paint paint_21_fill = Paint()..style=PaintingStyle.fill;
    paint_21_fill.color = Color(0xff5D5FEF).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5980630,size.height*0.1746032),size.width*0.02300242,paint_21_fill);

    Paint paint_22_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_22_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.1162228,size.height*0.4733045),Offset(size.width*0.1162228,size.height*0.8167388),paint_22_stroke);

    Paint paint_23_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_23_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.8934625,size.height*0.4733045),Offset(size.width*0.8934625,size.height*0.8167388),paint_23_stroke);

    Paint paint_24_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_24_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.1162228,size.height*0.09235209),Offset(size.width*0.1162228,size.height*0.4357864),paint_24_stroke);

    Paint paint_25_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_25_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.8886199,size.height*0.09378297),Offset(size.width*0.8934625,size.height*0.4357749),paint_25_stroke);

    Paint paint_26_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_26_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.09200969,size.height*0.4704185),Offset(size.width*0.09200969,size.height*0.8326118),paint_26_stroke);

    Paint paint_27_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_27_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.9176755,size.height*0.4689755),Offset(size.width*0.9176755,size.height*0.8297258),paint_27_stroke);

    Paint paint_28_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_28_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.09200969,size.height*0.07936508),Offset(size.width*0.09200969,size.height*0.4386724),paint_28_stroke);

    Paint paint_29_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_29_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.9128329,size.height*0.07646753),Offset(size.width*0.9176949,size.height*0.4401039),paint_29_stroke);

    Paint paint_30_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_30_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.08066877,size.height*0.4676061),Offset(size.width*0.1169884,size.height*0.4748211),paint_30_stroke);

    Paint paint_31_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_31_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.9233874,size.height*0.4674358),Offset(size.width*0.8919104,size.height*0.4746508),paint_31_stroke);

    Paint paint_32_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_32_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.1170370,size.height*0.4342597),Offset(size.width*0.08313874,size.height*0.4414747),paint_32_stroke);

    Paint paint_33_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_33_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.8919104,size.height*0.4344401),Offset(size.width*0.9233874,size.height*0.4416551),paint_33_stroke);

    Paint paint_34_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_34_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.5496344,size.height*0.3347287),Offset(size.width*0.5738475,size.height*0.7676291),paint_34_stroke);

    Paint paint_35_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_35_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.5496368,size.height*0.3347763),Offset(size.width*0.5496368,size.height*0.7676768),paint_35_stroke);

    Path path_36 = Path();
    path_36.moveTo(size.width*0.5738499,size.height*0.7669553);
    path_36.cubicTo(size.width*0.5738499,size.height*0.7700794,size.width*0.5723462,size.height*0.7728470,size.width*0.5700387,size.height*0.7747965);
    path_36.cubicTo(size.width*0.5677264,size.height*0.7767489,size.width*0.5647579,size.height*0.7777778,size.width*0.5617433,size.height*0.7777778);
    path_36.cubicTo(size.width*0.5587288,size.height*0.7777778,size.width*0.5557603,size.height*0.7767489,size.width*0.5534479,size.height*0.7747965);
    path_36.cubicTo(size.width*0.5511404,size.height*0.7728470,size.width*0.5496368,size.height*0.7700794,size.width*0.5496368,size.height*0.7669553);
    path_36.cubicTo(size.width*0.5496368,size.height*0.7638312,size.width*0.5511404,size.height*0.7610635,size.width*0.5534479,size.height*0.7591140);
    path_36.cubicTo(size.width*0.5557603,size.height*0.7571616,size.width*0.5587288,size.height*0.7561328,size.width*0.5617433,size.height*0.7561328);
    path_36.cubicTo(size.width*0.5647579,size.height*0.7561328,size.width*0.5677264,size.height*0.7571616,size.width*0.5700387,size.height*0.7591140);
    path_36.cubicTo(size.width*0.5723462,size.height*0.7610635,size.width*0.5738499,size.height*0.7638312,size.width*0.5738499,size.height*0.7669553);
    path_36.close();

    Paint paint_36_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_36_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawPath(path_36,paint_36_stroke);

    Paint paint_36_fill = Paint()..style=PaintingStyle.fill;
    paint_36_fill.color = Color(0xff44444D).withOpacity(1.0);
    canvas.drawPath(path_36,paint_36_fill);

    Paint paint_37_fill = Paint()..style=PaintingStyle.fill;
    paint_37_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.6707022,size.height*0.5223665),size.width*0.02421308,paint_37_fill);

    Paint paint_38_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_38_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.1210654,size.height*0.01587302),Offset(size.width*0.1210654,size.height*0.05916306),paint_38_stroke);

    Paint paint_39_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_39_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*double.nan,size.height*-0.001443001),Offset(size.width*0.07263923,size.height*-0.001443001),paint_39_stroke);

    Paint paint_40_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_40_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.8789346,size.height*0.01731602),Offset(size.width*0.8789346,size.height*0.05916306),paint_40_stroke);

    Paint paint_41_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_41_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*double.nan,size.height*-0.001443001),Offset(size.width*0.07021792,size.height*-0.001443001),paint_41_stroke);

    Paint paint_42_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_42_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.01694915,size.height*0.08080808),Offset(size.width*0.08958838,size.height*0.08080808),paint_42_stroke);

    Paint paint_43_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_43_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*double.nan,size.height*-0.001443001),Offset(size.width*0.07263923,size.height*-0.001443001),paint_43_stroke);

    Paint paint_44_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_44_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*double.nan,size.height*-0.001443001),Offset(size.width*0.07263923,size.height*-0.001443001),paint_44_stroke);

    Paint paint_45_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004842615;
    paint_45_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.9903148,size.height*0.8311688),Offset(size.width*0.9176755,size.height*0.8311688),paint_45_stroke);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}