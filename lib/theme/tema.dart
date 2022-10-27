import 'package:flutter/material.dart';

 final theme = ThemeData.dark();
 
final myTheme = ThemeData(
  colorScheme: theme.colorScheme.copyWith(
    secondary: Color.fromARGB(255,214, 90, 49),
  ),
);