import 'package:flutter/material.dart';
import 'dart:math' as math;

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  double startRotation = 0.0;
  double currentRotation = 0.0;

  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
    ];

    final radii = [50.0, 50.0, 50.0, 50.0, 50.0];

    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: GestureDetector(
          onPanStart: (details) {
            startRotation = currentRotation;
          },
          onPanUpdate: (details) {
            setState(() {
              currentRotation = startRotation + details.delta.dx / 100;
            });
          },
          child: Container(
            width: 300.0,
            height: 300.0,
            child: CustomPaint(
              painter: CircleSpinnerPainter(currentRotation, colors, radii),
            ),
          ),
        ),
      ),
    );
  }
}

class CircleSpinnerPainter extends CustomPainter {
  final double rotation;
  final List<Color> colors;
  final List<double> radii;

  CircleSpinnerPainter(this.rotation, this.colors, this.radii);

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = size.width / 2;

    for (int i = 0; i < 5; i++) {
      final angle = 2 * math.pi / 5 * i + rotation; // Исправлено здесь
      final x = centerX + radius * math.cos(angle);
      final y = centerY + radius * math.sin(angle);

      final paint = Paint()
        ..color = colors[i % colors.length]
        ..style = PaintingStyle.fill;

      final circleRadius = radii[i % radii.length];

      canvas.drawCircle(Offset(x, y), circleRadius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
