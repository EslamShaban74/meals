import 'package:flutter/material.dart';
import 'package:meal/components/meal_item/meal_item.dart';
import 'package:meal/constants/dummy_data.dart';

class MealsScreen extends StatefulWidget {
  static const routeName = '/meals_screen';

  const MealsScreen({Key? key}) : super(key: key);

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArguments = ModalRoute.of(context)!.settings.arguments as Map;
    final categoryTitle = routeArguments['title'];
    final categoryId = routeArguments['id'];

    final categoryMeals = dummyMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => MealItem(
          title: categoryMeals[index].title,
          affordability: categoryMeals[index].affordability,
          complexity: categoryMeals[index].complexity,
          id: categoryMeals[index].id,
          imageUrl: categoryMeals[index].imageUrl,
          duration: categoryMeals[index].duration,
        ),
        itemCount: categoryMeals.length,
      ),
    );
  }
}
