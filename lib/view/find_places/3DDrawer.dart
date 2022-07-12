import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:project7_2/view/new_ui/bottom_navigation/bottom_navigation.dart';

import '../new_ui/right_side_drawer/3DCard.dart';

class Drawer3D extends StatefulWidget {
  final Widget child;

  Drawer3D({this.child});

  @override
  _Drawer3DState createState() => _Drawer3DState();
}

class _Drawer3DState extends State<Drawer3D>
    with SingleTickerProviderStateMixin {
  var _maxSlide = 0.75;
  var _extraHeight = 0.1;
  double _startingPos;
  var _drawerVisible = false;
  AnimationController _animationController;
  Size _screen = Size(0, 0);
  CurvedAnimation _animator;
  CurvedAnimation _objAnimator;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _animator = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutQuad,
      reverseCurve: Curves.easeInQuad,
    );
    _objAnimator = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeIn,
    );
  }

  @override
  void didChangeDependencies() {
    _screen = MediaQuery.of(context).size;
    _maxSlide *= _screen.width;
    _extraHeight *= _screen.height;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onHorizontalDragStart: _onDragStart,
        onHorizontalDragUpdate: _onDragUpdate,
        onHorizontalDragEnd: _onDragEnd,
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            //Space color - it also makes the empty space touchable
            Container( decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF000000), Color(0xFF7585FF)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),),
            _buildBackground(),
            _buildDrawer(),
          ],
        ),
      ),
    );
  }

  void _onDragStart(DragStartDetails details) {
    _startingPos = details.globalPosition.dx;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    final globalDelta = details.globalPosition.dx - _startingPos;
    if (globalDelta > 0) {
      final pos = globalDelta / _screen.width;
      if (_drawerVisible && pos <= 1.0) return;
      _animationController.value = pos;
    } else {
      final pos = 1 - (globalDelta.abs() / _screen.width);
      if (!_drawerVisible && pos >= 0.0) return;
      _animationController.value = pos;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (details.velocity.pixelsPerSecond.dx.abs() > 500) {
      if (details.velocity.pixelsPerSecond.dx > 0) {
        _animationController.forward(from: _animationController.value);
        _drawerVisible = true;
      } else {
        _animationController.reverse(from: _animationController.value);
        _drawerVisible = false;
      }
      return;
    }
    if (_animationController.value > 0.5) {
      {
        _animationController.forward(from: _animationController.value);
        _drawerVisible = true;
      }
    } else {
      {
        _animationController.reverse(from: _animationController.value);
        _drawerVisible = false;
      }
    }
  }

  void _toggleDrawer() {
    if (_animationController.value < 0.5)
      _animationController.forward();
    else
      _animationController.reverse();
  }

  _buildMenuItem(String s, {bool active = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: () {},
        child: Text(
          s.toUpperCase(),
          style: TextStyle(
            fontSize: 25,
            color: active ? Color(0xffbb0000) : null,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  _buildFooterMenuItem(String s) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: () {},
        child: Text(
          s.toUpperCase(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  _buildBackground() => Positioned.fill(
    // top: -_extraHeight,
    // bottom: -_extraHeight,
    child: AnimatedBuilder(
      animation: _animator,
      builder: (context, widget) => Transform.translate(
        offset: Offset(_maxSlide * _animator.value, 0),
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY((pi / 2 + 0.1) * -_animator.value),
          alignment: Alignment.centerLeft,
          child: widget,
        ),
      ),
      child: BottomNavigation(initialPage: 1,),
    ),
  );

  _buildDrawer() => Positioned.fill(
    top: -_extraHeight,
    bottom: -_extraHeight,
    left: 0,
    right: _screen.width - _maxSlide,
    child: AnimatedBuilder(
      animation: _animator,
      builder: (context, widget) {
        return Transform.translate(
          offset: Offset(_maxSlide * (_animator.value - 1), 0),
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(pi * (1 - _animator.value) / 2),
            alignment: Alignment.centerRight,
            child: widget,
          ),
        );
      },
      child: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 50),
        children: [
          SizedBox(
            height: 200.0,
          ),
          Card3D(
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox.expand(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Football Event',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900)),
                            Text('Andheri, Mumbai',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900)),

                          ])))),
          SizedBox(
            height: 50.0,
          ),
          Card3D(
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox.expand(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Cricket Event',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900)),
                            Text('Ramghat Road, Aligarh',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900)),

                          ])))),
          SizedBox(
            height: 50.0,
          ),
          Card3D(
              child: GestureDetector(
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox.expand(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('BasketBall Event',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900)),
                              Text('Jawan, Aligarh',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900)),
                            ]))),
              )
          ),
          SizedBox(
            height: 50.0,
          ),
          Card3D(
              child: GestureDetector(
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox.expand(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('BasketBall Event',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900)),
                              Text('Jawan, Aligarh',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900)),
                            ]))),
              )
          ),
          SizedBox(
            height: 120.0,
          ),
        ],
      ),
    ),
  );
}