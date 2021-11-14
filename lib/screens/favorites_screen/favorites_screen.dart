import 'package:flutter/material.dart';
import 'package:meal/components/meal_item/meal_item.dart';
import 'package:meal/models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final void Function(String) toggleFavorites;
  final void Function(String) isFavorite;
  final List<Meal> favoriteMeals;

  const FavoritesScreen(
      this.toggleFavorites, this.isFavorite, this.favoriteMeals,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
