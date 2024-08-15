import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
      surface: Colors.white,
      primary: Colors.black,
      secondary: Colors.black,
      tertiary: Colors.white),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
      surface: Colors.black,
      primary: Colors.grey.shade600,
      secondary: Colors.white,
      tertiary: Colors.black),
);
