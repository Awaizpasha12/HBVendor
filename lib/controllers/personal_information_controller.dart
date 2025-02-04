import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happybash/api_call/api_config.dart';
import 'package:happybash/api_call/api_service.dart';
import 'package:happybash/common/common_method.dart';
import 'package:happybash/model/business_category_model.dart';
import 'package:happybash/model/user_details_model.dart';
import 'package:happybash/screens/onboarding_screen.dart';
import 'package:happybash/utility/colors.dart';
import 'package:dio/dio.dart' as dio;
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../screens/complate_msg_screen.dart';
import '../screens/document_screen.dart';

class PersonalInformationController extends GetxController {
  static PersonalInformationController get to => Get.find();

  //for Country code........
  var selectedCountryCode = 'KW'.obs;
  var selectedCountryPhone = '+965'.obs;
  var selectedCountryCodeA = 'KW'.obs;
  var selectedCountryPhoneA = '+965'.obs;

  //variable for date...........
  Rx selectedDate = DateTime.now().obs;
  TextEditingController dateOfBirthController = TextEditingController();

  //Function for DatePicked...............
  void pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate.value,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: color2A9DA0,
              colorScheme: const ColorScheme.light(
                primary: color2A9DA0,
                onPrimary: Colors.white,
                onSurface: color969AA4,
              ),
              dialogBackgroundColor: Colors.white, // Background color of the dialog
            ),
            child: child!,
          );
        });
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      dateOfBirthController.text = formattedDate;
    }
  }

  // Function for User Register......
  RxBool createUserLoader = false.obs;

  createUser(Map<String, dynamic> params) async {
    await apiServiceCall(
      params: params,
      serviceUrl: ApiConfig.userRegister,
      success: (dio.Response<dynamic> response) {
        Get.offAll(() => OnboardingOneScreen());
      },
      error: (dio.Response<dynamic> response) {},
      isStopAction: false.obs,
      isLoading: createUserLoader,
      methodType: ApiConfig.methodPOST,
    );
  }

  //Function for Business Document......
  RxBool storeBusinessDocumentLoader = false.obs;

  storeBusinessDocumentApiCall(dio.FormData formData, Function callBack) async {
    await apiServiceCall(
      params: {},
      formValues: formData,
      serviceUrl: ApiConfig.storeBusinessDocument,
      success: (dio.Response<dynamic> response) {
       callBack();
      },
      error: (dio.Response<dynamic> response) {},
      isStopAction: true.obs,
      isLoading: storeBusinessDocumentLoader,
      methodType: ApiConfig.methodPOST,
    );
  }

  RxBool storePersonalInfoLoader = false.obs;

  storePersonalInfoApiCall(dio.FormData formData, Function callBack) async {
    await apiServiceCall(
      params: {},
      formValues: formData,
      serviceUrl: ApiConfig.storePersonalInfo,
      success: (dio.Response<dynamic> response) async {
        callBack();
      },
      error: (dio.Response<dynamic> response) {
        print(response.data.toString().toLowerCase().contains("email"));
        if (response.data.toString().toLowerCase().contains("email")) {
          showSnackBar(title: ApiConfig.error, message: "The email has already been taken.");
        }
      },
      isStopAction: true.obs,
      isLoading: storePersonalInfoLoader,
      methodType: ApiConfig.methodPOST,
    );
  }

  //Function for Tnc Document......
  RxBool storeTncDocumentLoader = false.obs;

  storeTncDocumentApiCall(dio.FormData formData, Function callBack) async {
    await apiServiceCall(
      params: {},
      formValues: formData,
      serviceUrl: ApiConfig.storeTncDocument,
      success: (dio.Response<dynamic> response) {
       callBack();
      },
      error: (dio.Response<dynamic> response) {},
      isStopAction: false.obs,
      isLoading: storeTncDocumentLoader,
      methodType: ApiConfig.methodPOST,
    );
  }

  //Function for Status Update ......
  RxBool statusUpdateLoader = false.obs;

  storeStatusUpdateApiCall() async {
    await apiServiceCall(
      params: {},
      serviceUrl: ApiConfig.statusUpdate,
      success: (dio.Response<dynamic> response) {
        Get.offAll(() => ComplateMsgScreen());
        showSnackBar(title: ApiConfig.success, message: "Uploaded successfully");
      },
      error: (dio.Response<dynamic> response) {},
      isStopAction: false.obs,
      isLoading: statusUpdateLoader,
      methodType: ApiConfig.methodPOST,
    );
  }

//Function For Get User Data............
  RxBool userDetailsLoader = false.obs;
  Rx<UserDetailsModel> userDetailsData = UserDetailsModel().obs;

  getUserDetailsApiCall(Function callBack) async {
    userDetailsData.value = UserDetailsModel();
    userDetailsData.refresh();
    await apiServiceCall(
      params: {},
      serviceUrl: ApiConfig.userDetails,
      success: (dio.Response<dynamic> response) {
        userDetailsData.value = UserDetailsModel.fromJson(jsonDecode(response.data));
        callBack();
      },
      error: (dio.Response<dynamic> response) {},
      isStopAction: false.obs,
      isLoading: userDetailsLoader,
      methodType: ApiConfig.methodGET,
    );
  }
  //Function For Get Business Category Data............
  RxBool businessCategoryLoader = false.obs;
  Rx<BusinessCategoryModel> businessCategoryData = BusinessCategoryModel().obs;

  getBusinessCategoryApiCall(Function callBack) async {
    businessCategoryData.value = BusinessCategoryModel();
    businessCategoryData.refresh();
    await apiServiceCall(
      params: {},
      serviceUrl: ApiConfig.businessCategory,
      success: (dio.Response<dynamic> response) {
       print(response.data);
        businessCategoryData.value = BusinessCategoryModel.fromJson(jsonDecode(response.data));
        callBack();
      },
      error: (dio.Response<dynamic> response) {},
      isStopAction: false.obs,
      isLoading: businessCategoryLoader,
      methodType: ApiConfig.methodGET,
    );
  }




}
