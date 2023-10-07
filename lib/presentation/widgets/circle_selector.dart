import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircleSpinner extends StatefulWidget {
  @override
  _CircleSpinnerState createState() => _CircleSpinnerState();
}

class _CircleSpinnerState extends State<CircleSpinner> {
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
      Colors.white,
      Colors.white,
      Colors.white,
      // Добавьте другие цвета по желанию
    ];

    final radii = [50.0, 50.0, 50.0, 50.0, 50.0, 50.0, 50.0, 50.0]; // Разные размеры кругов

    return Center(
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
          width: 300.0, // Увеличьте ширину
          height: 300.0, // Увеличьте высоту
          child: CustomPaint(
            painter: CircleSpinnerPainter(currentRotation, colors, radii),
            child: Center(
              child: Container(
                width: 100.0, // Увеличьте ширину центрального круга
                height: 100.0, // Увеличьте высоту центрального круга
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
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

    for (int i = 0; i < 8; i++) {
      final angle = math.pi / 4 * i + rotation;
      final x = centerX + radius * math.cos(angle);
      final y = centerY + radius * math.sin(angle);

      final paint = Paint()
        ..color = colors[i % colors.length] // Выбор цвета из списка
        ..style = PaintingStyle.fill;

      final circleRadius = radii[i % radii.length]; // Выбор радиуса из списка
      canvas.drawCircle(Offset(x, y), circleRadius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
