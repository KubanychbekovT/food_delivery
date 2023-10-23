import 'package:flutter/material.dart';
import 'package:glovo_clone/presentation/pages/food/details/wok/details/gan_fan.dart';
import 'package:glovo_clone/presentation/pages/food/details/wok/details/lagman.dart';
import 'package:glovo_clone/presentation/pages/food/details/wok/details/main_dishes.dart';
import 'package:glovo_clone/presentation/pages/food/details/wok/details/soups.dart';
import 'package:glovo_clone/presentation/pages/wasabi/details/drinks.dart';

class WokDetailsPage extends StatefulWidget {
  const WokDetailsPage({super.key});

  @override
  State<WokDetailsPage> createState() => _WokDetailsPageState();
}

class _WokDetailsPageState extends State<WokDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
              child: Text(
            'WoK Lagman',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
          )),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48.0), // Высота вкладок
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Прокрутка по горизонтали
              child: TabBar(
                isScrollable: true, // Разрешить прокрутку
                tabs: [
                  Text(
                    'СУПЫ',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Text(
                    'ОСНОВНЫЕ БДЮДА',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Text(
                    'ЛАГМАНЫ',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Text(
                    'ГАН ФАН',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Text(
                    'НАПИТКИ',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            SoupPage(),
            MainDishesPage(),
            LagmanPage(),
            GanFanPage(),
            DrinksPage(),
          ],
        ),
      ),
    );
  }
}