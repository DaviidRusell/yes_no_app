import 'package:flutter/material.dart';

const _customColor = Color.fromRGBO(15, 90, 20, 1);

const List<Color> _colorsThemes = [
  _customColor,
  Colors.indigo,
  Colors.red,
  Colors.blue,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorsThemes.length - 1,
            'Rango no valido (0-6)');

  ThemeData theme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorsThemes[selectedColor],
      brightness: Brightness.dark,
      filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
              backgroundColor: _colorsThemes[selectedColor])));
}
