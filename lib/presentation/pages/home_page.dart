import 'package:flutter/material.dart';
import 'package:glovo_clone/presentation/widgets/circle_selector.dart';
import 'package:glovo_clone/presentation/widgets/drawer.dart';
import 'package:glovo_clone/presentation/widgets/search_widget.dart';

import '../widgets/griditem_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> imagePaths = [
    'assets/restaurants/kulikov.png',
    'assets/restaurants/oasis.jpg',
    'assets/restaurants/okiniiri.jpg',
    'assets/dishes/sha_syr.jpg',
    'assets/dishes/kazan.jpg',
    'assets/restaurants/wok.jpg',

  ];

  List<String> restaurantNames = [
    'Kulikov',
    'Oasis',
    'Okiniiri',
    'Eki dos',
    'Faiza',
    'WoK Lagman',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      drawer: CustomDrawer(),
      appBar: AppBar(
        titleSpacing: 0.0,
        backgroundColor: Colors.amber,
        elevation: 0.0,
        title: Row(
          children: [
            Expanded(child: Search()),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: (MediaQuery.of(context).size.height - 600) / 2,
            left: (MediaQuery.of(context).size.width - 300) / 2,
            child: CircleSpinner(),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            builder: (context, scrollController) => Container(
              color: Colors.white,
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        return YourGridItemWidget(
                          imagePath: imagePaths[index % imagePaths.length],
                          restaurantName: restaurantNames[index % restaurantNames.length],
                        );
                      },
                      childCount: 6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}






