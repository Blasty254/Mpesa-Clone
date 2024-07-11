import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
      background: Colors.white,
      primary: Colors.black,
      secondary: Colors.black,
      tertiary: Colors.white),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
      background: Colors.black,
      primary: Colors.grey.shade600,
      secondary: Colors.white,
      tertiary: Colors.black),
);
