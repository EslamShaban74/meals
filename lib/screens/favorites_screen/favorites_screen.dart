import 'package:flutter/material.dart';
import 'package:meal/components/meal_item/meal_item.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/providers/meal_provider/meal_provider.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dw = MediaQuery.of(context).size.width;
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final List<Meal> favoriteMeals =
        Provider.of<MealProvider>(context).favoriteMeals;

    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text(
          'No favorite meals added !',
          style: Theme.of(context).textTheme.headline3,
        ),
      );
    } else {// 802  8505
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: dw <= 400 ? 400 : 500,
          childAspectRatio:
              isLandscape ? dw / (dw * 0.9) : dw / (dw * 0.9),
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
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
