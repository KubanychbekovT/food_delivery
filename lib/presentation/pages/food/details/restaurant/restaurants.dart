import 'package:flutter/material.dart';
import 'package:glovo_clone/data/restaurants.dart';
import 'package:glovo_clone/presentation/pages/food/details/okiniiri/okiniiri_details_page.dart';
import 'package:glovo_clone/presentation/pages/food/details/restaurant/promo.dart';
import 'package:glovo_clone/presentation/pages/food/details/restaurant/restaurant_details_page.dart';
import 'package:glovo_clone/presentation/pages/wasabi/wasabi_page.dart';

import '../okiniiri/okiniiri.dart';

class RestaurantsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop(); // Возврат на предыдущую страницу
          },
        ),
        title: Text(
          'Рестораны',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Поиск ресторанов',
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Промоакции', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PromoWidget(),
          ),
          SizedBox(height: 20),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: restaurants.map((restaurant) {
              return Card(
                margin: EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => RestaurantDetailsPage(),)
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          restaurant.imageUrl,
                          width: double.infinity,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 8.0),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            restaurant.name,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
