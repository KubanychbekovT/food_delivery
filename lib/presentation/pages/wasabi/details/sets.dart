import 'package:flutter/material.dart';

class SetsPage extends StatelessWidget {
  final List<SushiSet> sushiSets = [
    SushiSet(
      name: 'Праздничный сет',
      description: 'Лосось, огурец, авокадо, филадельфия, рис',
      price: 3200.00,
      imageUrl: 'assets/dishes/set_kaliforniya_0.jpg',
    ),
    SushiSet(
      name: 'Сет "Калифорния"',
      description: 'Краб, авокадо, огурец, рис, икра масаго',
      price: 2500.00,
      imageUrl: 'assets/dishes/prazdnichnyj-set.jpg',
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
              itemCount: sushiSets.length,
              itemBuilder: (BuildContext context, int index) {
                final sushiSet = sushiSets[index];
                return ListTile(
                  leading: Image.asset(sushiSet.imageUrl),
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

class SushiSet {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  SushiSet({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}
