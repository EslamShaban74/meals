import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  // var primaryColor = HexColor('#444444');
  // var accentColor = HexColor('#212121');

  var themeMode = ThemeMode.system;
  String themeText = '';

  // onChanged(color,n){
  //   n==1?primaryColor=
  // }

  void themeModeChange(newThemeValue) async {
    themeMode = newThemeValue;
    getThemeText(themeMode);
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('themeText', themeText);
  }

  getThemeText(ThemeMode themeMode) {
    if (themeMode == ThemeMode.system) {
      themeText = 'system';
    } else if (themeMode == ThemeMode.dark) {
      themeText = 'dark';
    } else if (themeMode == ThemeMode.light) {
      themeText = 'light';
    }
  }

  getThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('themeText') != null) {
      themeText = prefs.getString('themeText')!;
    } else {
      themeText = 'system';
    }

    if (themeText == 'system') {
      themeMode = ThemeMode.system;
    } else if (themeText == 'dark') {
      themeMode = ThemeMode.dark;
    } else if (themeText == 'light') {
      themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}
