import 'package:flutter/material.dart';

class PaymentProvider extends ChangeNotifier {
  int choice = -1;

  void selectChoice(int index) {
    choice = index;
    notifyListeners();
  }
}
