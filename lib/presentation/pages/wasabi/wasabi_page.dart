import 'package:flutter/material.dart';
import 'package:glovo_clone/presentation/pages/wasabi/details/wasabi_details_page.dart';

class WasabiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          CategoryCard('Сеты'),
          CategoryCard('Закуски'),
          CategoryCard('Комбо'),
          CategoryCard('Роллы'),
          CategoryCard('Горячие блюда'),
          CategoryCard('Напитки'),
          // Добавьте другие категории здесь
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
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => WasabiDetailsPage()));
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
