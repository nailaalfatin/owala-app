import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  //perbedaan setter dan getter
  //ibaratnya si setter itu privat, nah kalo getter itu public

  //setter
  bool _isDarkTheme = false;

  ThemeProvider() {
    _loadTheme(); //unutk melakukan perubhaan tema
  }
  
  //getter
  //getter itu nanti kita pake di file lain
  bool get isDarkTheme => _isDarkTheme;

  void toggleTheme(bool isDark) async {
    //SharedPreferences: untuk menghandle konfigurasi perubahan tema lokal
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkTheme = isDark;
    prefs.setBool('isDarkTheme', isDark);
    notifyListeners();
    //kita ini wajib make notifyListeners() soalnya dia ini buat ngerecord semua perubahan
  }

  //untuk melakukan perubuhahan tema
  void _loadTheme() async {

    // ?? => elvis operator: for defining a default value in our variable (to avoid NP)
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkTheme = prefs.getBool('Is Dark Theme') ?? false;
    notifyListeners();
  }
}