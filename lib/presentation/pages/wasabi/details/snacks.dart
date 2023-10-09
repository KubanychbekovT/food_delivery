import 'package:flutter/material.dart';

class SnackPage extends StatelessWidget {
  final List<SnackSet> snackSets = [
    SnackSet(
      name: 'Праздничный сет',
      description: 'Лосось, огурец, авокадо, филадельфия, рис',
      price: 3200.00,
      imageUrl: 'https://example.com/philadelphia.jpg',
    ),
    SnackSet(
      name: 'Сет "Калифорния"',
      description: 'Краб, авокадо, огурец, рис, икра масаго',
      price: 2500.00,
      imageUrl: 'https://example.com/california.jpg',
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
              'Список сетов суши',
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
