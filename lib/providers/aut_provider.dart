import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String _user = '';

  String get user => _user;

  void signIn(String email, String password) {
    // Logika Sign In
    _user = email;
    notifyListeners();
  }

  void signUp(String name, String email, String password) {
    // Logika Sign Up
    _user = name;
    notifyListeners();
  }

  void signOut() {
    _user = '';
    notifyListeners();
  }
}
