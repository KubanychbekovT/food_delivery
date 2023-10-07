import 'package:flutter/material.dart';
import 'dart:math' as math;

class SupermarketPage extends StatelessWidget {
  const SupermarketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotatingCircle(),
                RotatingCircle(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotatingCircle(),
                RotatingCircle(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RotatingCircle extends StatefulWidget {
  @override
  _RotatingCircleState createState() => _RotatingCircleState();
}

class _RotatingCircleState extends State<RotatingCircle> {
  double startRotation = 0.0;
  double currentRotation = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        startRotation = currentRotation;
      },
      onPanUpdate: (details) {
        setState(() {
          currentRotation = startRotation + details.delta.dx / 100;
        });
      },
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Transform.rotate(
          angle: currentRotation,
          child: Center(
            child: Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue, // Цвет круга
              ),
              child: Center(
                child: Text(
                  'Круг',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

