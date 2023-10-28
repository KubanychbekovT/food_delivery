import 'package:flutter/material.dart';

class FastFoodPage extends StatelessWidget {
  final List<SnackSet> snackSets = [
    SnackSet(
      name: 'Гамбургер',
      description: 'Говяжья котлета, приготовленная на огне, маринованные огурчики, золотистая горчица и кетчуп на мягкой булочке, посыпанной кунжутом.',
      price: 150.00,
      imageUrl: 'assets/dishes/hamburger.jpg',
    ),
    SnackSet(
      name: 'Чизбургер',
      description: 'Говяжья котлета, приготовленная на огне, с ломтиком слегка расплавленного сыра, маринованные огурчики, золотистая горчица и кетчуп на мягкой булочке, посыпанной кунжутом.',
      price: 150.00,
      imageUrl: 'assets/dishes/cheezeburger.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 56.0), // Добавьте отступы
            child: ListView.builder(
              itemCount: snackSets.length,
              itemBuilder: (BuildContext context, int index) {
                final sushiSet = snackSets[index];
                return ListTile(
                  leading: Image.network(sushiSet.imageUrl),
                  title: Text(sushiSet.name),
                  subtitle: Text(sushiSet.description),
                  trailing: Text('${sushiSet.price.toStringAsFixed(2)}kgs'),
                );
              },
            ),
          ),
          Positioned(
            top: 20, // Расположение текста сверху
            left: 20, // Расположение текста слева
            child: Text(
              'Фаст-фуд',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class SnackSet {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  SnackSet({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}
