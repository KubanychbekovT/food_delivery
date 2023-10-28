import 'package:flutter/material.dart';
import 'package:glovo_clone/data/restaurants.dart';
import 'package:glovo_clone/presentation/pages/wasabi/wasabi_page.dart';

class CocaColaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        title: Text(
          'Комбо с Кока-кола',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Место или продукт',
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: restaurants.map((restaurant) {
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => WasabiPage(),
                      ));
                    },
                    child: ClipRRect(
                      // Оборачиваем изображение в ClipRRect
                      borderRadius: BorderRadius.circular(
                          16.0), // Задаем радиус скругления углов
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            restaurant.imageUrl,
                            width: double.infinity,
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 8.0),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              restaurant.name,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
