import 'package:flutter/material.dart';
import 'package:project7_2/custom/arc_clipper/arc_clipper.dart';

class ClippedProfileContainer extends StatelessWidget {
  final double height;
  final double width;
  final String imageUrl;

  ClippedProfileContainer({this.height, this.width,this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ArcClipper(),
        child: Container(
          height: this.height,
          width: this.width,
          decoration: BoxDecoration(
              color: Colors.orange,
              shape:BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(
                this.imageUrl,
              ),
              fit: BoxFit.cover
            )
        ),),
    );
  }
}
