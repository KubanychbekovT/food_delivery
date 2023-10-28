import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glovo_clone/presentation/pages/gifts_page.dart';
import 'package:glovo_clone/presentation/pages/health_page.dart';
import 'package:glovo_clone/presentation/pages/supermarket_page.dart';
import 'package:glovo_clone/presentation/pages/wasabi/wasabi_page.dart';
import 'package:touchable/touchable.dart';
import 'dart:ui' as ui;

import '../pages/courier_page.dart';
import '../pages/food/food_page.dart';



class CircleSpinner extends StatefulWidget {
  @override
  _CircleSpinnerState createState() => _CircleSpinnerState();
}

class _CircleSpinnerState extends State<CircleSpinner> {
  double startRotation = 0.0;
  double currentRotation = 0.0;

  final List<ui.Image> images = [];
  final List<String> imagePaths = [
    // 'assets/icons/super.png',
    // 'assets/icons/health.png',
    // 'assets/icons/gift.png',
    // 'assets/icons/wasabiic.png',
    // 'assets/icons/courier.png',
    // 'assets/icons/charity.jpg',
    // Добавьте пути к другим изображениям, если необходимо
  ];

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
  void initState() {
    super.initState();
    loadImages();
  }

  Future<void> loadImages() async {
    for (String imagePath in imagePaths) {
      final ui.Image image = await loadImage(imagePath);
      images.add(image);
    }

    setState(() {});
  }

  Future<ui.Image> loadImage(String imagePath) async {
    final ByteData data = await rootBundle.load(imagePath);
    final Uint8List bytes = data.buffer.asUint8List();
    final ui.Codec codec = await ui.instantiateImageCodec(bytes);
    final ui.FrameInfo frameInfo = await codec.getNextFrame();
    return frameInfo.image;
  }

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
                painter: CircleSpinnerPainter(currentRotation, colors, radii, texts, centerText, context, (index) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => buildPage(index),
                    ),
                  );
                }, images),
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
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
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
        return Container();
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
  final List<ui.Image> images;

  CircleSpinnerPainter(this.rotation, this.colors, this.radii, this.texts, this.centerText, this.context, this.onItemClicked, this.images);

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

      myCanvas.drawCircle(Offset(x, y), circleRadius, paint, onTapDown: (_) {
        onItemClicked(i);
      });

      final textStyle = TextStyle(
        color: Colors.black,
        fontSize: 14.0,
        fontWeight: FontWeight.bold
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

      if (i < images.length) {
        final ui.Image image = images[i];
        final imageRect = Rect.fromCenter(
          center: Offset(x, y),
          width: circleRadius * 0.8,
          height: circleRadius * 0.8,
        );
        canvas.drawImageRect(image, imageRect, imageRect, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
