import 'package:flutter/material.dart';
import 'package:meal/constants/dummy_data.dart';

import 'components/components.dart';

class MealsDetailsScreen extends StatelessWidget {
  static const routeName = 'meal-Details';
  final bool Function(String) isFavorite;
  final void Function(String) toggleFavorites;

  const MealsDetailsScreen(this.isFavorite, this.toggleFavorites, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;

    final selectedMeal = dummyMeals.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Hero(
                tag: mealId,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Colors.amber,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(
                        selectedMeal.ingredients[index],
                        style: const TextStyle(color: Colors.black),
                      )),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Card(
                color: Colors.amber,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      selectedMeal.steps[index],
                      style: const TextStyle(color: Colors.black),
                    )),
              ),
              itemCount: selectedMeal.steps.length,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toggleFavorites(mealId);
        },
        backgroundColor: Theme.of(context).canvasColor,
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
