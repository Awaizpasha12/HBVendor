// To parse this JSON data, do
//
//     final UserDetailsModel = UserDetailsModelFromJson(jsonString);

import 'dart:convert';

UserDetailsModel userDetailsModelFromJson(String str) => UserDetailsModel.fromJson(json.decode(str));

String userDetailsModelToJson(UserDetailsModel data) => json.encode(data.toJson());

class UserDetailsModel {
  Data? data;

  UserDetailsModel({
    this.data,
  });

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) => UserDetailsModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class Data {
  int? id;
  dynamic name;
  String? email;
  dynamic locationId;
  String? role;
  String? phone;
  dynamic avatar;
  dynamic emailVerifiedAt;
  dynamic idToken;
  int? isGoogle;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  Vendor? vendor;

  Data({
    this.id,
    this.name,
    this.email,
    this.locationId,
    this.role,
    this.phone,
    this.avatar,
    this.emailVerifiedAt,
    this.idToken,
    this.isGoogle,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.vendor,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    locationId: json["location_id"],
    role: json["role"],
    phone: json["phone"],
    avatar: json["avatar"],
    emailVerifiedAt: json["email_verified_at"],
    idToken: json["id_token"],
    isGoogle: json["is_google"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    vendor: Vendor.fromJson(json["vendor"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "location_id": locationId,
    "role": role,
    "phone": phone,
    "avatar": avatar,
    "email_verified_at": emailVerifiedAt,
    "id_token": idToken,
    "is_google": isGoogle,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "vendor": vendor?.toJson(),
  };
}

class Vendor {
  int? id;
  int? userId;
  String? firstName;
  String? lastName;
  String? businessName;
  DateTime? dateOfBirth;
  String? primaryMobileNumber;
  String? whatsappNumber;
  String? email;
  String? businessCategory;
  String? city;
  String? address;
  String? languages;
  String? profilePicture;
  String? referralCode;
  String? status;
  dynamic comment;
  DateTime? createdAt;
  DateTime? updatedAt;
  Vendor? personalInfo;
  BusinessDocument? businessDocument;
  TncDocument? tncDocument;

  Vendor({
    this.id,
    this.userId,
    this.firstName,
    this.lastName,
    this.businessName,
    this.dateOfBirth,
    this.primaryMobileNumber,
    this.whatsappNumber,
    this.email,
    this.businessCategory,
    this.city,
    this.address,
    this.languages,
    this.profilePicture,
    this.referralCode,
    this.status,
    this.comment,
    this.createdAt,
    this.updatedAt,
    this.personalInfo,
    this.businessDocument,
    this.tncDocument,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
    id: json["id"],
    userId: json["user_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    businessName: json["business_name"],
    dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
    primaryMobileNumber: json["primary_mobile_number"],
    whatsappNumber: json["whatsapp_number"],
    email: json["email"],
    businessCategory: json["business_category"],
    city: json["city"],
    address: json["address"],
    languages: json["languages"],
    profilePicture: json["profile_picture"],
    referralCode: json["referral_code"],
    status: json["status"],
    comment: json["comment"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    personalInfo: json["personal_info"] == null ? null : Vendor.fromJson(json["personal_info"]),
    businessDocument: json["business_document"] == null ? null : BusinessDocument.fromJson(json["business_document"]),
    tncDocument: json["tnc_document"] == null ? null : TncDocument.fromJson(json["tnc_document"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "first_name": firstName,
    "last_name": lastName,
    "business_name": businessName,
    "date_of_birth": "${dateOfBirth?.year.toString().padLeft(4, '0')}-${dateOfBirth?.month.toString().padLeft(2, '0')}-${dateOfBirth?.day.toString().padLeft(2, '0')}",
    "primary_mobile_number": primaryMobileNumber,
    "whatsapp_number": whatsappNumber,
    "email": email,
    "business_category": businessCategory,
    "city": city,
    "address": address,
    "languages": languages,
    "profile_picture": profilePicture,
    "referral_code": referralCode,
    "status": status,
    "comment": comment,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "personal_info": personalInfo?.toJson(),
    "business_document": businessDocument?.toJson(),
    "tnc_document": tncDocument?.toJson(),
  };
}

class BusinessDocument {
  int? id;
  int? vendorId;
  String? commercialRegistration;
  String? moaOfCompany;
  String? tradeLicense;
  String? signatureOfClient;
  String? ibanCertificate;
  String? civilCardDocumentFront;
  String? civilCardDocumentBack;
  String? status;
  dynamic comment;
  DateTime? createdAt;
  DateTime? updatedAt;

  BusinessDocument({
    this.id,
    this.vendorId,
    this.commercialRegistration,
    this.moaOfCompany,
    this.tradeLicense,
    this.signatureOfClient,
    this.ibanCertificate,
    this.civilCardDocumentFront,
    this.civilCardDocumentBack,
    this.status,
    this.comment,
    this.createdAt,
    this.updatedAt,
  });

  factory BusinessDocument.fromJson(Map<String, dynamic> json) => BusinessDocument(
    id: json["id"],
    vendorId: json["vendor_id"],
    commercialRegistration: json["commercial_registration"],
    moaOfCompany: json["moa_of_company"],
    tradeLicense: json["trade_license"],
    signatureOfClient: json["signature_of_client"],
    ibanCertificate: json["iban_certificate"],
    civilCardDocumentFront: json["civil_card_document_front"],
    civilCardDocumentBack: json["civil_card_document_back"],
    status: json["status"],
    comment: json["comment"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vendor_id": vendorId,
    "commercial_registration": commercialRegistration,
    "moa_of_company": moaOfCompany,
    "trade_license": tradeLicense,
    "signature_of_client": signatureOfClient,
    "iban_certificate": ibanCertificate,
    "civil_card_document_front": civilCardDocumentFront,
    "civil_card_document_back": civilCardDocumentBack,
    "status": status,
    "comment": comment,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class TncDocument {
  int? id;
  int? vendorId;
  String? tncEngDocument;
  String? tncArDocument;
  String? status;
  dynamic comment;
  DateTime? createdAt;
  DateTime? updatedAt;

  TncDocument({
    this.id,
    this.vendorId,
    this.tncEngDocument,
    this.tncArDocument,
    this.status,
    this.comment,
     this.createdAt,
    this.updatedAt,
  });

  factory TncDocument.fromJson(Map<String, dynamic> json) => TncDocument(
    id: json["id"],
    vendorId: json["vendor_id"],
    tncEngDocument: json["tnc_eng_document"],
    tncArDocument: json["tnc_ar_document"],
    status: json["status"],
    comment: json["comment"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vendor_id": vendorId,
    "tnc_eng_document": tncEngDocument,
    "tnc_ar_document": tncArDocument,
    "status": status,
    "comment": comment,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
