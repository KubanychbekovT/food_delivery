import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:glovo_clone/presentation/pages/food/details/ekidos/eki_dos.dart';
import 'package:glovo_clone/presentation/pages/food/details/restaurant/restaurants.dart';
import 'package:glovo_clone/presentation/pages/food/details/wok/wok.dart';
import 'package:glovo_clone/presentation/widgets/search_widget.dart';
import 'package:touchable/touchable.dart';
import 'details/okiniiri/okiniiri.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  double startRotation = 0.0;
  double currentRotation = 0.0;

  final List<String> texts = [
    'Комбо с Кока-кола',
    'Eki Dos',
    'Okiniiri',
    'Рестораны',
    'Wok Lagman',
  ];


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
      body: Column(
        children: [
          SizedBox(height: 50),
          Search(),
          SizedBox(height: 150),
          Center(
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
                          texts, context, (index) {

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => buildPage(index),
                              ),
                            );
                          },),

                      );
                    }),
              ),
            ),
          ),
          SizedBox(height: 80),
          Text('Еда', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 24),),

        ],
      ),
    );
  }

  Widget buildPage(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return RestaurantsPage();
      case 1:
        return EkidosPage();
      case 2:
        return OkiniiriPage();
      case 3:
        return RestaurantsPage();
      case 4:
        return WokPage();
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
  final BuildContext context;
  final Function(int) onItemClicked;

  CircleSpinnerPainter(this.rotation, this.colors, this.radii, this.texts,
       this.context, this.onItemClicked);

  @override
  void paint(Canvas canvas, Size size) {
    var myCanvas = TouchyCanvas(context, canvas);

    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = size.width / 2;

    for (int i = 0; i < 5; i++) {
      final angle = 2 * math.pi / 5 * i + rotation;
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

      // // Рисуем текст внутри каждого круга
      final textStyle = TextStyle(
        color: Colors.black,
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
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