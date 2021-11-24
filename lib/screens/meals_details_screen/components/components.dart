import 'package:flutter/material.dart';

Widget buildSectionTitle(BuildContext context, String text) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 15),
    child: Text(
      text,
      style: Theme.of(context).textTheme.headline3,
      textAlign: TextAlign.center,
    ),
  );
}

Widget buildContainer(Widget child, context) {
  var dw = MediaQuery.of(context).size.width;
  bool isLandscape =
      MediaQuery.of(context).orientation == Orientation.landscape;
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
    ),
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(0 ),
    height: 150,
    width: isLandscape ? (dw * 0.5 - 30) : dw,
    child: child,
  );
}
