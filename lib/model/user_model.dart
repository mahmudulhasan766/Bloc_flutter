// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);

import 'dart:convert';

UserModel userModelFromMap(String str) => UserModel.fromMap(json.decode(str));

String userModelToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  UserModel({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );

  Map<String, dynamic> toMap() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };
}
