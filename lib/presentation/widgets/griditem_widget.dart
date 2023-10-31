import 'package:flutter/material.dart';
import 'package:glovo_clone/presentation/pages/wasabi/wasabi_page.dart';

class YourGridItemWidget extends StatelessWidget {
  final String imagePath;
  final String restaurantName;

  YourGridItemWidget({required this.imagePath, required this.restaurantName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => WasabiPage(),)
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, ),
        decoration: BoxDecoration(
          //color: Colors.blue,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 100,
              width: 300,
            ),
            SizedBox(height: 2.0),
            Text(
              restaurantName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
