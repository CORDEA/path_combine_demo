import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PathOperation _pathOperation = PathOperation.difference;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<PathOperation>(
              value: _pathOperation,
              items: PathOperation.values
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.toString()),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _pathOperation = value;
                  });
                }
              },
            ),
            SizedBox(height: 16),
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ColoredBox(color: Colors.black),
                  CustomPaint(painter: _CustomPainter(_pathOperation)),
                ],
              ),
            ),
          ],
        ),
      ),
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
