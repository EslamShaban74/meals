import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:meal/components/drawer/drawer.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/screens/categories_screen/categories_screen.dart';
import 'package:meal/screens/favorites_screen/favorites_screen.dart';

class BottomNavBar extends StatefulWidget {
  final void Function(String) toggleFavorites;

  final void Function(String) isFavorite;

  final List<Meal> favoriteMeals;

  const BottomNavBar(this.toggleFavorites, this.isFavorite, this.favoriteMeals);

  static const routeName = 'home';

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentPage = 0;
  late List<Map<String, dynamic>> pages;

  @override
  void initState() {
    pages = [
      {
        'title': 'Categories',
        'page': CategoriesScreen(),
      },
      {
        'title': 'Favorites',
        'page': FavoritesScreen(
            widget.toggleFavorites, widget.isFavorite, widget.favoriteMeals),
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pages[currentPage]['title'],
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      body: pages[currentPage]['page'],
      drawerScrimColor: Colors.black.withOpacity(0.7),
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.82,
        child: const MyDrawer(),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        barBackgroundColor: Theme.of(context).canvasColor,

        circleColor: Theme.of(context).backgroundColor,
        // inactiveIconColor: Colors.white,
        textColor: Theme.of(context).primaryColor,
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
