import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  ThemeData get lightTheme => ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.light,
      );

  ThemeData get darkTheme => ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.dark,
      );

  void toggleTheme(bool isDarkMode) {
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
