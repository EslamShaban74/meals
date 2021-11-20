import 'package:flutter/material.dart';
import 'package:meal/constants/dummy_data.dart';
import 'package:meal/providers/meal_provider/meal_provider.dart';
import 'package:provider/provider.dart';

import 'components/components.dart';

class MealsDetailsScreen extends StatelessWidget {
  static const routeName = 'meal-Details';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final selectedMeal = dummyMeals.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedMeal.title,
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Hero(
                tag: mealId,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  child: Image.network(
                    selectedMeal.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: [
                      buildSectionTitle(context, 'Ingredients'),
                      buildContainer(ListView.builder(
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
                      ),context),
                    ],
                  ),
                  Column(
                    children: [
                      buildSectionTitle(context, 'Steps'),
                      buildContainer(ListView.builder(
                        itemBuilder: (ctx, index) => Card(
                          color: Colors.amber,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Text('${(index + 1)}'),
                              ),
                              title: Text(selectedMeal.steps[index]),
                            ),
                          ),
                        ),
                        itemCount: selectedMeal.steps.length,
                      ),context),
                    ],
                  )
                ],
              ),
            if (!isLandscape) buildSectionTitle(context, 'Ingredients'),
            if (!isLandscape)
              buildContainer(ListView.builder(
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
              ),context),
            if (!isLandscape) buildSectionTitle(context, 'Steps'),
            if (!isLandscape)
              buildContainer(ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('${(index + 1)}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                  ),
                ),
                itemCount: selectedMeal.steps.length,
              ),context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<MealProvider>(context, listen: false)
              .toggleFavorites(mealId);
        },
        backgroundColor: Theme.of(context).canvasColor,
        child: Icon(
          Provider.of<MealProvider>(context, listen: true).isFavorite(mealId)
              ? Icons.star
              : Icons.star_border,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
