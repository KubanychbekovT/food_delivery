import 'package:flutter/material.dart';
import 'package:glovo_clone/data/restaurants.dart';
import 'package:glovo_clone/presentation/pages/wasabi/details/wasabi_details_page.dart';

class RestaurantDetailsPage extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantDetailsPage(this.restaurant);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: Center(
        child: Text("Details of ${restaurant.name}"),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Restaurant restaurant;

  CategoryCard(this.restaurant);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      color: Colors.white,
      elevation: 4.0,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => RestaurantDetailsPage(restaurant)));
        },
        child: Container(
          height: 100.0,
          padding: EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  restaurant.name,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  Icons.arrow_forward,
                  size: 24.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
