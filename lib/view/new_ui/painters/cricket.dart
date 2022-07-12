import 'dart:ui' as ui;
import 'dart:ui';
import 'package:flutter/material.dart';



//Copy this CustomPainter code to the Bottom of the File
class CricketPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(Offset(size.width*0.5000000,0), Offset(size.width*0.5000000,size.height), [Color(0xff231F20).withOpacity(1),Color(0xff1DCFC9).withOpacity(1),Color(0xff1DCFC9).withOpacity(1),Color(0xff7585FF).withOpacity(1)], [0,0.432292,0.432292,1]);
    canvas.drawRRect(RRect.fromRectAndCorners(Rect.fromLTWH(0,0,size.width,size.height),bottomRight: Radius.circular(size.width*0.03120604),bottomLeft:  Radius.circular(size.width*0.03120604),topLeft:  Radius.circular(size.width*0.03120604),topRight:  Radius.circular(size.width*0.03120604)),paint_0_fill);

    Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
    paint_1_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawRect(Rect.fromLTWH(size.width*0.01207737,size.height*-0.04040404,size.width*0.004830918,size.height*0.9480519),paint_1_fill);

    Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
    paint_2_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawRect(Rect.fromLTWH(size.width*0.9855072,size.height*-0.04040404,size.width*0.004830918,size.height*0.9480519),paint_2_fill);

    Paint paint_3_fill = Paint()..style=PaintingStyle.fill;
    paint_3_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawRect(Rect.fromLTWH(size.width*0.01449275,size.height*0.9062049,size.width*0.9705097,size.height*0.001864257),paint_3_fill);

    Paint paint_4_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004830918;
    paint_4_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.3381643,size.height*0.5295815),Offset(size.width*0.6666667,size.height*0.5295815),paint_4_stroke);

    Paint paint_5_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004830918;
    paint_5_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.3019324,size.height*0.4401154),Offset(size.width*0.7028986,size.height*0.4401154),paint_5_stroke);

    Paint paint_6_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004830918;
    paint_6_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.3043478,size.height*0.6204906),Offset(size.width*0.7053140,size.height*0.6204906),paint_6_stroke);

    Paint paint_7_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004830918;
    paint_7_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.3405797,size.height*0.4401154),Offset(size.width*0.3405797,size.height*0.6219336),paint_7_stroke);

    Paint paint_8_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004830918;
    paint_8_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.4710145,size.height*0.3867244),Offset(size.width*0.4710145,size.height*0.5310245),paint_8_stroke);

    Paint paint_9_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004830918;
    paint_9_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.4927536,size.height*0.3867244),Offset(size.width*0.4927536,size.height*0.5310245),paint_9_stroke);

    Paint paint_10_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004830918;
    paint_10_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.5169082,size.height*0.3867244),Offset(size.width*0.5169082,size.height*0.5310245),paint_10_stroke);

    Path path_11 = Path();
    path_11.moveTo(size.width*0.6666667,size.height*0.4415584);
    path_11.lineTo(size.width*0.6666667,size.height*0.6219336);

    Paint paint_11_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004830918;
    paint_11_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawPath(path_11,paint_11_stroke);

    Paint paint_11_fill = Paint()..style=PaintingStyle.fill;
    paint_11_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_11,paint_11_fill);

    Paint paint_12_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007246377;
    paint_12_stroke.color=Colors.white.withOpacity(1.0);
    paint_12_stroke.strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(size.width*0.4722222,size.height*0.3845599),Offset(size.width*0.4891304,size.height*0.3845599),paint_12_stroke);

    Paint paint_13_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007246377;
    paint_13_stroke.color=Colors.white.withOpacity(1.0);
    paint_13_stroke.strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(size.width*0.4939614,size.height*0.4451659),Offset(size.width*0.5108696,size.height*0.4451659),paint_13_stroke);

    Paint paint_14_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004830918;
    paint_14_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.3019324,size.height*0.1010101),Offset(size.width*0.3019324,size.height*0.6219336),paint_14_stroke);

    Paint paint_15_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004830918;
    paint_15_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.7053140,size.height*0.1010101),Offset(size.width*0.7053140,size.height*0.6219336),paint_15_stroke);

    Paint paint_16_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004830918;
    paint_16_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.09178744,size.height*0.02164502),Offset(size.width*0.09178744,size.height*0.6204906),paint_16_stroke);

    Paint paint_17_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.004830918;
    paint_17_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.9154589,size.height*0.02164502),Offset(size.width*0.9154589,size.height*0.6204906),paint_17_stroke);

    Path path_18 = Path();
    path_18.moveTo(size.width*0.9178744,size.height*0.6298701);
    path_18.cubicTo(size.width*0.9178744,size.height*0.6966522,size.width*0.8742295,size.height*0.7606999,size.width*0.7965435,size.height*0.8079221);
    path_18.cubicTo(size.width*0.7188551,size.height*0.8551443,size.width*0.6134903,size.height*0.8816739,size.width*0.5036232,size.height*0.8816739);
    path_18.cubicTo(size.width*0.3937560,size.height*0.8816739,size.width*0.2883913,size.height*0.8551443,size.width*0.2107034,size.height*0.8079221);
    path_18.cubicTo(size.width*0.1330162,size.height*0.7606999,size.width*0.08937198,size.height*0.6966522,size.width*0.08937198,size.height*0.6298701);
    path_18.lineTo(size.width*0.09416691,size.height*0.6298701);
    path_18.cubicTo(size.width*0.09416691,size.height*0.6958802,size.width*0.1373058,size.height*0.7591861,size.width*0.2140937,size.height*0.8058615);
    path_18.cubicTo(size.width*0.2908816,size.height*0.8525368,size.width*0.3950290,size.height*0.8787590,size.width*0.5036232,size.height*0.8787590);
    path_18.cubicTo(size.width*0.6122174,size.height*0.8787590,size.width*0.7163647,size.height*0.8525368,size.width*0.7931522,size.height*0.8058615);
    path_18.cubicTo(size.width*0.8699396,size.height*0.7591861,size.width*0.9130797,size.height*0.6958802,size.width*0.9130797,size.height*0.6298701);
    path_18.lineTo(size.width*0.9178744,size.height*0.6298701);
    path_18.close();

    Paint paint_18_fill = Paint()..style=PaintingStyle.fill;
    paint_18_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_18,paint_18_fill);

    Path path_19 = Path();
    path_19.moveTo(size.width*0.9178744,size.height*0.6298701);
    path_19.cubicTo(size.width*0.9178744,size.height*0.6966522,size.width*0.8742295,size.height*0.7606999,size.width*0.7965435,size.height*0.8079221);
    path_19.cubicTo(size.width*0.7188551,size.height*0.8551443,size.width*0.6134903,size.height*0.8816739,size.width*0.5036232,size.height*0.8816739);
    path_19.cubicTo(size.width*0.3937560,size.height*0.8816739,size.width*0.2883913,size.height*0.8551443,size.width*0.2107034,size.height*0.8079221);
    path_19.cubicTo(size.width*0.1330162,size.height*0.7606999,size.width*0.08937198,size.height*0.6966522,size.width*0.08937198,size.height*0.6298701);
    path_19.lineTo(size.width*0.09416691,size.height*0.6298701);
    path_19.cubicTo(size.width*0.09416691,size.height*0.6958802,size.width*0.1373058,size.height*0.7591861,size.width*0.2140937,size.height*0.8058615);
    path_19.cubicTo(size.width*0.2908816,size.height*0.8525368,size.width*0.3950290,size.height*0.8787590,size.width*0.5036232,size.height*0.8787590);
    path_19.cubicTo(size.width*0.6122174,size.height*0.8787590,size.width*0.7163647,size.height*0.8525368,size.width*0.7931522,size.height*0.8058615);
    path_19.cubicTo(size.width*0.8699396,size.height*0.7591861,size.width*0.9130797,size.height*0.6958802,size.width*0.9130797,size.height*0.6298701);
    path_19.lineTo(size.width*0.9178744,size.height*0.6298701);
    path_19.close();

    Paint paint_19_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.009661836;
    paint_19_stroke.color=Colors.white.withOpacity(1.0);
    canvas.drawPath(path_19,paint_19_stroke);

    Paint paint_19_fill = Paint()..style=PaintingStyle.fill;
    paint_19_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_19,paint_19_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}