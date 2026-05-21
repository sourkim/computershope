import 'package:flutter/material.dart';
import 'package:project_api/view/Cart_screen.dart';
import 'package:project_api/view/favorite_screen.dart';
import 'package:project_api/view/home_screen.dart';
import 'package:project_api/view/profile_screen.dart';

class Buttomnav extends StatefulWidget {
  const Buttomnav({super.key});

  @override
  State<Buttomnav> createState() => _ButtomnavState();
}

class _ButtomnavState extends State<Buttomnav> {
  int selectedIndex = 0;
  List<Widget> screen = [
    HomeScreen(),
    CartScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
        ],
      ),
    );
  }
}
