import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:glovo_clone/presentation/pages/food/food_page.dart';
import 'package:touchable/touchable.dart';
import '../pages/courier_page.dart';
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
    'Супермаркеты',
    'Здоровье и красота',
    'Магазины и подарки',
    'Wasabi',
    'Курьерская служба',
    'Твори Добро',
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
          child: CanvasTouchDetector(
              gesturesToOverride: [GestureType.onTapDown],
              builder: (context) {
                return CustomPaint(
                  painter: CircleSpinnerPainter(currentRotation, colors, radii,
                    texts, centerText, context, (index) {

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => buildPage(index),
                        ),
                      );
                    },),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FoodPage(),));
                      },
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
                );
              }),
        ),
      ),
    );
  }

  Widget buildPage(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return SupermarketPage();
      case 1:
        return HealthPage();
      case 2:
        return GiftsPage();
      case 3:
        return WasabiPage();
      case 4:
        return CourierPage();
      case 5:
        return FoodPage();
      default:
        return Container(); // Вернуть пустой контейнер по умолчанию
    }
  }
}

class CircleSpinnerPainter extends CustomPainter {
  final double rotation;
  final List<Color> colors;
  final List<double> radii;
  final List<String> texts;
  final String centerText;
  final BuildContext context;
  final Function(int) onItemClicked;

  CircleSpinnerPainter(this.rotation, this.colors, this.radii, this.texts,
      this.centerText, this.context, this.onItemClicked);

  @override
  void paint(Canvas canvas, Size size) {
    var myCanvas = TouchyCanvas(context, canvas);

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
      myCanvas.drawCircle(Offset(x, y), circleRadius, paint, onTapDown: (_) {
        onItemClicked(i);
      });

      // Добавляем изображение внутри круга
      // final image = Image.asset(
      //   'assets/your_image.png', // Замените 'your_image.png' на путь к вашему изображению
      //   width: circleRadius * 2,
      //   height: circleRadius * 2,
      // );
      // myCanvas.drawImageRect(
      //   image: image.image,
      //   src: Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
      //   dst: Rect.fromCenter(center: Offset(x, y), width: circleRadius * 2, height: circleRadius * 2),
      //   paint: Paint(),
      //   onTapDown: (_) {
      //     onItemClicked(i);
      //   },
      // );

      // // Рисуем текст внутри каждого круга
      final textStyle = TextStyle(
        color: Colors.black,
        fontSize: 12.0,
      );
      final textSpan = TextSpan(
        text: texts[i],
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
      );
      textPainter.layout(minWidth: 0, maxWidth: circleRadius * 2);
      textPainter.paint(canvas,
          Offset(x - textPainter.width / 2, y - textPainter.height / 2));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}