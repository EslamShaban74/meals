// import 'package:easy_localization/src/public_ext.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:meal/providers/language_provider/language_provider.dart';
// import 'package:meal/screens/categories_screen/categories_screen.dart';
// import 'package:meal/screens/favorites_screen/favorites_screen.dart';
// import 'package:meal/translation/locale_keys.g.dart';
// import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
// import 'package:provider/provider.dart';
//
// class PresistantTabView extends StatefulWidget {
//   const PresistantTabView({Key? key}) : super(key: key);
//
//   @override
//   State<PresistantTabView> createState() => _PresistantTabViewState();
// }
//
// class _PresistantTabViewState extends State<PresistantTabView> {
//
//
//
//   @override
//   void initState() {
//     // pages = [
//     //   {
//     //     'title': LocaleKeys.categories.tr(),
//     //     'page': CategoriesScreen(),
//     //   },
//     //   {
//     //     'title': 'Favorites',
//     //     'page': const FavoritesScreen(),
//     //   },
//     // ];
//
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     var provider = Provider.of<LanguageProvider>(context,listen: true);
//     return PersistentTabView(
//         context,
//         controller: provider.controller,
//         screens: provider.buildScreens(),
//         items: provider.navBarsItems(),
//         confineInSafeArea: true,
//         backgroundColor: Colors.white, // Default is Colors.white.
//         handleAndroidBackButtonPress: true, // Default is true.
//         resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
//         stateManagement: true, // Default is true.
//         hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
//         decoration: NavBarDecoration(
//           borderRadius: BorderRadius.circular(10.0),
//           colorBehindNavBar: Colors.white,
//         ),
//         popAllScreensOnTapOfSelectedTab: true,
//         popActionScreens: PopActionScreensType.all,
//         itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
//           duration: Duration(milliseconds: 200),
//           curve: Curves.ease,
//         ),
//         screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
//           animateTabTransition: true,
//           curve: Curves.ease,
//           duration: Duration(milliseconds: 200),
//         ),
//         navBarStyle: NavBarStyle.style2, // Choose the nav bar style with this property.
//       );
//
//   }
// }
