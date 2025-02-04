// To parse this JSON data, do
//
//     final dashboardModel = dashboardModelFromJson(jsonString);

import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) => DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
  Data? data;

  DashboardModel({
    this.data,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class Data {
  Statistics? statistics;
  List<RecentProduct>? recentProducts;

  Data({
    this.statistics,
    this.recentProducts,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    statistics: json["statistics"] == null ? null : Statistics.fromJson(json["statistics"]),
    recentProducts: json["recent_products"] == null ? [] : List<RecentProduct>.from(json["recent_products"]!.map((x) => RecentProduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statistics": statistics?.toJson(),
    "recent_products": recentProducts == null ? [] : List<dynamic>.from(recentProducts!.map((x) => x.toJson())),
  };
}

class RecentProduct {
  int? id;
  int? productId;
  String? imageUrl;
  DateTime? createdAt;
  DateTime? updatedAt;
  Product? product;

  RecentProduct({
    this.id,
    this.productId,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  factory RecentProduct.fromJson(Map<String, dynamic> json) => RecentProduct(
    id: json["id"],
    productId: json["product_id"],
    imageUrl: json["image_url"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    product: json["product"] == null ? null : Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "image_url": imageUrl,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "product": product?.toJson(),
  };
}

class Product {
  int? id;
  String? name;

  Product({
    this.id,
    this.name,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Statistics {
  int? totalSales;
  int? totalOders;
  int? delivered;
  int? pending;
  int? products;
  int? offline;
  int? confirmation;
  int? cancelled;

  Statistics({
    this.totalSales,
    this.totalOders,
    this.delivered,
    this.pending,
    this.products,
    this.offline,
    this.confirmation,
    this.cancelled,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
    totalSales: json["total_sales"],
    totalOders: json["total_oders"],
    delivered: json["delivered"],
    pending: json["pending"],
    products: json["products"],
    offline: json["offline"],
    confirmation: json["confirmation"],
    cancelled: json["cancelled"],
  );

  Map<String, dynamic> toJson() => {
    "total_sales": totalSales,
    "total_oders": totalOders,
    "delivered": delivered,
    "pending": pending,
    "products": products,
    "offline": offline,
    "confirmation": confirmation,
    "cancelled": cancelled,
  };
}
