import 'package:flutter/material.dart';
import 'package:glovo_clone/presentation/widgets/circle_selector.dart';
import 'package:glovo_clone/presentation/widgets/drawer.dart';
import 'package:glovo_clone/presentation/widgets/search_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        //drawer: CustomDrawer(),
        appBar: AppBar(
          titleSpacing: 0.0,
          backgroundColor: Colors.amber,
          elevation: 0.0,
          actions: [
          ],
        ),
      drawer: CustomDrawer(),
    body: Column(
      children: [
        Search(),
        SizedBox(height: 90),
        CircleSpinner(),
      ],
    )
    );
  }
  }
