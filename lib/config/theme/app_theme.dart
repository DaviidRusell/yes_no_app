import 'package:flutter/material.dart';

const _customColor = Color(0xFF530BEF);

const List<Color> _colorsThemes = [
  _customColor,
  Colors.red,
  Colors.blue,
  Colors.green,
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
      useMaterial3: true, colorSchemeSeed: _colorsThemes[selectedColor]);
}
