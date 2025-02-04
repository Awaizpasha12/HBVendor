// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  List<Datum>? data;

  ProductModel({
    this.data,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  int? userId;
  String? name;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? availableQuantity;
  String? pricePerDay;
  int? subcategoryId;
  dynamic rating;
  int? timesBooked;
  List<String>? includedItems;
  List<String>? notIncludedItems;
  List<String>? additionalInformation;
  List<String>? termsConditions;
  List<Image>? images;

  Datum({
    this.id,
    this.userId,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.availableQuantity,
    this.pricePerDay,
    this.subcategoryId,
    this.rating,
    this.timesBooked,
    this.includedItems,
    this.notIncludedItems,
    this.additionalInformation,
    this.termsConditions,
    this.images,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    name: json["name"],
    description: json["description"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    availableQuantity: json["available_quantity"],
    pricePerDay: json["price_per_day"],
    subcategoryId: json["subcategory_id"],
    rating: json["rating"],
    timesBooked: json["times_booked"],
    includedItems: json["included_items"] == null ? [] : List<String>.from(json["included_items"]!.map((x) => x)),
    notIncludedItems: json["not_included_items"] == null ? [] : List<String>.from(json["not_included_items"]!.map((x) => x)),
    additionalInformation: json["additional_information"] == null ? [] : List<String>.from(json["additional_information"]!.map((x) => x)),
    termsConditions: json["terms_conditions"] == null ? [] : List<String>.from(json["terms_conditions"]!.map((x) => x)),
    images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "name": name,
    "description": description,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "available_quantity": availableQuantity,
    "price_per_day": pricePerDay,
    "subcategory_id": subcategoryId,
    "rating": rating,
    "times_booked": timesBooked,
    "included_items": includedItems == null ? [] : List<dynamic>.from(includedItems!.map((x) => x)),
    "not_included_items": notIncludedItems == null ? [] : List<dynamic>.from(notIncludedItems!.map((x) => x)),
    "additional_information": additionalInformation == null ? [] : List<dynamic>.from(additionalInformation!.map((x) => x)),
    "terms_conditions": termsConditions == null ? [] : List<dynamic>.from(termsConditions!.map((x) => x)),
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
  };
}

class Image {
  int? id;
  int? productId;
  String? imageUrl;
  DateTime? createdAt;
  DateTime? updatedAt;

  Image({
    this.id,
    this.productId,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"],
    productId: json["product_id"],
    imageUrl: json["image_url"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "image_url": imageUrl,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
