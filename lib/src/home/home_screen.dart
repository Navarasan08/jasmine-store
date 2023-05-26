import 'package:flutter/material.dart';
import 'package:jasmine_app/src/common/drawer_page.dart';
import 'package:jasmine_app/src/home/account_page.dart';
import 'package:jasmine_app/src/home/categories_page.dart';
import 'package:jasmine_app/src/home/favorite_page.dart';
import 'package:jasmine_app/src/home/landing_page.dart';
import 'package:jasmine_app/src/home/shopping_bag.dart';
import 'package:jasmine_app/util/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(),
      appBar: AppBar(
        title: Image.asset(
          AssetManager.logo,
          width: MediaQuery.of(context).size.width / 2,
        ),
        actions: [
          IconButton(onPressed: () {
            
          }, icon: Icon(Icons.notifications)),
        ],
      ),
      body: IndexedStack(index: _selectedIndex, children: [
        LandingPage(),
        CategoriesPage(),
        ShoppingBagPage(),
        FavoritePage(),
        MyAccountPage(),
      ]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined), label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined), label: "Bag"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: "Wishlist"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: "Account"),
          ]),
    );
  }
}
