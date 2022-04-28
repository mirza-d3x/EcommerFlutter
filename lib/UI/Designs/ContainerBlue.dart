import 'package:flutter/material.dart';

class ContainerBlue extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final polyPaint1 = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path();
    path.addPolygon([
      Offset(0, size.height * .45),
      Offset(size.width, size.height * .30),
      Offset(size.width, size.height),
      Offset(0, size.height),
    ], true);

    canvas.drawPath(path, polyPaint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
