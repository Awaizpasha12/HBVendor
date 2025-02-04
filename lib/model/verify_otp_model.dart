// To parse this JSON data, do
//
//     final verifyOtpModel = verifyOtpModelFromJson(jsonString);

import 'dart:convert';

VerifyOtpModel verifyOtpModelFromJson(String str) => VerifyOtpModel.fromJson(json.decode(str));

String verifyOtpModelToJson(VerifyOtpModel data) => json.encode(data.toJson());

class VerifyOtpModel {
  String? message;
  String? token;
  User? user;

  VerifyOtpModel({
    this.message,
    this.token,
    this.user,
  });

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) => VerifyOtpModel(
    message: json["message"],
    token: json["token"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "token": token,
    "user": user?.toJson(),
  };
}

class User {
  String? role;
  String? phone;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;
  String? status;
  String? email;
  User({
    this.role,
    this.phone,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.status,    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    role: json["role"],
    phone: json["phone"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"],
    status: json["status"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "role": role,
    "phone": phone,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "id": id,
    "status": status,        "email": email,
  };
}
