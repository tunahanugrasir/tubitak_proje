import 'package:flutter/material.dart';

class DarkTheme {
  DarkTheme() {
    theme = ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: _darkColors._backgroundColor),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: _darkColors._secondaryColor),
      scaffoldBackgroundColor: _darkColors._backgroundColor,
      colorScheme: ColorScheme.dark(
        onPrimary: _darkColors._cardBackgroundColor,
        onSecondary: _darkColors._secondaryColor,
      ),
    );
  }

  late ThemeData theme;

  final _darkColors = _DarkThemeColors();
}

class _DarkThemeColors {
  final Color _backgroundColor = Colors.black;
  final Color _cardBackgroundColor = const Color.fromARGB(255, 27, 34, 37);
  final Color _secondaryColor = const Color(0xff65D36E);
}

class LightTheme {
  LightTheme() {
    theme = ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: _lightColors._backgroundColor),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: _lightColors._secondaryColor),
      scaffoldBackgroundColor: _lightColors._backgroundColor,
      colorScheme: ColorScheme.light(
        primary: _lightColors._primaryColor,
        onPrimary: _lightColors._onPrimaryColor,
        secondary: _lightColors._secondaryColor,
        onSecondary: _lightColors._onSecondaryColor,
      ),
    );
  }

  late ThemeData theme;

  final _lightColors = _LightThemeColors();
}

class _LightThemeColors {
  final Color _backgroundColor = Colors.white;
  final Color _onPrimaryColor = Colors.white;
  final Color _onSecondaryColor = Colors.black;
  final Color _primaryColor = const Color.fromARGB(255, 27, 34, 37);
  final Color _secondaryColor = const Color(0xff65D36E);
}
