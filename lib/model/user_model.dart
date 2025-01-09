import 'dart:convert';

class UserModel {
  String? name;
  String? email;
  String? password;

  UserModel({this.name, this.email, this.password});

  // Mengonversi JSON menjadi model
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  // Mengonversi model menjadi JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }

  // Memuat data dari JSON string
  static UserModel fromJsonString(String jsonString) {
    return UserModel.fromJson(jsonDecode(jsonString));
  }

  // Mengubah model ke JSON string
  String toJsonString() {
    return jsonEncode(toJson());
  }
}
