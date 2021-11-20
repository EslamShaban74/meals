import 'package:flutter/material.dart';
import 'package:meal/constants/dummy_data.dart';
import 'package:meal/models/category.dart';
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

  List<Category> availableCategory = [];

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

    List<Category> ac = [];
    availableMeals.forEach((meal) {
      meal.categories.forEach((catId) {
        dummyCategories.forEach((cat) {
          if (cat.id == catId) {
            if (!ac.any((cat) => cat.id == catId)) {
              ac.add(cat);
            }
          }
        });
      });
    });

    availableCategory = ac;

    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('gluten', filters['gluten']!);
    prefs.setBool('lactose', filters['lactose']!);
    prefs.setBool('vegetarian', filters['vegetarian']!);
    prefs.setBool('vegan', filters['vegan']!);
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('gluten') != null) {
      filters['gluten'] = prefs.getBool('gluten')!;
    } else {
      filters['gluten'] = false;
    }
    if (prefs.getBool('lactose') != null) {
      filters['lactose'] = prefs.getBool('lactose')!;
    } else {
      filters['lactose'] = false;
    }
    if (prefs.getBool('vegetarian') != null) {
      filters['vegetarian'] = prefs.getBool('vegetarian')!;
    } else {
      filters['vegetarian'] = false;
    }
    if (prefs.getBool('vegan') != null) {
      filters['vegan'] = prefs.getBool('vegan')!;
    } else {
      filters['vegan'] = false;
    }
   // setFilters();

    if (prefs.getStringList('prefsMealId') != null) {
      prefsMealId = prefs.getStringList('prefsMealId')!;
    } else {
      prefsMealId = [];
    }

    for (var mealId in prefsMealId) {
      final existingIndex =
          favoriteMeals.indexWhere((element) => element.id == mealId);
      if (existingIndex < 0) {
        favoriteMeals
            .add(dummyMeals.firstWhere((element) => element.id == mealId));
      }
    }
    notifyListeners();
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
