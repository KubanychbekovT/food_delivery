import 'package:flutter/material.dart';
import 'package:glovo_clone/presentation/pages/food/details/wok/wok_details.dart';

class WokPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Image.asset(
            'assets/restaurants/wok.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 100,
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
                    Text('WoK Lagman', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),),
                    SizedBox(height: 20),
                    CategoryCard('Супы'),
                    CategoryCard('Основные блюда'),
                    CategoryCard('Лагманы'),
                    CategoryCard('Ган фан'),
                    CategoryCard('Напитки'),
                    // Добавьте другие категории здесь
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
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => WokDetailsPage()));
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