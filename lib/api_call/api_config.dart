import 'package:flutter/foundation.dart';

bool isProduction = false;

class ApiConfig {
  static const String hostname = "happybash.codintrigal.com/api/";
  static const String baseUrl = "https://thehappybash.com/api/";

  // static const String socketSchema = "wss";
  // static const String socketUrl = "$socketSchema://$hostname/ws/chat/";
  // // static const String socketUrl = "wss://dev-api.eximroutes.sg/ws/chat/";

  static const String methodPOST = "post";
  static const String methodGET = "get";
  static const String methodPUT = "put";
  static const String methodDELETE = "delete";

  static const String error = "Alert!";
  static const String success = "Success";
  static const String warning = "Warning";

  static String storePersonalInfo = "${baseUrl}vendor/store-personal-info";
  static String storeBusinessDocument = "${baseUrl}vendor/store-business-document";
  static String storeTncDocument = "${baseUrl}vendor/store-tnc-document";
  static String userLogin = "${baseUrl}vendor/login";
  static String userRegister = "${baseUrl}vendor/register";
  static String loginRequestOtp = "${baseUrl}vendor/request-otp";
  static String otpSend = "${baseUrl}vendor/send-otp";
  static String loginVerifyOtp = "${baseUrl}vendor/verify-otp";
  static String userDetails = "${baseUrl}vendor/details";
  static String businessCategory = "${baseUrl}vendor/business-categories";
  static String  statusUpdate = "${baseUrl}vendor/status-update";
  static String  dashboard = "${baseUrl}vendor/dashboard";
  static String  products = "${baseUrl}vendor/products";
  static String  logout = "${baseUrl}vendor/logout";
  static String  vendorDelete = "${baseUrl}vendor/delete";

}

const String administratorOwner = "Administrator Owner";
const String administrator = "Administrator";
const String user = "User";
const String reader = "Reader";
