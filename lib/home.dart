import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: SizedBox.shrink(),
    );
  }
}

class _CustomPainter extends CustomPainter {
  _CustomPainter(this._pathOperation);

  final PathOperation _pathOperation;

  final _paint = Paint()
    ..color = Colors.orange
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty) {
      return;
    }

    final centerX = size.width / 2;
    final centerY = size.height / 2;

    final path = Path.combine(
      _pathOperation,
      Path()
        ..addOval(Rect.fromCircle(
          center: Offset(centerX - 50, centerY),
          radius: 100,
        ))
        ..close(),
      Path()
        ..addOval(Rect.fromCircle(
          center: Offset(centerX + 50, centerY),
          radius: 100,
        ))
        ..close(),
    );

    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
