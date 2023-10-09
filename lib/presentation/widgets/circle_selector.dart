import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../pages/courier_page.dart';
import '../pages/food_page.dart';
import '../pages/gifts_page.dart';
import '../pages/health_page.dart';
import '../pages/supermarket_page.dart';
import '../pages/wasabi/wasabi_page.dart';


class CircleSpinner extends StatefulWidget {
  @override
  _CircleSpinnerState createState() => _CircleSpinnerState();
}

class _CircleSpinnerState extends State<CircleSpinner> {
  double startRotation = 0.0;
  double currentRotation = 0.0;

  final List<String> texts = [
    'Твори Добро',
    'Супермаркеты',
    'Здоровье и красота',
    'Магазины и подарки',
    'Wasabi',
    'Курьерская служба',
  ];

  final String centerText = 'Еда';

  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
    ];

    final radii = [50.0, 50.0, 50.0, 50.0, 50.0, 50.0];

    return Center(
      child: GestureDetector(
        onTap: () {
          double normalizedRotation = currentRotation % (2 * math.pi); // Нормализуем угол к диапазону [0, 2*pi]
          int pageIndex = (normalizedRotation / (math.pi / 3)).round();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => buildPage(pageIndex),
            ),
          );
        },
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
            painter: CircleSpinnerPainter(currentRotation, colors, radii, texts, centerText),
            child: Center(
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    centerText,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPage(int pageIndex) {
    print("BuildPage $pageIndex");
    switch (pageIndex) {
      case 0:
        return WasabiPage();
      case 1:
        return SupermarketPage();
      case 2:
        return HealthPage();
      case 3:
        return GiftsPage();
      case 4:
        return WasabiPage();
      case 5:
        return CourierPage();
       default:
         return Container(); // Вернуть пустой контейнер по умолчанию
    }
  }
}

class CircleSpinnerPainter extends CustomPainter {
  final double rotation;
  final List<Color> colors;
  final List<double> radii;
  final List<String> texts; // Текст для каждого круга
  final String centerText; // Текст для центрального круга

  CircleSpinnerPainter(this.rotation, this.colors, this.radii, this.texts, this.centerText);

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = size.width / 2;

    for (int i = 0; i < 6; i++) {
      final angle = math.pi / 3 * i + rotation;
      final x = centerX + radius * math.cos(angle);
      final y = centerY + radius * math.sin(angle);

      final paint = Paint()
        ..color = colors[i % colors.length]
        ..style = PaintingStyle.fill;

      final circleRadius = radii[i % radii.length];

      // Рисуем каждый наружный круг
      canvas.drawCircle(Offset(x, y), circleRadius, paint);

      // Рисуем текст внутри каждого круга
      final textStyle = TextStyle(
        color: Colors.black,
        fontSize: 12.0,
      );
      final textSpan = TextSpan(
        text: texts[0],
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
      );
      textPainter.layout(minWidth: 0, maxWidth: circleRadius * 2);
      textPainter.paint(canvas, Offset(x - textPainter.width / 2, y - textPainter.height / 2));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}