import 'package:flutter/material.dart';

class MainDishesPage extends StatelessWidget {
  final List<SushiSet> sushiSets = [
    SushiSet(
      name: 'Казан-кебаб из говядины',
      description: 'Ломтики говядины жареные по-китайски с луком и специями, подается с рисом на пару',
      price: 265.00,
      imageUrl: 'assets/dishes/kazan.jpg',
    ),
    SushiSet(
      name: 'Фри с мясом',
      description: 'Ломтики говядины жареные по-китайски с картофелем фри и луком',
      price: 265.00,
      imageUrl: 'assets/dishes/fri_meat.jpg',
    ),
    SushiSet(
      name: 'Курица в кисло-сладком соусе',
      description: 'Куриное филе в соусе "Sweet chill", отдельно подается рис на пару',
      price: 245.00,
      imageUrl: 'assets/dishes/chicken_kislo.jpg',
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
              'Основные блюда',
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
