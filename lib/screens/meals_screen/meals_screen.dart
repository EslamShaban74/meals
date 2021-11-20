import 'package:flutter/material.dart';
import 'package:meal/components/meal_item/meal_item.dart';
import 'package:meal/constants/dummy_data.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/providers/meal_provider/meal_provider.dart';
import 'package:provider/provider.dart';

class MealsScreen extends StatefulWidget {
  static const routeName = '/meals_screen';

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  late String categoryTitle;
  late List<Meal> categoryMeals;

  @override
  void didChangeDependencies() {
    final List<Meal> availableMeals =
        Provider.of<MealProvider>(context).availableMeals;
    final routeArguments = ModalRoute.of(context)!.settings.arguments as Map;
    categoryTitle = routeArguments['title'];
    final categoryId = routeArguments['id'];

    categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var dw = MediaQuery.of(context).size.width;
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            categoryTitle,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: dw <= 400 ? 400 : 500,
            childAspectRatio:
                isLandscape ? dw / (dw * 0.802) : dw / (dw * 0.8505),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (context, index) => MealItem(
            title: categoryMeals[index].title,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
            id: categoryMeals[index].id,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
          ),
          itemCount: categoryMeals.length,
        )
        // : ListView.builder(
        //     itemBuilder: (context, index) => MealItem(
        //       title: categoryMeals[index].title,
        //       affordability: categoryMeals[index].affordability,
        //       complexity: categoryMeals[index].complexity,
        //       id: categoryMeals[index].id,
        //       imageUrl: categoryMeals[index].imageUrl,
        //       duration: categoryMeals[index].duration,
        //     ),
        //     itemCount: categoryMeals.length,
        //   ),
        );
  }
}
