import 'package:flutter/material.dart';

class AddressProvider extends ChangeNotifier {
  int seletedIndex = -1;

  void select(int index) {
    seletedIndex = index;
    notifyListeners();
  }
}
