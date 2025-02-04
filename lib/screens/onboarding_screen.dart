import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:happybash/api_call/api_config.dart';
import 'package:happybash/common/common_method.dart';
import 'package:happybash/common/common_widget.dart';
import 'package:happybash/screens/login_vendor_screen.dart';
import 'package:happybash/screens/otp_varification_screen.dart';
import 'package:happybash/utility/colors.dart';
import 'package:happybash/utility/common_string.dart';
import 'package:happybash/utility/styles.dart';

import '../controllers/auth_controller.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  Country? _selectedCountry;
  bool? isVendor;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFFFFFF,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: colorFFFFFF,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16).r,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                    child: CommonButton(
                      onPressed: (){
                        isVendor = true;
                        Get.to(() =>  LoginVendorScreen());
                      },
                  decoration: BoxDecoration(
                    border: Border.all(color: color2A9DA0),
                    borderRadius: BorderRadius.circular(36).r,
                  ),
                  color: colorFFFFFF,
                  isLoading: false,
                  title: logInAsVendor.tr,
                  style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600, color: color2A9DA0),
                )),
                const SizedBox(
                  width: 16,
                ),
                Flexible(
                    child: CommonButton(
                  onPressed: () {
                    Get.to(() => const OnboardingOneScreen());
                  },
                  isLoading: false,
                  title: registerForVendor.tr,
                  style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600, color: colorFFFFFF),
                )),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              'assets/images/background_img.png',
              width: double.infinity,
              fit: BoxFit.cover,

            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Text(
                    easierFasterHappier.tr,
                    style: color000000w70024,
                  ),
                  Text(
                    elevateYourEventPlanning.tr,
                    style: color333333w60022,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15.h,
                  )
                ],
              ),
            ),
            // Row(
            //   children: [
            //     Flexible(child: CommonButton(isLoading: false, title: "Log in as vendor")),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}

//Onboarding secound screen............
class OnboardingOneScreen extends StatefulWidget {
  const OnboardingOneScreen({super.key});

  @override
  State<OnboardingOneScreen> createState() => _OnboardingOneScreenState();
}

class _OnboardingOneScreenState extends State<OnboardingOneScreen> {
  bool agree = false;
  TextEditingController mobileNumberController = TextEditingController();
  RxString selectedCountryCode = "KW".obs;
  RxString selectedCountryPhone = "+965".obs;
  final GlobalKey<FormState> phoneKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        backgroundColor: colorFFFFFF,
        body: SingleChildScrollView(
          child: Form(
            key: phoneKey,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  width: double.infinity,
                  'assets/images/let_dis_bg.png',
                  scale: 3,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        enterMobileNumber.tr,
                        style: color2B2E35w40018,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      commonTextFiled(
                          validationFunction: (value) {
                            if ((value ?? "").isEmpty) {
                              return pleaseEnterMobileNumber.tr;
                            }
                            final regExpIndia = selectedCountryCode.value == "IN" ? RegExp(r'^(?:\+91|91)?[6-9]\d{9}$') : RegExp(r'^(?:\+965)?[1-9]\d{7}$');

                            if (regExpIndia.hasMatch(value)) {
                              print(value);
                              return null;
                            } else {
                              return selectedCountryCode.value == "IN" ? pleaseEnterValidIndianPhoneNumber.tr : pleaseEnterValidKuwaitiPhoneNumber.tr;
                            }
                          },
                          keyboardType: TextInputType.number,
                          preFixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 15.w),
                              Obx(() => GestureDetector(
                                    onTap: () {
                                      showCountryPicker(
                                        useRootNavigator: true,
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
                                        onSelect: <String>(Country country) {
                                          setState(() {
                                            selectedCountryCode.value = country.countryCode;
                                            selectedCountryPhone.value = "+${country.phoneCode}";
                                            print('Select country: ${country.toJson()}');
                                            //  print(Utils.countryCodeToEmoji(country.countryCode));
                                          });
                                        },
                                      );
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          selectedCountryPhone.value,
                                          style: color969AA4w40016,
                                        ),
                                        const Icon(
                                          Icons.arrow_drop_down_rounded,
                                          color: color969AA4,
                                        ),
                                        const SizedBox(width: 8),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                          hintText: "e.g. 99999888",
                          textEditingController: mobileNumberController),
                      const SizedBox(
                        height: 21,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20.w,
                            height: 20.h,
                            child: Checkbox(
                                checkColor: colorFFFFFF,
                                activeColor: color2A9DA0,
                                value: agree,
                                onChanged: (value) {
                                  setState(() {
                                    agree = value!;
                                  });
                                }),
                          ),
                          SizedBox(width: 15.w),
                          RichText(
                            text: TextSpan(
                              //style: DefaultTextStyle.of(context).style,
                              children: [
                                TextSpan(
                                  text: signUpAgree.tr,
                                  style: TextStyle(color: Color(0xFF2B2E35)),
                                ),
                                TextSpan(
                                  text: termsOfUse.tr,
                                  style: TextStyle(color: Color(0xFFFF5963)),
                                ),
                                TextSpan(
                                  text: and.tr,
                                  style: TextStyle(color: Color(0xFF2B2E35)),
                                ),
                                TextSpan(
                                  text: privacyPolicy.tr,
                                  style: TextStyle(color: Color(0xFFFF5963)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Obx(
                        () => CommonButton(
                          isLoading: AuthController.to.sendOtpLoader.value,
                          title: sendOTP.tr,
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            if (phoneKey.currentState!.validate()) {
                              if (agree == true) {
                                await AuthController.to.sendOtpApiCall({"country_code": selectedCountryPhone.value, "mobile": mobileNumberController.text}, () {
                                  Get.to(() => OtpVerificationScreen(params: {"country_code": selectedCountryPhone.value, "mobile": mobileNumberController.text, }));
                                });
                              } else {
                                showSnackBar(title: ApiConfig.error, message: acceptTermsAndConditions.tr);
                              }
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
