import 'package:flutter/material.dart';
import 'package:meal/components/meal_item/meal_item.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/providers/meal_provider/meal_provider.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Meal> favoriteMeals =
        Provider.of<MealProvider>(context).favoriteMeals;

    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text(
          'No favorite meals added !',
          style: Theme.of(context).textTheme.headline3,
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) => MealItem(
          title: favoriteMeals[index].title,
          affordability: favoriteMeals[index].affordability,
          complexity: favoriteMeals[index].complexity,
          id: favoriteMeals[index].id,
          imageUrl: favoriteMeals[index].imageUrl,
          duration: favoriteMeals[index].duration,
        ),
        itemCount: favoriteMeals.length,
      );
    }
  }
}
