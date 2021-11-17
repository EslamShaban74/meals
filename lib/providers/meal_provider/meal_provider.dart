import 'package:flutter/material.dart';
import 'package:meal/constants/dummy_data.dart';
import 'package:meal/models/meal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MealProvider with ChangeNotifier {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> availableMeals = dummyMeals;

  List<String> prefsMealId = [];

  void setFilters() async {
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

    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('gluten', filters['lactose']!);
    prefs.setBool('lactose', filters['lactose']!);
    prefs.setBool('vegetarian', filters['vegetarian']!);
    prefs.setBool('vegan', filters['vegan']!);
  }

  void getFilters() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    filters['gluten'] = prefs.getBool('gluten')!;
    filters['lactose'] = prefs.getBool('lactose')!;
    filters['vegetarian'] = prefs.getBool('vegetarian')!;
    filters['vegan'] = prefs.getBool('vegan')!;
    notifyListeners();

    prefsMealId = prefs.getStringList('prefsMealId')!;
    for (var mealId in prefsMealId) {
      final existingIndex =
          favoriteMeals.indexWhere((element) => element.id == mealId);
      if (existingIndex < 0) {
        favoriteMeals
            .add(dummyMeals.firstWhere((element) => element.id == mealId));
      }
    }
  }

  List<Meal> favoriteMeals = [];

  void toggleFavorites(String mealId) async {
    final existingIndex =
        favoriteMeals.indexWhere((element) => element.id == mealId);

    if (existingIndex >= 0) {
      favoriteMeals.removeAt(existingIndex);
      prefsMealId.remove(mealId);
    } else {
      favoriteMeals
          .add(dummyMeals.firstWhere((element) => element.id == mealId));
      prefsMealId.add(mealId);
    }

    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('prefsMealId', prefsMealId);
  }

  bool isFavorite(String mealId) {
    return favoriteMeals.any((element) => element.id == mealId);
  }
}
