import 'package:flutter/material.dart';

class DrinksPage extends StatelessWidget {
  final List<SushiSet> sushiSets = [
    SushiSet(
      name: 'Pepsi (2 л.)',
      description: 'Газированный напиток',
      price: 145.00,
      imageUrl: 'assets/dishes/pepsi.jpg',
    ),
    SushiSet(
      name: 'Pepsi (1,5 л.)',
      description: 'Газированный напиток',
      price: 120.00,
      imageUrl: 'assets/dishes/pepsi.jpg',
    ),
    SushiSet(
      name: 'Pepsi (1 л.)',
      description: 'Газированный напиток',
      price: 90.00,
      imageUrl: 'assets/dishes/pepsi.jpg',
    ),

    SushiSet(
      name: "Lipton (0,5 л.)",
      description: 'Негазированный напиток',
      price: 60.00,
      imageUrl: 'assets/dishes/lipton.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 56.0),
            child: ListView.builder(
              itemCount: sushiSets.length,
              itemBuilder: (BuildContext context, int index) {
                final sushiSet = sushiSets[index];
                return Column(
                  children: [
                    ListTile(
                      leading: Image.asset(sushiSet.imageUrl),
                      title: Text(sushiSet.name),
                      subtitle: Text(sushiSet.description),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('${sushiSet.price.toStringAsFixed(2)}kgs'),
                          SizedBox(width: 8.0),
                          IconButton(
                            onPressed: () {
                              // Обработчик нажатия на кнопку
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ),
                    Divider(), // Разделитель между блюдами
                  ],
                );
              },
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: Text(
              'Напитки',
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
