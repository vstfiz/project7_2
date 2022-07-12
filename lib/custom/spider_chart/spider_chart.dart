import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' show pi, cos, sin;

class SpiderChart extends StatelessWidget {
  final List<double> data;
  final double maxValue;
  final List<Color> colors;
  final List<String> labels;
  final decimalPrecision;
  final Size size;
  final double fallbackHeight;
  final double fallbackWidth;

  SpiderChart({
    Key key,
    @required this.data,
    @required this.colors,
    @required this.maxValue,
    this.labels,
    this.size = Size.infinite,
    this.decimalPrecision = 0,
    this.fallbackHeight = 200,
    this.fallbackWidth = 200,
  })  : assert(data.length == colors.length,
  'Length of data and color lists must be equal'),
        assert(labels != null ? data.length == labels.length : true,
        'Length of data and labels lists must be equal'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxWidth: fallbackWidth,
      maxHeight: fallbackHeight,
      child: CustomPaint(
        size: size,
        painter: SpiderChartPainter(
            data, maxValue, colors, labels, decimalPrecision),
      ),
    );
  }
}

class SpiderChartPainter extends CustomPainter {
  final List<double> data;
  final double maxNumber;
  final List<Color> colors;
  final List<String> labels;
  final decimalPrecision;

  final Paint spokes = Paint()..color = Colors.grey;

  final Paint fill = Paint()
    ..color = Colors.white.withOpacity(0.2)
    ..style = PaintingStyle.fill;

  final Paint stroke = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.stroke;

  SpiderChartPainter(this.data, this.maxNumber, this.colors, this.labels,
      this.decimalPrecision);

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = size.center(Offset.zero);

    double angle = (2 * pi) / data.length;

    var dataPoints = List<Offset>();

    for (var i = 0; i < data.length; i++) {
      var scaledRadius = (data[i] / maxNumber) * center.dy;
      var x = scaledRadius * cos(angle * i - pi / 2);
      var y = scaledRadius * sin(angle * i - pi / 2);

      dataPoints.add(Offset(x, y) + center);
    }

    // var outerPoints = List<Offset>();
    //
    // for (var i = 0; i < data.length; i++) {
    //   var x = center.dy * cos(angle * i - pi / 2);
    //   var y = center.dy * sin(angle * i - pi / 2);
    //
    //   outerPoints.add(Offset(x, y) + center);
    // }

    // if (this.labels != null) {
    //   paintLabels(canvas, center, outerPoints, this.labels);
    // }
    // paintGraphOutline(canvas, center, outerPoints);
    paintDataLines(canvas, dataPoints);
    paintDataPoints(canvas, dataPoints);
    paintText(canvas, center, dataPoints, data);
  }

  void paintDataLines(Canvas canvas, List<Offset> points) {
    Path path = Path()..addPolygon(points, true);

    canvas.drawPath(
      path,
      fill,
    );

    canvas.drawPath(path, stroke);
  }

  void paintDataPoints(Canvas canvas, List<Offset> points) {
    for (var i = 0; i < points.length; i++) {
      canvas.drawCircle(points[i], 4.0, Paint()..color = colors[i]);
    }
  }

  void paintText(
      Canvas canvas, Offset center, List<Offset> points, List<double> data) {
    var textPainter = TextPainter(textDirection: TextDirection.ltr);
    for (var i = 0; i < points.length; i++) {
      String s = data[i].toStringAsFixed(decimalPrecision);
      textPainter.text =
          TextSpan(text: s, style: TextStyle(color: Colors.black));
      textPainter.layout();
      if (points[i].dx < center.dx) {
        textPainter.paint(
            canvas, points[i].translate(-(textPainter.size.width + 5.0), 0));
      } else if (points[i].dx > center.dx) {
        textPainter.paint(canvas, points[i].translate(5.0, 0));
      } else if (points[i].dy < center.dy) {
        textPainter.paint(
            canvas, points[i].translate(-(textPainter.size.width / 2), -20));
      } else {
        textPainter.paint(
            canvas, points[i].translate(-(textPainter.size.width / 2), 4));
      }
    }
  }

  void paintGraphOutline(Canvas canvas, Offset center, List<Offset> points) {
    for (var i = 0; i < points.length; i++) {
      canvas.drawLine(center, points[i], spokes);
    }

    //TODO: this could cause a rendering issue later if the rendering order is ever changed
    //        using the spread operator in 'drawPoints' would fix this, but would require a
    //        dart version bump.
    points.add(points[0]);

    canvas.drawPoints(PointMode.polygon, points, spokes);
    canvas.drawCircle(center, 2, spokes);
  }

  void paintLabels(
      Canvas canvas, Offset center, List<Offset> points, List<String> labels) {
    var textPainter = TextPainter(textDirection: TextDirection.ltr);
    var textStyle =
    TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold);

    for (var i = 0; i < points.length; i++) {
      textPainter.text = TextSpan(text: labels[i], style: textStyle);
      textPainter.layout();
      if (points[i].dx < center.dx) {
        textPainter.paint(
            canvas, points[i].translate(-(textPainter.size.width + 5.0), -15));
      } else if (points[i].dx > center.dx) {
        textPainter.paint(canvas, points[i].translate(5.0, -15));
      } else if (points[i].dy < center.dy) {
        textPainter.paint(
            canvas, points[i].translate(-(textPainter.size.width / 2), -35));
      } else {
        textPainter.paint(
            canvas, points[i].translate(-(textPainter.size.width / 2), 20));
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}