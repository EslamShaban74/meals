import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:meal/providers/language_provider/language_provider.dart';
import 'package:meal/providers/meal_provider/meal_provider.dart';
import 'package:meal/providers/theme_provider/theme_provider.dart';
import 'package:meal/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:meal/screens/filters_screen/filters_screen.dart';

import 'package:meal/screens/meals_details_screen/meals_details_screen.dart';
import 'package:meal/screens/meals_screen/meals_screen.dart';
import 'package:meal/screens/settings_screen/settings_screen.dart';


import 'package:meal/translations/codegen_loader.g.dart';
import 'package:meal/translations/locale_keys.g.dart';

import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MealProvider>(
          create: (context) => MealProvider()
            ..getData()
            ..setFilters(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
            create: (context) => ThemeProvider()),
        ChangeNotifierProvider<LanguageProvider>(
          create: (context) => LanguageProvider(),
        )
      ],
      child: EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Provider.of<MealProvider>(context, listen: false).getData();
    Provider.of<ThemeProvider>(context, listen: false).getThemeMode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeProvider>(context, listen: true).themeMode;
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: LocaleKeys.title.tr(),
      themeMode: themeMode,
      theme: ThemeData(
        cardColor: Colors.white70,
        primaryColor: Colors.deepPurple[300],
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
        ),

        scaffoldBackgroundColor: HexColor('#E1E1E1'),
        primarySwatch:Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.black),
        textTheme: const TextTheme(
            headline3: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontFamily: 'Raleway',
            ),
            headline5: TextStyle(
              color: Colors.black,
              fontFamily: 'RobotoCondensed',
              fontSize: 18.0,
            ),
            headline6: TextStyle(
              color: Colors.black,
              fontSize: 12.0,
              fontFamily: 'RobotoCondensed',
            ),
            bodyText1: TextStyle(
              color: Colors.black,
              fontFamily: 'RobotoCondensed',
            ),
            caption: TextStyle(color: Colors.black)),
      ),
      darkTheme: ThemeData(
        primaryColor: HexColor('#444444'),
        cardColor: HexColor('#444444'),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: HexColor('#212121'),
        ),
        scaffoldBackgroundColor: HexColor('#212121'),
        primarySwatch: Colors.indigo,
        iconTheme: const IconThemeData(color: Colors.white70),
        textTheme: TextTheme(
            headline3: TextStyle(
                fontSize: 20.0,
                color: HexColor('#E1E1E1'),
                fontFamily: 'Raleway'),
            headline5: const TextStyle(
              color: Colors.white,
              fontFamily: 'RobotoCondensed',
              fontSize: 18.0,
            ),
            headline6: const TextStyle(
              color: Colors.white,
              fontSize: 12.0,
              fontFamily: 'RobotoCondensed',
            ),
            bodyText1: TextStyle(
                color: HexColor('#E1E1E1'), fontFamily: 'RobotoCondensed'),
            caption: const TextStyle(color: Colors.white)),
      ),
      routes: {
        '/': (context) => const BottomNavBar(),
        MealsScreen.routeName: (context) => MealsScreen(),
        MealsDetailsScreen.routeName: (context) => MealsDetailsScreen(),
        FiltersScreen.routeName: (context) => FiltersScreen(),
        SettingsScreen.routeName: (context) =>  SettingsScreen(),
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
