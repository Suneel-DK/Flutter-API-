import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  bool _isLight = true;
  bool get isLight => _isLight;

  void toggleTheme() {
    _isLight = !_isLight;
    notifyListeners();
  }
}
