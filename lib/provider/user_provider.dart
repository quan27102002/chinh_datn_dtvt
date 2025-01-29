import 'package:datn_trung/model/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _emailUser = "";
  String get emailUser => _emailUser;
  void saveEmailUser(String value) {
    _emailUser = value;
    notifyListeners();
  }

  UserModel _userData = UserModel();
  UserModel get userData => _userData;
  void saveUser(UserModel value) {
    _userData = value;
    notifyListeners();
  }
}
