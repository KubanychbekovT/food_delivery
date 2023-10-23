import 'package:flutter/material.dart';
import 'package:glovo_clone/presentation/pages/food/details/ekidos/ekidos_details.dart';

class EkidosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        children: [
          Image.asset(
            'assets/dishes/sha_syr.jpg',
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
                  Text('Эки Дос', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),),
                  SizedBox(height: 20),
                  CategoryCard('Шаурма'),
                  CategoryCard('Напитки'),
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
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => EkidosDetailsPage()));
        },
        child: Container(
          // Оберните текст и иконку контейнером
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
