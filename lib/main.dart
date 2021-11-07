import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:meal/screens/categories_screen/categories_screen.dart';
import 'package:meal/screens/meals_screen/meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: HexColor('#444444'),
        ),
        scaffoldBackgroundColor: HexColor('#212121'),
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headline3: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontFamily: 'RobotoCondensed'),
          headline5: TextStyle(
            color: Colors.white,
            fontFamily: 'RobotoCondensed',
            fontSize: 18.0,
          ),
        ),
      ),
      home: CategoriesScreen(),
      routes: {
        // '/': (context) => CategoriesScreen(),
        MealsScreen.routeName: (context) => const MealsScreen(),
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Meals',
//           style: TextStyle(
//               fontFamily: 'Raleway',
//               fontSize: 18.0,
//               fontWeight: FontWeight.bold),
//         ),
//
//       ),
//       body: CategoriesScreen(),
//     );
//   }
// }
