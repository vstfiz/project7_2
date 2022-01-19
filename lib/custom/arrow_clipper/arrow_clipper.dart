import 'package:flutter/cupertino.dart';

class ArrowClipper extends CustomClipper<Path> {
  final double radius;
  ArrowClipper(this.radius);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0,size.height);
    path.lineTo(size.width,size.height);
    path.lineTo(size.width,15+ this.radius);
    path.quadraticBezierTo(size.width,15,size.width-this.radius,15);
    path.lineTo(size.width * 0.54,15);
    path.lineTo(size.width * 0.5,0);
    path.lineTo(size.width * 0.46,15);
    path.lineTo(this.radius,15);
    path.quadraticBezierTo(0,15,0,15+this.radius);
    path.lineTo(0,15);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) => false;
}