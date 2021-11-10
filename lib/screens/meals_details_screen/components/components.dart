import 'package:flutter/material.dart';

Widget buildSectionTitle(BuildContext context, String text) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: Text(
      text,
      style: Theme.of(context).textTheme.subtitle1,
    ),
  );
}

Widget buildContainer(Widget child) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
    ),
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(10),
    height: 150,
    width: 300,
    child: child,
  );
}
