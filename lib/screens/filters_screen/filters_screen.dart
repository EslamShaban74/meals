import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:meal/components/drawer/drawer.dart';
import 'package:meal/providers/meal_provider/meal_provider.dart';
import 'package:meal/translations/locale_keys.g.dart';
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
        // activeColor: HexColor('#89FC00'),
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
          LocaleKeys.filters.tr(),
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
                padding: const EdgeInsets.all(20),
                child: Text(LocaleKeys.adjust_your_settings_selection.tr(),
                    style: Theme.of(context).textTheme.headline5)),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                  LocaleKeys.gluten_free.tr(),
                  LocaleKeys.only_includes_gluten_free_meals.tr(),
                  currentFilters['gluten']!, (newValue) {
                setState(
                  () {
                    currentFilters['gluten'] = newValue;
                  },
                );
                Provider.of<MealProvider>(context, listen: false).setFilters();
              }),
              buildSwitchListTile(
                  LocaleKeys.lactose_free.tr(),
                  LocaleKeys.only_includes_lactose_free_meals.tr(),
                  currentFilters['lactose']!, (newValue) {
                setState(
                  () {
                    currentFilters['lactose'] = newValue;
                  },
                );
                Provider.of<MealProvider>(context, listen: false).setFilters();
              }),
              buildSwitchListTile(
                  LocaleKeys.vegetarian.tr(),
                  LocaleKeys.only_include_vegetarian_meals.tr(),
                  currentFilters['vegetarian']!, (newValue) {
                setState(
                  () {
                    currentFilters['vegetarian'] = newValue;
                  },
                );
                Provider.of<MealProvider>(context, listen: false).setFilters();
              }),
              buildSwitchListTile(
                  LocaleKeys.vegan.tr(),  LocaleKeys.only_include_vegan_meals.tr(), currentFilters['vegan']!,
                  (newValue) {
                setState(
                  () {
                    currentFilters['vegan'] = newValue;
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
