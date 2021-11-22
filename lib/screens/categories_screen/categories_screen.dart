import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:meal/components/category_item/category_item.dart';
import 'package:meal/constants/dummy_data.dart';
import 'package:meal/providers/meal_provider/meal_provider.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {



  @override
  Widget build(BuildContext context) {
   var data = Provider.of<MealProvider>(context, listen: false)
        .availableCategory
        .map((categoryItem) => CategoryItem(
              id: categoryItem.id,
              title: categoryItem.title,
              color: categoryItem.color,
              image: categoryItem.image,
            ))
        .toList();
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.add),
      //       onPressed: () async {
      //         await context.setLocale(const Locale('en'));
      //       },
      //     )
      //   ],
      //
      // ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return data[index];
        },
        itemCount: data.length,
      ),
    );
  }
}
