import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:meal/providers/meal_provider/meal_provider.dart';
import 'package:provider/provider.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Widget buildSwitchListTile(
      String title, String description, bool value, ValueChanged onChanged) {
    return SwitchListTile(
        activeColor: HexColor('#89FC00'),
        inactiveTrackColor: Colors.white,
        inactiveThumbColor: Theme.of(context).primaryColor.withOpacity(0.7),
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline5,
        ),
        subtitle: Text(description, style: Theme.of(context).textTheme.caption),
        value: value,
        onChanged: onChanged);
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, bool> currentFilters =
        Provider.of<MealProvider>(context, listen: false).filters;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your filters',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
                padding: const EdgeInsets.all(20),
                child: Text('Adjust your Meal Selection here ! ',
                    style: Theme.of(context).textTheme.headline5)),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                  'Gluten-free',
                  'only include gluten free meals',
                  currentFilters['gluten']!, (newValue) {
                setState(
                  () {
                    currentFilters['gluten'] = newValue;
                  },
                );
                Provider.of<MealProvider>(context, listen: false).setFilters();
              }),
              buildSwitchListTile('Lactose-free',
                  'only include lactose free meals', currentFilters['lactose']!, (newValue) {
                setState(
                  () {
                    currentFilters['lactose'] = newValue;
                  },
                );
                Provider.of<MealProvider>(context, listen: false).setFilters();
              }),
              buildSwitchListTile(
                  'Vegetarian', 'only include Vegetarian meals', currentFilters['vegetarian']!,
                  (newValue) {
                setState(
                  () {
                    currentFilters['vegetarian'] = newValue;
                  },
                );
                Provider.of<MealProvider>(context, listen: false).setFilters();
              }),
              buildSwitchListTile('Vegan', 'only include vegan meals', currentFilters['vegan']!,
                  (newValue) {
                setState(
                  () {
                    currentFilters['vegan']= newValue;
                  },
                );
                Provider.of<MealProvider>(context, listen: false).setFilters();
              }),
            ],
          ))
        ],
      ),
    );
  }
}
