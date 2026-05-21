import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _dark = false;
  bool get dark => _dark;

  void toggle() {
    _dark = !dark;
    notifyListeners();
  }
}
