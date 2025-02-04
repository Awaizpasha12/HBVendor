import 'dart:convert';

import 'package:get/get.dart';
import 'package:happybash/api_call/api_config.dart';
import 'package:happybash/api_call/api_service.dart';
import 'package:dio/dio.dart' as dio;
import 'package:happybash/common/common_method.dart';
import 'package:happybash/controllers/personal_information_controller.dart';
import 'package:happybash/main.dart';
import 'package:happybash/screens/onboarding_screen.dart';

import '../common/common_bottom_navigationbar.dart';
import '../model/verify_otp_model.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  //Function for Otp Verification......
  RxBool otpVerificationLoader = false.obs;
  Rx<VerifyOtpModel> verifyOtpModel = VerifyOtpModel().obs;

  loginVerifyOtpApiCall(Map<String, dynamic> params, Function onSuccess) async {
    await apiServiceCall(
      params: params,
      serviceUrl: ApiConfig.loginVerifyOtp,
      success: (dio.Response<dynamic> response) {
        verifyOtpModel.value = VerifyOtpModel.fromJson(jsonDecode(response.data));
        setObject("verify_otp", verifyOtpModel.value);
        onSuccess();
        //Get.offAll(() => RegistrationSuccessfulScreen());
      },
      error: (dio.Response<dynamic> response) {
        showSnackBar(title: ApiConfig.error, message: jsonDecode(response.data)['error']);
      },
      isStopAction: false.obs,
      isLoading: otpVerificationLoader,
      methodType: ApiConfig.methodPOST,
    );
  }

  //Function for  send Otp request......
  RxBool sendOtpLoader = false.obs;

  sendOtpApiCall(Map<String, dynamic> params, Function onSuccess) async {
    await apiServiceCall(
      params: params,
      serviceUrl: ApiConfig.loginRequestOtp,
      success: (dio.Response<dynamic> response) {
        onSuccess();
        //Get.offAll(() => RegistrationSuccessfulScreen());
      },
      error: (dio.Response<dynamic> response) {
        showSnackBar(title: ApiConfig.error, message: jsonDecode(response.data)['error']);
      },
      isStopAction: false.obs,
      isLoading: sendOtpLoader,
      methodType: ApiConfig.methodPOST,
    );
  }

  RxBool otpSendLoader = false.obs;

  otpSendApiCall(Map<String, dynamic> params, Function onSuccess) async {
    await apiServiceCall(
      params: params,
      serviceUrl: ApiConfig.otpSend,
      success: (dio.Response<dynamic> response) {
        onSuccess();
        //Get.offAll(() => RegistrationSuccessfulScreen());
      },
      error: (dio.Response<dynamic> response) {
        showSnackBar(title: ApiConfig.error, message: jsonDecode(response.data)['message']);
      },
      isStopAction: false.obs,
      isLoading: otpSendLoader,
      methodType: ApiConfig.methodPOST,
    );
  }
  RxBool logoutLoader = false.obs;

  logoutApiCall() async {
    await apiServiceCall(
      params: {},
      serviceUrl: ApiConfig.logout,
      success: (dio.Response<dynamic> response) {
        Get.offAll(() => OnboardingScreen());
        showSnackBar(title: ApiConfig.success, message: "Logged out successfully");
        getPreference.erase();
      },
      error: (dio.Response<dynamic> response) {
        showSnackBar(title: ApiConfig.error, message: jsonDecode(response.data)['error']);
      },
      isStopAction: false.obs,
      isLoading: logoutLoader,
      methodType: ApiConfig.methodPOST,
    );
  }

  RxBool vendorDeleteAccountLoader = false.obs;

  vendorDeleteAccountApiCall() async {
    await apiServiceCall(
      params: {},
      serviceUrl: ApiConfig.vendorDelete,
      success: (dio.Response<dynamic> response) {
        Get.offAll(() => OnboardingScreen());
        showSnackBar(title: ApiConfig.success, message: "Vendor Account deleted successfully.");
        getPreference.erase();
      },
      error: (dio.Response<dynamic> response) {
        showSnackBar(title: ApiConfig.error, message: jsonDecode(response.data)['error']);
      },
      isStopAction: false.obs,
      isLoading: vendorDeleteAccountLoader,
      methodType: ApiConfig.methodDELETE,
    );
  }

  //Function for Otp Login......
  RxBool loginUserLoader = false.obs;

  userLoginApiCall(Map<String, dynamic> params) async {
    await apiServiceCall(
      params: params,
      serviceUrl: ApiConfig.userLogin,
      success: (dio.Response<dynamic> response) async {
        verifyOtpModel.value = VerifyOtpModel.fromJson(jsonDecode(response.data));
        setObject("verify_otp", verifyOtpModel.value);
        await PersonalInformationController.to.getUserDetailsApiCall(() {
          setObject("authUserData", PersonalInformationController.to.userDetailsData.value);
          setIsLogin(isLogin: true);
          Get.offAll(()=> const CommonBottomNavigationBar());
        });
        //Get.offAll(() => RegistrationSuccessfulScreen());
      },
      error: (dio.Response<dynamic> response) {
        showSnackBar(title: ApiConfig.error, message: jsonDecode(response.data)['message']);
        //Get.offAll(() => RegistrationSuccessfulScreen());
      },
      isStopAction: false.obs,
      isLoading: loginUserLoader,
      methodType: ApiConfig.methodPOST,
    );
  }
}
