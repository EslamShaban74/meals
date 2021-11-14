import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filters';

  final setFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(this.currentFilters, this.setFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;

    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String description, bool value, ValueChanged onChanged) {
    return SwitchListTile(
        activeColor: Colors.amber,
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your filters',
          style: Theme.of(context).textTheme.headline3,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Map<String, bool> filteredData = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
              };
              widget.setFilters(filteredData);
            },
            child: const Text(
              'Save',
            ),
          ),
        ],
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
                  'Gluten-free', 'only include gluten free meals', _glutenFree,
                  (newValue) {
                setState(
                  () {
                    _glutenFree = newValue;
                  },
                );
              }),
              buildSwitchListTile('Lactose-free',
                  'only include lactose free meals', _lactoseFree, (newValue) {
                setState(
                  () {
                    _lactoseFree = newValue;
                  },
                );
              }),
              buildSwitchListTile(
                  'Vegetarian', 'only include Vegetarian meals', _vegetarian,
                  (newValue) {
                setState(
                  () {
                    _vegetarian = newValue;
                  },
                );
              }),
              buildSwitchListTile('Vegan', 'only include vegan meals', _vegan,
                  (newValue) {
                setState(
                  () {
                    _vegan = newValue;
                  },
                );
              }),
            ],
          ))
        ],
      ),
    );
  }
}
