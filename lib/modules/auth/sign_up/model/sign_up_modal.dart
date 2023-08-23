import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetail {
  String? email;
  String? password;
  String? userId;


  UserDetail({
    this.email,
    this.password,
    this.userId,

  }) {}

  UserDetail.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    email = data["email"] ?? '';
    password = data["password"] ?? '';
    userId = data["userId"] ?? '';
  }

  UserDetail.fromJson(Map<String, dynamic> json) {
    email = json["email"] ?? '';
    password = json["password"] ?? '';
    userId = json["userId"] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['userId'] = userId;
    return data;
  }
}
