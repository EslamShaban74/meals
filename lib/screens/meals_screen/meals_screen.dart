import 'package:flutter/material.dart';
import 'package:meal/components/meal_item/meal_item.dart';
import 'package:meal/constants/dummy_data.dart';
import 'package:meal/models/meal.dart';

class MealsScreen extends StatefulWidget {
  static const routeName = '/meals_screen';

  MealsScreen(this.availableMeals, {Key? key}) : super(key: key);

  final List<Meal> availableMeals;

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  late String categoryTitle;
  late List<Meal> categoryMeals;

  @override
  void didChangeDependencies() {
    final routeArguments = ModalRoute.of(context)!.settings.arguments as Map;
    categoryTitle = routeArguments['title'];
    final categoryId = routeArguments['id'];

    categoryMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    void removeMeal(String mealId) {
      setState(() {
        categoryMeals.removeWhere((element) => element.id == mealId);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
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
