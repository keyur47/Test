import 'package:cloud_firestore/cloud_firestore.dart';

class WeightDetail {
  String? weight;
  String? time;
  String? userId;

  WeightDetail({
    this.weight,
    this.time,
    this.userId,
  }) {}

  WeightDetail.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    weight = data["weight"] ?? '';
    time = data["time"] ?? '';
    userId = data["userId"] ?? '';
  }

  WeightDetail.fromJson(Map<String, dynamic> json) {
    weight = json["weight"] ?? '';
    time = json["time"] ?? '';
    userId = json["userId"] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['weight'] = weight;
    data['time'] = time;
    data['userId'] = userId;
    return data;
  }
}
