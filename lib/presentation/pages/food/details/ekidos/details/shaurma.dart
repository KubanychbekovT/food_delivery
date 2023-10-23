import 'package:flutter/material.dart';

class ShaurmaPage extends StatelessWidget {
  final List<SushiSet> sushiSets = [
    SushiSet(
      name: 'Шаурма с сыром',
      description: 'Лаваш, говядина, огурец, картофель, огурцы, сыр',
      price: 200.00,
      imageUrl: 'assets/dishes/sha_syr.jpg',
    ),
    SushiSet(
      name: "Шаурма запеченная",
      description: 'Лаваш, говядина, огурец, картофель, огурцы, сыр',
      price: 200.00,
      imageUrl: 'assets/dishes/zapech.jpg',
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
              'Шаурма',
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
