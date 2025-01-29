import 'package:flutter/material.dart';

class AlertProvider extends ChangeNotifier {
  bool isAlert = false;

  void showAlert() {
    isAlert = true;
    notifyListeners();
  }

  void hideAlert() {
    isAlert = false;
    notifyListeners();
  }
}
