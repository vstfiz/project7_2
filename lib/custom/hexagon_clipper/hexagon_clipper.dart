import 'package:flutter/cupertino.dart';

class HexagonClipper extends CustomClipper<Path> {
  final double radius = 30;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width*0.6012044,size.height*0.03210370);
    path.lineTo(size.width*0.8940857,size.height*0.1853750);
    path.cubicTo(size.width*0.9576824,size.height*0.2186570,size.width*0.9968604,size.height*0.2801640,size.width*0.9968604,size.height*0.3467280);
    path.lineTo(size.width*0.9968604,size.height*0.6532710);
    path.cubicTo(size.width*0.9968604,size.height*0.7198350,size.width*0.9576824,size.height*0.7813420,size.width*0.8940857,size.height*0.8146240);
    path.lineTo(size.width*0.6012044,size.height*0.9678950);
    path.cubicTo(size.width*0.5376077,size.height*1.001180,size.width*0.4592527,size.height*1.001180,size.width*0.3956560,size.height*0.9678950);
    path.lineTo(size.width*0.1027745,size.height*0.8146240);
    path.cubicTo(size.width*0.03917747,size.height*0.7813420,0,size.height*0.7198350,0,size.height*0.6532710);
    path.lineTo(0,size.height*0.3467280);
    path.cubicTo(0,size.height*0.2801640,size.width*0.03917747,size.height*0.2186570,size.width*0.1027745,size.height*0.1853750);
    path.lineTo(size.width*0.3956560,size.height*0.03210370);
    path.cubicTo(size.width*0.4592527,size.height*-0.001178130,size.width*0.5376077,size.height*-0.001178130,size.width*0.6012044,size.height*0.03210370);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) => false;
}