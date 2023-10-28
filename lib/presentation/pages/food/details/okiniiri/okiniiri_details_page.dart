import 'package:flutter/material.dart';
import 'package:glovo_clone/presentation/pages/food/details/okiniiri/details/fast_food.dart';
import 'package:glovo_clone/presentation/pages/food/details/wok/details/soups.dart';
import 'package:glovo_clone/presentation/pages/wasabi/details/drinks.dart';
import 'package:glovo_clone/presentation/pages/wasabi/details/sets.dart';
import 'package:glovo_clone/presentation/pages/wasabi/details/snacks.dart';

class OkiniiriDetailsPage extends StatefulWidget {
  const OkiniiriDetailsPage({super.key});

  @override
  State<OkiniiriDetailsPage> createState() => _OkiniiriDetailsPageState();
}

class _OkiniiriDetailsPageState extends State<OkiniiriDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(child: Text('Okiniiri', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),)),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48.0), // Высота вкладок
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Прокрутка по горизонтали
              child: TabBar(
                isScrollable: true, // Разрешить прокрутку
                tabs: [
                  Text('СЕТЫ', style: TextStyle(fontSize: 20, color: Colors.black),),
                  Text('ЗАКУСКИ', style: TextStyle(fontSize: 20, color: Colors.black),),
                  Text('СУПЫ', style: TextStyle(fontSize: 20, color: Colors.black),),
                  Text('НАПИТКИ', style: TextStyle(fontSize: 20, color: Colors.black),),
                  Text('РАМЕН', style: TextStyle(fontSize: 20, color: Colors.black),),
                  Text('ФАСТ-ФУД', style: TextStyle(fontSize: 20, color: Colors.black),),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            SetsPage(),
            SnackPage(),
            SoupPage(),
            DrinksPage(),
            SoupPage(),
            FastFoodPage(),


          ],
        ),
      ),
    );
  }
}
