import 'package:flutter/material.dart';
import 'package:glovo_clone/presentation/pages/food/details/ekidos/details/fast_food.dart';
import 'package:glovo_clone/presentation/pages/food/details/ekidos/details/shaurma.dart';
import 'package:glovo_clone/presentation/pages/wasabi/details/drinks.dart';
import 'package:glovo_clone/presentation/pages/wasabi/details/sets.dart';
import 'package:glovo_clone/presentation/pages/wasabi/details/snacks.dart';

class EkidosDetailsPage extends StatefulWidget {
  const EkidosDetailsPage({super.key});

  @override
  State<EkidosDetailsPage> createState() => _EkidosDetailsPageState();
}

class _EkidosDetailsPageState extends State<EkidosDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(child: Text('Эки дос', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),)),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48.0), // Высота вкладок
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Прокрутка по горизонтали
              child: TabBar(
                isScrollable: true, // Разрешить прокрутку
                tabs: [
                  Text('ШАУРМА', style: TextStyle(fontSize: 20, color: Colors.black),),
                  Text('НАПИТКИ', style: TextStyle(fontSize: 20, color: Colors.black),),
                  Text('ФАСТ-ФУД', style: TextStyle(fontSize: 20, color: Colors.black),),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ShaurmaPage(),
            DrinksPage(),
            FastfoodPage(),
          ],
        ),
      ),
    );
  }
}
