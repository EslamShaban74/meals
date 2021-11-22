import 'package:flutter/material.dart';
import 'package:meal/translations/locale_keys.g.dart';
import 'package:easy_localization/src/public_ext.dart';

class LanguageProvider extends ChangeNotifier {
  String dropdownValue = 'English - UK';

  changeLanguage(newValue, context) {
    if (newValue == 'English - UK') {
      dropdownValue = 'English - UK';

      context.setLocale(const Locale('en'));
    } else if (newValue == 'العربية - ar') {
      dropdownValue = 'العربية - ar';
    }
    notifyListeners();
  }

// Locale _appLocale = const Locale('en');
//
// Locale get appLocal => _appLocale ?? Locale("en");
// fetchLocale() async {
//   var prefs = await SharedPreferences.getInstance();
//   if (prefs.getString('language_code') == null) {
//     _appLocale = const Locale('en');
//     return Null;
//   }
//   _appLocale = Locale(prefs.getString('language_code')!);
//   return Null;
// }
//
//
// void changeLanguage(Locale type) async {
//   var prefs = await SharedPreferences.getInstance();
//   if (_appLocale == type) {
//     return;
//   }
//   if (type == const Locale("ar")) {
//     _appLocale = const Locale("ar");
//     await prefs.setString('language_code', 'ar');
//     await prefs.setString('countryCode', '');
//   } else {
//     _appLocale = const Locale("en");
//     await prefs.setString('language_code', 'en');
//     await prefs.setString('countryCode', 'US');
//   }
//   notifyListeners();
// }
}

// changeLanguage(bool lang) {
//   isEn = lang;
//   notifyListeners();
// }

// dynamic getText(String txt) {
//   if (isEn == true) {
//     return
//   }
// }
