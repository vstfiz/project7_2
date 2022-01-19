class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(0,0);
    path.lineTo(0,size.height);
    path.lineTo(size.width,size.height);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.5, size.width , 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) => false;
}