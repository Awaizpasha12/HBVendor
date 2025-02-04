// To parse this JSON data, do
//
//     final businessCategoryModel = businessCategoryModelFromJson(jsonString);

import 'dart:convert';

BusinessCategoryModel businessCategoryModelFromJson(String str) => BusinessCategoryModel.fromJson(json.decode(str));

String businessCategoryModelToJson(BusinessCategoryModel data) => json.encode(data.toJson());

class BusinessCategoryModel {
  List<Datum>? data;

  BusinessCategoryModel({
    this.data,
  });

  factory BusinessCategoryModel.fromJson(Map<String, dynamic> json) => BusinessCategoryModel(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? name;
  dynamic createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt,
    "updated_at": updatedAt?.toIso8601String(),
  };
}
