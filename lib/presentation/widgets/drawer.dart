import 'package:flutter/material.dart';
import 'package:glovo_clone/presentation/pages/home_page.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.white,
       body: SingleChildScrollView(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: <Widget>[
             buildHeader(context),
             buildMenuItems(context),
           ],
         ),
       ),
     );
  }
  Widget buildHeader(BuildContext context) => Container(
    color: Colors.amber,
    padding: EdgeInsets.only(
      top: 44 + MediaQuery.of(context).padding.top,
      bottom: 24
    ),
    child: Column(
      children: [
        Text('Привет, Темирлан!',style: TextStyle(fontSize: 28, color: Colors.black, fontWeight: FontWeight.w700),)
      ],
    ),
  );

  Widget buildMenuItems(BuildContext context) => Container(
    padding: EdgeInsets.all(24),
    child: Wrap(
      runSpacing: 16,
      children: [
        ListTile(
          title: const Text('Учетная запись', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),),
        ),
        ListTile(
          leading: const Icon(Icons.shopping_bag_outlined),
          title: const Text('Мои заказы'),
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Моя информация'),
          onTap: () {},
        ),
        const Divider(color: Colors.black54),
        ListTile(
          leading: const Icon(Icons.discount_outlined),
          title: const Text('Промокоды'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.question_mark_outlined),
          title: const Text('Частые вопросы'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.notifications_none_outlined),
          title: const Text('Уведомления'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Выйти'),
          onTap: () {},
        ),
      ],
    ),
  );

}