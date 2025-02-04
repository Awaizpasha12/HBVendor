import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:happybash/common/common_widget.dart';
import 'package:happybash/controllers/personal_information_controller.dart';
import 'package:happybash/screens/civil_upload_one_screen.dart';
import 'package:happybash/utility/colors.dart';
import 'package:happybash/utility/common_string.dart';
import 'package:happybash/utility/styles.dart';
import 'package:dio/dio.dart' as dio;
import '../api_call/api_config.dart';
import '../common/common_method.dart';
import 'package:multiselect/multiselect.dart';
import 'document_screen.dart';

class PersonalInformationScreenEdit extends StatefulWidget {
  const PersonalInformationScreenEdit({super.key, this.isEdit});

  final bool? isEdit;

  @override
  State<PersonalInformationScreenEdit> createState() => _PersonalInformationScreenEditState();
}

class _PersonalInformationScreenEditState extends State<PersonalInformationScreenEdit> {
  //GetX Controllers...........
  final PersonalInformationController personalInformationController = Get.put(PersonalInformationController());

  //Validation upload Document...........
  List<String> allowedExtensions = ["jpeg", "png", "jpg", "heif", "heic"];
  List<String> languageList = [english.tr, arabic.tr];

  List<String> businessCategoryName = [];
  List<String> businessCategoryId = [];

  String selectedLanguage = "";
  List<String> selectedOptionLanguageList = [];

  String? selectedItem;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getData();
    });
  }

  getData() async {
    await PersonalInformationController.to.getUserDetailsApiCall(() {});
    await PersonalInformationController.to.getBusinessCategoryApiCall(() {});
    businessCategoryName = personalInformationController.businessCategoryData.value.data!.map((e) => e.name.toString()).toList();
    businessCategoryId = personalInformationController.businessCategoryData.value.data!.map((e) => e.id.toString()).toList();
    print(businessCategoryId);
    mobileNumberController.text = personalInformationController.userDetailsData.value.data?.phone ?? "";
    personalInformationController.selectedCountryPhone.value = personalInformationController.userDetailsData.value.data?.phone?.length == 10 ? "+91" : "+965";
    print(businessCategoryName);
  }

  //TextField Controllers.............
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController whatsAppNumberController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController createPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController completeAddressController = TextEditingController();
  TextEditingController companyLogoController = TextEditingController();
  TextEditingController referralCodeController = TextEditingController();
  TextEditingController businessCategoryController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController civilIdController = TextEditingController();

  //variables..........

  final formKey = GlobalKey<FormState>();
  //Function for validation of password and confirm password field................
  final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
  );
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (!_passwordRegExp.hasMatch(value)) {
      return "Password must be at least 8 characters long, include both uppercase and lowercase letters, a number, and a special character.";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        backgroundColor: colorFFFFFF,
        appBar: AppBar(
          backgroundColor: colorFFFFFF,
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset(
                "assets/images/Vector.png",
                scale: 4,
              )),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 27, horizontal: 21),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      businessInformation.tr,
                      style: color2B2E35w50022,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      enterDetailsServeBetter.tr,
                      style: color57585Aw40016,
                    ),
                    SizedBox(
                      height: 34.h,
                    ),
                    Text(
                      firstName.tr,
                      style: color57585Aw40016Istok,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    commonTextFiled(
                      hintText: pleaseEnterFirstName.tr,
                      textEditingController: firstNameController,
                      validationFunction: (value) {
                        if (value == null || value.isEmpty) {
                          return pleaseEnterFirstName.tr;
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    Text(
                      lastName.tr,
                      style: color57585Aw40016Istok,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    commonTextFiled(
                        hintText: pleaseEnterLastName.tr,
                        textEditingController: lastNameController,
                        validationFunction: (value) {
                          if (value == null || value.isEmpty) {
                            return pleaseEnterLastName.tr;
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 26.h,
                    ),
                    Text(
                      businessName.tr,
                      style: color57585Aw40016Istok,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    commonTextFiled(
                        hintText: pleaseEnterBusinessName.tr,
                        textEditingController: businessNameController,
                        validationFunction: (value) {
                          if (value == null || value.isEmpty) {
                            return pleaseEnterBusinessName.tr;
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 26.h,
                    ),
                    Text(
                      dateOfBirth.tr,
                      style: color57585Aw40016Istok,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        personalInformationController.pickDate(context);
                      },
                      child: commonTextFiled(
                          isReadOnly: true,
                          hintText: date.tr,
                          textEditingController: personalInformationController.dateOfBirthController,
                          suffixIcon: GestureDetector(
                            onTap: () => personalInformationController.pickDate(context),
                            child: Image.asset(
                              "assets/images/cale_icon.png",
                              scale: 4,
                            ),
                          ),
                          validationFunction: (value) {
                            if (value == null || value.isEmpty) {
                              return enterDateOfBirth.tr;
                            }
                          }),
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    Text(
                      primaryMobileNumber.tr,
                      style: color57585Aw40016Istok,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    commonTextFiled(
                        isReadOnly: true,
                        preFixIcon: Obx(() => Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 15.w),
                            Text(
                              personalInformationController.selectedCountryPhone.value,
                            ),
                            SizedBox(width: 8.w),
                          ],
                        )),
                        hintText: personalInformationController.userDetailsData.value.data?.phone ?? "",
                        keyboardType: TextInputType.number,
                        textEditingController: mobileNumberController),
                    SizedBox(
                      height: 26.h,
                    ),
                    Text(
                      whatsAppNumber.tr,
                      style: color57585Aw40016Istok,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    commonTextFiled(
                        preFixIcon: Obx(() => GestureDetector(
                              onTap: () {
                                showCountryPicker(
                                  context: context,
                                  showPhoneCode: true,
                                  countryFilter: ['KW'],
                                  countryListTheme: CountryListThemeData(
                                    bottomSheetHeight: 500.h,
                                    inputDecoration: InputDecoration(
                                      hintText: "Search",
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                      focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: color34A853), borderRadius: BorderRadius.circular(10)),
                                      disabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: color969AA4), borderRadius: BorderRadius.circular(10)),
                                      enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: color969AA4), borderRadius: BorderRadius.circular(10)),
                                      border: InputBorder.none,
                                    ),
                                    searchTextStyle: color969AA4w40016.copyWith(color: color969AA4.withOpacity(0.5)),
                                  ),
                                  onSelect: (Country country) {
                                    personalInformationController.selectedCountryCode.value = country.countryCode;
                                    personalInformationController.selectedCountryPhoneA.value = "+${country.phoneCode}";
                                  },
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(width: 15.w),
                                  Text(
                                    personalInformationController.selectedCountryPhoneA.value,
                                  ),
                                  const Icon(
                                    Icons.arrow_drop_down_rounded,
                                    color: Color(0xFF1E1E1E),
                                  ),
                                  SizedBox(width: 8.w),
                                ],
                              ),
                            )),
                        hintText: number.tr,
                        validationFunction: (value) {
                          if ((value ?? "").isEmpty) {
                            return pleaseEnterMobileNumber.tr;
                          }
                          final regExpIndia = personalInformationController.selectedCountryCode.value == "IN" ? RegExp(r'^(?:\+91|91)?[6-9]\d{9}$') : RegExp(r'^(?:\+965)?[1-9]\d{7}$');

                          if (regExpIndia.hasMatch(value)) {
                            print(value);
                            return null;
                          } else {
                            return personalInformationController.selectedCountryCode.value == "IN" ? 'Please enter a valid Indian phone number' : 'Please enter a valid Kuwaiti phone number';
                          }
                        },
                        keyboardType: TextInputType.number,
                        textEditingController: whatsAppNumberController),
                    SizedBox(
                      height: 26.h,
                    ),
                    Text(
                      emailAddress.tr,
                      style: color57585Aw40016Istok,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    commonTextFiled(
                        hintText: emailAddress.tr,
                        textEditingController: emailAddressController,
                        validationFunction: (value) {
                          if (value == null || value.isEmpty) {
                            return enterEmailAddress.tr;
                          } else if (!GetUtils.isEmail(value)) {
                            return enterValidEmailAddress.tr;
                          }
                        }),
                    SizedBox(
                      height: 26.h,
                    ),
                    Text(
                      password.tr,
                      style: color57585Aw40016Istok,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    commonTextFiled(
                        hintText: password.tr,
                        textEditingController: createPasswordController,
                        validationFunction: _validatePassword),
                    SizedBox(
                      height: 26.h,
                    ),
                    Text(
                      confirmPassword.tr,
                      style: color57585Aw40016Istok,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    commonTextFiled(
                        hintText: confirmPassword.tr,
                        textEditingController: confirmPasswordController,
                        validationFunction:_validatePassword),
                    SizedBox(
                      height: 26.h,
                    ),
                    Text(
                      city.tr,
                      style: color57585Aw40016Istok,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    commonTextFiled(
                        hintText: kuwaitCity.tr,
                        textEditingController: cityController,
                        suffixIcon: Image.asset(
                          "assets/images/Vector_right.png",
                          scale: 4,
                        ),
                        validationFunction: (value) {
                          if (value == null || value.isEmpty) {
                            return enterCity.tr;
                          }
                        }),
                    SizedBox(
                      height: 26.h,
                    ),
                    Text(
                      completeAddress.tr,
                      style: color57585Aw40016Istok,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    commonTextFiled(
                        hintText: searchAddress.tr,
                        textEditingController: completeAddressController,
                        validationFunction: (value) {
                          if (value == null || value.isEmpty) {
                            return enterCompleteAddress.tr;
                          }
                        }),
                    SizedBox(
                      height: 26.h,
                    ),
                    Text(
                      companyLogo.tr,
                      style: color57585Aw40016Istok,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    DottedBorder(
                      color: color969AA4,
                      strokeWidth: 2,
                      dashPattern: const [3, 4],
                      borderType: BorderType.RRect,
                      // Border type: RRect, Rect, Circle, etc.
                      radius: const Radius.circular(9.23),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.23),
                        ),
                        height: 90.58,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            companyLogoController.text.isEmpty
                                ? Image.asset(
                                    "assets/images/company-profile.png",
                                    scale: 4,
                                  )
                                : SizedBox(
                                    height: 90.58,
                                    width: 90.58,
                                    child: Image.file(
                                      File(companyLogoController.text),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                            SizedBox(
                              height: 22.29.h,
                            ),
                            SizedBox(
                              height: 39.99,
                              width: 189,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: colorFFFFFF,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(color: colorFF5963),
                                      borderRadius: BorderRadius.circular(47.55),
                                    ),
                                  ),
                                  onPressed: () async {
                                    FilePickerResult? result = await FilePicker.platform.pickFiles(
                                      type: FileType.custom,
                                      allowedExtensions: allowedExtensions,
                                    );
                                    if (result != null) {
                                      File file = File(result.files.single.path ?? "");
                                      String fileExtension = file.path.split('.').last.toLowerCase();
                                      if (allowedExtensions.contains(fileExtension)) {
                                        companyLogoController.text = file.path;
                                        setState(() {});
                                      } else {
                                        print("Invalid file type");
                                        showSnackBar(title: ApiConfig.error, message: "Invalid file type.");
                                      }
                                    } else {
                                      showSnackBar(title: ApiConfig.error, message: fileNotSelected.tr);
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/Subtract.png",
                                        scale: 4,
                                      ),
                                      SizedBox(
                                        width: 11.w,
                                      ),
                                      Text(
                                        uploadPhoto.tr,
                                        style: colorFF5963w40018,
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    Text(
                      referralCode.tr,
                      style: color57585Aw40016Istok,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    commonTextFiled(
                      hintText: enterReferralCode.tr,
                      textEditingController: referralCodeController,
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    Text(
                      businessCategory.tr,
                      style: color57585Aw40016Istok,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    DropdownButtonFormField2(
                      decoration: InputDecoration(
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: color969AA4),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: color34A853),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        contentPadding: const EdgeInsets.only(top: 14, right: 16, bottom: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      isExpanded: true,
                      hint: Text(
                        selectOption.tr,
                        textAlign: TextAlign.start,
                        style: color969AA4w40016.copyWith(color: color969AA4.withOpacity(0.5)),
                      ),
                      items: businessCategoryName
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ))
                          .toList(),
                      // Validation
                      validator: (value) {
                        if (value == null) {
                          return pleaseSelectOption.tr;
                        }
                        return null;
                      },
                      // On change handler
                      onChanged: (value) {
                        setState(() {
                          selectedItem = value as String;
                          print("Selected item: $selectedItem");
                        });
                      },
                      // Save the selected value
                      onSaved: (value) {
                        selectedItem = value as String?;
                      },
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    Text(
                      languagesYouKnow.tr,
                      style: color57585Aw40016Istok,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    DropDownMultiSelect(
                      // validator: (value) {
                      //   if (value == null) {
                      //     return 'Please Select at least one language.';
                      //   }
                      //   return "";
                      // },
                      selectedValuesStyle: color969AA4w40016.copyWith(color: color969AA4.withOpacity(0.5)),
                      decoration: InputDecoration(
                        filled: true,
                        hintStyle: color969AA4w40016.copyWith(color: color969AA4.withOpacity(0.5)),
                        fillColor: colorFFFFFF,
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: color969AA4),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: color34A853),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        contentPadding: const EdgeInsets.only(top: 14, right: 16, left: 16, bottom: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      options: languageList,
                      selectedValues: selectedOptionLanguageList,
                      onChanged: (value) {
                        selectedOptionLanguageList = value;
                        // selectedLanguage = "";
                        for (var element in selectedOptionLanguageList) {
                          selectedLanguage = "$selectedLanguage $element"; // prints 1, 2, 3
                        }
                      },
                      whenEmpty: selectLanguage.tr,
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    Obx(() => CommonButton(
                          height: 53.72,
                          isLoading: PersonalInformationController.to.storePersonalInfoLoader.value,
                          title: submit.tr,
                          onPressed: () async {
                            FocusScope.of(context).requestFocus(FocusNode());
                            if (formKey.currentState!.validate()) {
                              if(createPasswordController.text != confirmPasswordController.text){
                                showSnackBar(title: ApiConfig.error, message: "Password and confirm password doesn't match");
                                return;
                              }

                              if (companyLogoController.text.isEmpty) {
                                showSnackBar(title: ApiConfig.error, message: "Please upload company logo");
                                return;
                              }
                              //
                              var formData = dio.FormData.fromMap({
                                "first_name": firstNameController.text,
                                "profile_picture": await dio.MultipartFile.fromFile(companyLogoController.text, filename: companyLogoController.text.split('/').last),
                                "last_name": lastNameController.text,
                                "business_name": businessNameController.text,
                                "date_of_birth": personalInformationController.dateOfBirthController.text,
                                "primary_mobile_number": mobileNumberController.text,
                                "whatsapp_number": whatsAppNumberController.text,
                                "email": emailAddressController.text,
                                "password": createPasswordController.text,
                                "city": cityController.text,
                                "address": completeAddressController.text,
                                "business_category": selectedItem=="Food & Dining"? businessCategoryId[0]:businessCategoryId[1],
                                "referral_code": referralCodeController.text,
                                "languages": selectedOptionLanguageList.join(","),
                              });
                              await PersonalInformationController.to.storePersonalInfoApiCall(formData, () {
                                if (widget.isEdit == true) {
                                  Get.back();
                                  showSnackBar(title: ApiConfig.success, message: "Uploaded successfully");
                                } else {
                                  Get.back();
                                  Get.back();
                                  Get.to(() => DocumentScreen());
                                  showSnackBar(title: ApiConfig.success, message: "Uploaded successfully");
                                }
                              });
                            }
                            // Get.to(const CivilUploadOneScreen());
                          },
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
