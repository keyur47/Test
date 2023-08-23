// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {

  String? password;
  String? email;
  String? userId;

  LoginModel({

    this.password,
    this.email,
    this.userId,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(

    password: json["password"],
    email: json["email"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {

    "password": password,
    "email": email,
    "userId": userId,
  };
}
