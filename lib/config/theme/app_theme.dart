import 'package:flutter/material.dart';

const Color _customColor = Color(0Xff5C11D4);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;
// la asersion es como un if que en este caso entrega el error que ocurre por ejem
// si en main pongo que el color sea un 8 lo dira en el error y el - 1 es donde es un
// arreglo serian 7 pero menos 1 sera lo mismo que se ve
  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
            'Colors must be between 0 and ${_colorThemes.length}');
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}
