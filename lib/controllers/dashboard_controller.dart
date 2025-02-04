import 'dart:convert';

import 'package:get/get.dart';
import 'package:happybash/api_call/api_config.dart';
import 'package:happybash/api_call/api_service.dart';
import 'package:dio/dio.dart' as dio;
import 'package:happybash/common/common_method.dart';

import '../model/dashboard_model.dart';
import '../model/product_model.dart';
import '../model/verify_otp_model.dart';

class DashboardController extends GetxController {
  static DashboardController get to => Get.find();

  //Function For Get Business Category Data............
  RxBool dashboardLoader = false.obs;
  Rx<DashboardModel> dashboardData = DashboardModel().obs;

  getDashboardApiCall(Function callBack) async {
    dashboardData.value = DashboardModel();
    dashboardData.refresh();
    await apiServiceCall(
      params: {},
      serviceUrl: ApiConfig.dashboard,
      success: (dio.Response<dynamic> response) {
        dashboardData.value = DashboardModel.fromJson(jsonDecode(response.data));
        // callBack();
      },
      error: (dio.Response<dynamic> response) {},
      isStopAction: false.obs,
      isLoading: dashboardLoader,
      methodType: ApiConfig.methodGET,
    );
  }

  //Function For Get Business Category Data............
  RxBool productListLoader = false.obs;

  Rx<ProductModel> productData = ProductModel().obs;

  getProductApiCall(Function callBack) async {
    productData.value = ProductModel();
     productData.refresh();
    await apiServiceCall(
      params: {},
      serviceUrl: ApiConfig.products,
      success: (dio.Response<dynamic> response) {
        print(response.data);
        productData.value = ProductModel.fromJson(jsonDecode(response.data));
        // callBack();
      },
      error: (dio.Response<dynamic> response) {},
      isStopAction: false.obs,
      isLoading: productListLoader,
      methodType: ApiConfig.methodGET,
    );
  }

  //Function for  post Product details......
  RxBool productLoader = false.obs;

  productApiCall(Map<String, dynamic> params, Function onSuccess) async {
    await apiServiceCall(
      params: params,
      serviceUrl: ApiConfig.products,
      success: (dio.Response<dynamic> response) {
        onSuccess();
        //Get.offAll(() => RegistrationSuccessfulScreen());
      },
      error: (dio.Response<dynamic> response) {
        showSnackBar(title: ApiConfig.error, message: jsonDecode(response.data)['error']);
      },
      isStopAction: false.obs,
      isLoading: productLoader,
      methodType: ApiConfig.methodPOST,
    );
  }

  //Function for  post Updated Product details......
  RxBool updateProductLoader = false.obs;

  updateProductApiCall(int id, Map<String, dynamic> params,Function onSuccess) async {
    await apiServiceCall(
      params: params,
      serviceUrl: "${ApiConfig.products}/$id",
      success: (dio.Response<dynamic> response) {
        onSuccess();
        //Get.offAll(() => RegistrationSuccessfulScreen());
      },
      error: (dio.Response<dynamic> response) {
        showSnackBar(title: ApiConfig.error, message: jsonDecode(response.data)['error']);
      },
      isStopAction: false.obs,
      isLoading: updateProductLoader,
      methodType: ApiConfig.methodPUT,
    );
  }
}
