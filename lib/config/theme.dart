import 'package:bazar/config/constants.dart';
import 'package:flutter/material.dart';

ThemeData buildThemeData() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: fontFamily,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: _appBarTheme(),
      textTheme: _textTheme());
}

AppBarTheme _appBarTheme() {
  return const AppBarTheme(color: kTextLigntColor, elevation: 1);
}

TextTheme _textTheme() {
  return const TextTheme();
}
