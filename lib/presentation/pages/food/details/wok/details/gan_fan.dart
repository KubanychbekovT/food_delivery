import 'package:flutter/material.dart';

class GanFanPage extends StatelessWidget {
  final List<SushiSet> sushiSets = [
    SushiSet(
      name: 'Сливочный Ган-фан',
      description: 'Куриное филе, сливочный соус, рис',
      price: 265.00,
      imageUrl: 'assets/dishes/sliv_ganfan.jpeg',
    ),
    SushiSet(
      name: 'Могуру Ган-фан',
      description: 'Рис на пару, полугорький перец, пекинская капуста, лук, сельдерей',
      price: 265.00,
      imageUrl: 'assets/dishes/moguru.jpg',
    ),
    SushiSet(
      name: 'Гуйру Ган-фан',
      description: 'Рис на пару, полугорький перец, пекинская капуста, лук, сельдерей',
      price: 245.00,
      imageUrl: 'assets/dishes/moguru.jpg',
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
              'Ган-фан',
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
