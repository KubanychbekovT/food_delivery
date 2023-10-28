import 'package:flutter/material.dart';
import 'package:glovo_clone/presentation/pages/food/details/ekidos/eki_dos.dart';
import 'package:glovo_clone/presentation/pages/food/details/ekidos/ekidos_details.dart';

class PromoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Устанавливаем горизонтальную прокрутку
        itemCount: 2, // Указываем количество карточек
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: 80,
            margin: EdgeInsets.only(right: 16), // Добавляем отступ между карточками
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/restaurants/oasis.jpg",
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Переход на новую страницу при нажатии
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EkidosPage(), // Замените на нужную страницу
                      ),
                    );
                  },

                )
              ],
            ),
          );
        },
      ),
    );
  }
}


