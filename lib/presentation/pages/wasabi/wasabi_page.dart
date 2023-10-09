import 'package:flutter/material.dart';
import 'package:glovo_clone/presentation/pages/supermarket_page.dart';
import 'package:glovo_clone/presentation/pages/wasabi/details/wasabi_details_page.dart';

class WasabiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Категории'),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          CategoryCard('Сеты'),
          CategoryCard('Закуски'),
          CategoryCard('Комбо'),
          CategoryCard('Роллы'),
          CategoryCard('Теплые Роллы'),
          CategoryCard('Горячие блюда'),
          CategoryCard('Пиццы'),
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
      color: Colors.white, // Установка белого цвета
      elevation: 4.0,
      child: InkWell(
        onTap: () {
          // Здесь можно добавить действие при нажатии на категорию
          // Например, навигацию на другую страницу
          // Пример:
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => WasabiDetailsPage()));
        },
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                categoryName.toUpperCase(),
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black, // Текст будет черным
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.arrow_forward,
                size: 24.0,
                color: Colors.black, // Цвет стрелки
              ),
            ),
          ],
        ),
      ),
    );
  }
}
