import 'package:flutter/material.dart';
import 'package:glovo_clone/presentation/pages/food/details/okiniiri/okiniiri_details_page.dart';
import 'package:glovo_clone/presentation/pages/wasabi/details/wasabi_details_page.dart';

class OkiniiriPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Image.asset(
            'assets/restaurants/okiniiri.jpg',
            fit: BoxFit.cover,
            height: 100,
            width: double.infinity,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: ListView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(16.0),
                children: <Widget>[
                  Text('Okiniiri', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),),
                  SizedBox(height: 20),
                  CategoryCard('Сеты'),
                  CategoryCard('Закуски'),
                  CategoryCard('Супы'),
                  CategoryCard('Напитки'),
                  CategoryCard('Рамен'),
                  CategoryCard('Фаст-фуд'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String categoryName;

  CategoryCard(this.categoryName);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      color: Colors.white,
      elevation: 4.0,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => OkiniiriDetailsPage()));
        },
        child: Container( // Оберните текст и иконку контейнером
          height: 100.0, // Задайте желаемую высоту
          padding: EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  categoryName.toUpperCase(),
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  Icons.arrow_forward,
                  size: 24.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
