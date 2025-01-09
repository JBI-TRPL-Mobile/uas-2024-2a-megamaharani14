import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:template_project/model/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel user = UserModel();
  List<UserModel> users = []; // Tambahkan daftar pengguna

  // Fungsi untuk memuat data pengguna dari file JSON
  Future<void> loadUserData() async {
    try {
      final String response = await rootBundle.loadString('assets/datauser.json');
      List<dynamic> dataList = jsonDecode(response);

      // Konversi setiap item menjadi UserModel dan simpan di list
      users = dataList.map((item) => UserModel.fromJson(item)).toList();

      if (users.isNotEmpty) {
        user = users[0]; // Default pengguna pertama
      }

      notifyListeners();
    } catch (e) {
      print("Error loading data: $e");
    }
  }

  // Fungsi login untuk memvalidasi email dan password
  bool login(String email, String password) {
    try {
      // Cari pengguna berdasarkan email dan password
      for (var item in users) {
        if (item.email == email && item.password == password) {
          user = item; // Set pengguna yang berhasil login
          notifyListeners();
          return true; // Login berhasil
        }
      }
      return false; // Login gagal
    } catch (e) {
      print("Error during login: $e");
      return false;
    }
  }

   void saveUserData(String name, String email, String password) {
    try {
      // Buat objek UserModel baru
      UserModel newUser = UserModel(name: name, email: email, password: password);

      // Tambahkan ke daftar pengguna
      users.add(newUser);

      // Notifikasi listener
      notifyListeners();

      // Debug log
      print("User registered: ${newUser.toJson()}");
    } catch (e) {
      print("Error saving user: $e");
    }
  }
}
