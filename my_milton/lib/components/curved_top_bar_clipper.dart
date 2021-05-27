import 'package:flutter/material.dart';
import 'package:my_milton/values/constants.dart';

class CurvedTopBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - curvedTopBarCurvature);
    path.quadraticBezierTo(size.width / 2, size.height + curvedTopBarCurvature,
        size.width, size.height - curvedTopBarCurvature);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CurvedTopBarShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.lineTo(0, size.height - curvedTopBarCurvature);
    path.quadraticBezierTo(size.width / 2, size.height + curvedTopBarCurvature,
        size.width, size.height - curvedTopBarCurvature);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawShadow(path, Colors.black45, 3.0, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
