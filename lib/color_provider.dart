import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  Color _backgroundColor = Colors.white;

  Color get backgroundColor => _backgroundColor;

  void changeColor(Color newColor) {
    _backgroundColor = newColor;
    notifyListeners();
  }
}