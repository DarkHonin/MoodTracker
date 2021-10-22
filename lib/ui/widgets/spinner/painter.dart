import 'package:flutter/material.dart';

class SpinnerPainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Offset of = Offset(size.width, size.height);
    Paint p = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    canvas.drawCircle(of, 20, p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
