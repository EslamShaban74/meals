import 'package:flutter/material.dart';
import 'package:meal/components/category_item/category_item.dart';
import 'package:meal/constants/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  var data = dummyCategories
      .map((categoryItem) => CategoryItem(
            id: categoryItem.id,
            title: categoryItem.title,
            color: categoryItem.color,
            image: categoryItem.image,
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return data[index];
        },
        itemCount: 10,
      ),
    );
  }
}
