import 'dart:ui';
import 'package:flutter/cupertino.dart';

class TrapeziumClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size)  {
    Path path = Path();
    path.lineTo(size.width, size.height * 0.05);
    path.cubicTo(size.width, size.height * 0.02, size.width * 0.97, 0, size.width * 0.93, 0);
    path.cubicTo(size.width * 0.93, 0, size.width * 0.07, 0, size.width * 0.07, 0);
    path.cubicTo(size.width * 0.03, 0, 0, size.height * 0.02, 0, size.height * 0.05);
    path.cubicTo(0, size.height * 0.05, 0, size.height * 0.89, 0, size.height * 0.89);
    path.cubicTo(0, size.height * 0.92, size.width * 0.04, size.height * 0.94, size.width * 0.08, size.height * 0.94);
    path.cubicTo(size.width * 0.08, size.height * 0.94, size.width * 0.31, size.height * 0.94, size.width * 0.31, size.height * 0.94);
    path.cubicTo(size.width * 0.34, size.height * 0.94, size.width * 0.37, size.height * 0.96, size.width * 0.39, size.height * 0.98);
    path.cubicTo(size.width * 0.39, size.height * 0.98, size.width * 0.39, size.height * 0.98, size.width * 0.39, size.height * 0.98);
    path.cubicTo(size.width * 0.4, size.height, size.width * 0.42, size.height, size.width * 0.44, size.height);
    path.cubicTo(size.width * 0.44, size.height, size.width * 0.56, size.height, size.width * 0.56, size.height);
    path.cubicTo(size.width * 0.58, size.height, size.width * 0.6, size.height, size.width * 0.61, size.height * 0.97);
    path.cubicTo(size.width * 0.61, size.height * 0.97, size.width * 0.61, size.height * 0.97, size.width * 0.61, size.height * 0.97);
    path.cubicTo(size.width * 0.63, size.height * 0.96, size.width * 0.65, size.height * 0.95, size.width * 0.68, size.height * 0.94);
    path.cubicTo(size.width * 0.68, size.height * 0.94, size.width * 0.92, size.height * 0.94, size.width * 0.92, size.height * 0.94);
    path.cubicTo(size.width * 0.96, size.height * 0.94, size.width, size.height * 0.92, size.width, size.height * 0.89);
    path.cubicTo(size.width, size.height * 0.89, size.width, size.height * 0.05, size.width, size.height * 0.05);
    path.cubicTo(size.width, size.height * 0.05, size.width, size.height * 0.05, size.width, size.height * 0.05);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) => false;
}