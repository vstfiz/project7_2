import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Card3D extends StatefulWidget {
  final double height;
  final double width;
  final double borderRadius;
  final Color backgroundColor;
  final Color borderColor;
  final Widget child;
  final bool dragAllowed;
  final bool autoMove;
  final Duration animDuration;
  Card3D(
      {Key key,
        this.child,
        this.dragAllowed = true,
        this.autoMove = true,
        this.width = 300.0,
        this.height = 300.0,
        this.borderRadius = 20.0,
        this.animDuration = const Duration(seconds: 5),
        Color backgroundColor,
        Color borderColor})
      : backgroundColor = backgroundColor ?? Color(0XFF180e43),
        borderColor = borderColor ?? Color(0xFF2fd6e8),
        super(key: key);
  @override
  _Card3DState createState() => _Card3DState();
}
class _Card3DState extends State<Card3D> with SingleTickerProviderStateMixin {
  Offset _angle = Offset(0, 0);
  AnimationController _animController;
  Matrix4 get _cardTransformation => Matrix4.identity()
    ..setEntry(3, 2, 0.0011) // perspective
    ..rotateX(_angle.dx)
    ..rotateY(_angle.dy);
  Offset get _shadowOffset => Offset(_angle.dy, -_angle.dx).scale(10, 10);
  double get _shinePosition => 0.3 - _angle.dy - _angle.dx * 2;
  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
        vsync: this, duration: widget.animDuration, value: 0);
    _animController.addListener(() {
      setState(() {
        final val = 2 * pi * _animController.value;
        _angle = Offset(cos(val), sin(pi / 3 + val)).scale(0.2, 0.6);
      });
    });
    _animController.repeat();
  }
  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _angle += Offset(details.delta.dy / 100, -details.delta.dx / 100);
    });
  }
  @override
  void dispose() {
    _animController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onPanUpdate: widget.dragAllowed ? _onPanUpdate : null,
        child: Transform(
            alignment: Alignment.center,
            transform: _cardTransformation,
            // CARD
            child: Container(
                width: widget.width,
                height: widget.height,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: widget.backgroundColor,
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    boxShadow: [
                      BoxShadow(
                          color: widget.borderColor,
                          blurRadius: 0,
                          spreadRadius: 0,
                          offset: _shadowOffset)
                    ]),
                child: Stack(children: [
                  // Content
                  widget.child,
                  // Shine
                  Container(
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(widget.borderRadius),
                          gradient: LinearGradient(
                              begin: Alignment(-1.0, -1.0),
                              end: Alignment(1.0, 1.0),
                              stops: [
                                _shinePosition - 1,
                                _shinePosition,
                                _shinePosition + 1
                              ],
                              colors: [
                                Colors.white.withOpacity(0),
                                Colors.white30,
                                Colors.white.withOpacity(0)
                              ])))
                ]))));
  }
}