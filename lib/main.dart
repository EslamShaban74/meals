import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:meal/constants/dummy_data.dart';
import 'package:meal/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:meal/screens/filters_screen/filters_screen.dart';
import 'package:meal/screens/meals_details_screen/meals_details_screen.dart';
import 'package:meal/screens/meals_screen/meals_screen.dart';

import 'models/meal.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> availableMeals = dummyMeals;

  void setFilters(Map<String, bool> filteredData) {
    setState(() {
      filters = filteredData;
      availableMeals = dummyMeals.where((element) {
        if (filters['gluten']! && !element.isGlutenFree) {
          return false;
        } else if (filters['lactose']! && !element.isLactoseFree) {
          return false;
        } else if (filters['vegetarian']! && !element.isVegetarian) {
          return false;
        } else if (filters['vegan']! && !element.isVegan) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  List<Meal> favoriteMeals = [];

  void toggleFavorites(String mealId) {
    final existingIndex =
        favoriteMeals.indexWhere((element) => element.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteMeals
            .add(dummyMeals.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool isFavorite(String mealId) {
    return favoriteMeals.any((element) => element.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal',
      theme: ThemeData(
        canvasColor: HexColor('#E1E1E1'),
        primaryColor: HexColor('#444444'),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: HexColor('#212121'),
        ),
        scaffoldBackgroundColor: HexColor('#212121'),
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
            headline3: TextStyle(
                fontSize: 20.0,
                color: HexColor('#E1E1E1'),
                fontFamily: 'RobotoCondensed'),
            headline5: const TextStyle(
              color: Colors.white,
              fontFamily: 'RobotoCondensed',
              fontSize: 18.0,
            ),
            headline6: const TextStyle(
              color: Colors.white,
              fontSize: 12.0,
              fontFamily: 'RobotoCondensed',
            ),
            caption: const TextStyle(color: Colors.white)),
      ),
      home: null,
      routes: {
        '/': (context) => BottomNavBar(toggleFavorites, isFavorite,favoriteMeals),
        MealsScreen.routeName: (context) => MealsScreen(availableMeals),
        MealsDetailsScreen.routeName: (context) =>
            MealsDetailsScreen(isFavorite, toggleFavorites),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(filters, setFilters),
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Meals',
//           style: TextStyle(
//               fontFamily: 'Raleway',
//               fontSize: 18.0,
//               fontWeight: FontWeight.bold),
//         ),
//
//       ),
//       body: CategoriesScreen(),
//     );
//   }
// }
