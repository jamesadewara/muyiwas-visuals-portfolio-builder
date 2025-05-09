import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.purple,
    colorScheme: ColorScheme.light(
      primary: Colors.purple,
      secondary: Colors.pink,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    ),
    // Add other theme properties
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.purple,
    colorScheme: ColorScheme.dark(
      primary: Colors.purple,
      secondary: Colors.pink,
    ),
    // Add other theme properties
  );
}