import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkTheme = false;

  ThemeProvider() {
    _loadTheme(); //unutk melakukan perubhaan tema
  }
  
  bool get isDarkTheme => _isDarkTheme;

  void toggleTheme(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkTheme = isDark;
    prefs.setBool('isDarkTheme', isDark);
    notifyListeners();
  }

  //untuk melakukan perubuhahan tema
  void _loadTheme() async {

    // ?? => elvis operator: for defining a default value in our variable (to avoid NP)
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkTheme = prefs.getBool('Is Dark Theme') ?? false;
    notifyListeners();
  }
}