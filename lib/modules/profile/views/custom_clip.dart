import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(size.width, 0);
    path0.quadraticBezierTo(size.width, size.height * 0.6446679, size.width,
        size.height * 0.8595571);
    path0.cubicTo(
        size.width * 0.7444333,
        size.height * 0.2951143,
        size.width * 0.1305833,
        size.height * 1.1260714,
        0,
        size.height * 0.8595286);
    path0.quadraticBezierTo(size.width * -0.1566583, size.height * 0.5123429, 0,
        size.height * 0.8571429);
    path0.lineTo(0, size.height * 0.8571429);
    path0.lineTo(0, 0);
    path0.close();
    return path0;
    // canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
