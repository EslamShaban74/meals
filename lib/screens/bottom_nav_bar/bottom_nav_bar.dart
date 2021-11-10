import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:meal/screens/categories_screen/categories_screen.dart';
import 'package:meal/screens/favorites_screen/favorites_screen.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentPage = 0;
  List<Map<String, dynamic>> pages = [
    {
      'title': 'Categories',
      'page': CategoriesScreen(),
    },
    {
      'title': 'Favorites',
      'page': FavoritesScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[currentPage]['title']),
      ),
      body: pages[currentPage]['page'],
      bottomNavigationBar: FancyBottomNavigation(
       barBackgroundColor: HexColor('#E1E1E1'),
      circleColor:Theme.of(context).primaryColor,
       // inactiveIconColor: Colors.white,
        textColor: Colors.black,
        tabs: [
          TabData(iconData: Icons.category, title: "Categories"),
          TabData(iconData: Icons.favorite_border, title: "Favorites"),
        ],
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
    );
  }
}
