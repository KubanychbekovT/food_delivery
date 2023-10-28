import 'package:flutter/material.dart';
import 'package:glovo_clone/presentation/pages/wasabi/details/drinks.dart';
import 'package:glovo_clone/presentation/pages/wasabi/details/sets.dart';
import 'package:glovo_clone/presentation/pages/wasabi/details/snacks.dart';

class WasabiDetailsPage extends StatefulWidget {
  const WasabiDetailsPage({super.key});

  @override
  State<WasabiDetailsPage> createState() => _WasabiDetailsPageState();
}

class _WasabiDetailsPageState extends State<WasabiDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Center(child: Text('Wasabi', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),)),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(48.0), // Высота вкладок
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Прокрутка по горизонтали
                child: TabBar(
                  isScrollable: true, // Разрешить прокрутку
                  tabs: [
                    Text('СЕТЫ', style: TextStyle(fontSize: 20, color: Colors.black),),
                    Text('ЗАКУСКИ', style: TextStyle(fontSize: 20, color: Colors.black),),
                    Text('КОМБО', style: TextStyle(fontSize: 20, color: Colors.black),),
                    Text('РОЛЛЫ', style: TextStyle(fontSize: 20, color: Colors.black),),
                    Text('ГОРЯЧИЕ БЛЮДА', style: TextStyle(fontSize: 20, color: Colors.black),),
                    Text('НАПИТКИ', style: TextStyle(fontSize: 20, color: Colors.black),),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              SetsPage(),
              SnackPage(),
              DrinksPage()
            ],
          ),
        ),
    );
  }
}
