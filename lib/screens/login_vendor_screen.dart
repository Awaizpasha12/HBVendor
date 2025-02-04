import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:happybash/common/common_widget.dart';
import 'package:happybash/controllers/auth_controller.dart';
import 'package:happybash/screens/otp_varification_screen.dart';
import 'package:happybash/utility/colors.dart';
import 'package:happybash/utility/common_string.dart';
import 'package:happybash/utility/styles.dart';

class LoginVendorScreen extends StatefulWidget {
  // bool isVendor;
  LoginVendorScreen({
    super.key,
  });

  @override
  State<LoginVendorScreen> createState() => _LoginVendorScreenState();
}

class _LoginVendorScreenState extends State<LoginVendorScreen> {
  final GlobalKey<FormState> phoneKey = GlobalKey<FormState>();
  String SelectedLoginMethod = "Email";
  FocusNode node = FocusNode();
  String message = weNeverShareDetails.tr;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    node.addListener(() {
      setState(() {
        if (node.hasFocus) {
          message = aVerificationCodeSent.tr;
        } else {
          message = weNeverShareDetails.tr;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFFFFFF,
      body: SingleChildScrollView(
        child: Form(
          key: phoneKey,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: color2A9DA0,
                ),
                child: Column(
                  children: [
                    AppBar(
                      leading: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(
                            "assets/images/Vector.png",
                            scale: 4,
                          )),
                      title: Text(
                        logIn.tr,
                        style: color2B2E35w50022,
                      ),
                      backgroundColor: Colors.white,
                      // AppBar color white
                      elevation: 0,
                      // Removes shadow
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(20), // Border radius of AppBar
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            congratsVendor.tr,
                            style: colorFFFFFFw70020,
                          ),
                          Image.asset("assets/images/verify_vendor.png", scale: 4.6)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 33),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              SelectedLoginMethod = "Email";
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                email.tr,
                                style: SelectedLoginMethod == "Email" ? color2A9DA0w60014 : color9B9B9Bw40014,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                height: 2,
                                width: 140,
                                color: SelectedLoginMethod == "Email" ? color2A9DA0 : colorEDEDED,
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              SelectedLoginMethod = "phone";
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                phoneNumber.tr,
                                style: SelectedLoginMethod == "phone" ? color2A9DA0w60014 : color9B9B9Bw40014,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                height: 2,
                                width: 156,
                                color: SelectedLoginMethod == "phone" ? color2A9DA0 : colorEDEDED,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SelectedLoginMethod == "Email" ? loginWithEmail(context) : loginWithPhone(context),
                  ],
                ),
              ),
              // CommonButton(
              //   onPressed: () {
              //     //On click Event.......
              //   },
              //   isLoading: false,
              //   title: signUpAsVendor.tr,
              //   height: 54,
              //   width: 211,
              // ),s
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              needHelp.tr,
              style: color2B2E35w40018Istok,
            ),
            const SizedBox(
              width: 5,
            ),
            GestureDetector(
                onTap: () {
                  //Get.to(SignUpVendorScreen());
                },
                child: Text(contactUs.tr, style: colorFF5963w40018.copyWith(decoration: TextDecoration.underline, decorationColor: colorFF5963))),
          ],
        ),
      ),
    );
  }

  TextEditingController phoneController = TextEditingController();
  RxString selectedCountryCode = "KW".obs;
  RxString selectedCountryPhone = "+965".obs;

  Widget loginWithPhone(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 16,
        ),
        Text(
          phoneNumber.tr,
          style: color595959Bw40010,
        ),
        commonPlainTextFiled(
            textFocusNode: node,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() => GestureDetector(
                      onTap: () {
                        showCountryPicker(
                          useRootNavigator: true,
                          context: context,
                          showPhoneCode: true,
                          countryFilter: ['KW'],
                          countryListTheme: CountryListThemeData(
                            bottomSheetHeight: 500,
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
                            selectedCountryCode.value = country.countryCode;
                            selectedCountryPhone.value = "+${country.phoneCode}";
                            print('Select country: ${country.toJson()}');
                          },
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            selectedCountryPhone.value,
                            style: color595959w40014,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 15,
                            width: 1.5,
                            color: color595959,
                          ),
                        ],
                      ),
                    ))
              ],
            ),
            hintText: "e.g.99999888",
            hintStyle: color595959w40014.copyWith(
                color: color595959.withOpacity(
              0.5,
            )),
            textEditingController: phoneController),
        SizedBox(
          height: 8,
        ),
        Text(
          message!,
          style: color595959w40012,
        ),
        SizedBox(
          height: 16,
        ),
        CommonButton(
          isLoading: AuthController.to.sendOtpLoader.value,
          title: "Continue",
          onPressed: () async {
            FocusScope.of(context).unfocus();
            if (phoneKey.currentState!.validate()) {
              await AuthController.to.otpSendApiCall({"country_code": selectedCountryPhone.value, "mobile": phoneController.text}, () {
                Get.to(() => OtpVerificationScreen(params: {"country_code": selectedCountryPhone.value, "mobile": phoneController.text, "isVendor": "vendor"}));
              });
            }
          },
          height: 40,
        ),
      ],
    );
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Widget loginWithEmail(context) {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        commonPlainTextFiled(
            hintText: email.tr,
            textEditingController: emailController,
            isEnabled: true,
            validationFunction: (value) {
              if ((value ?? "").isEmpty) {
                return enterEmailAddress.tr;
              }
              if (!GetUtils.isEmail(value ?? "")) {
                return enterValidEmailAddress.tr;
              }
              return null;
            }),
        const SizedBox(
          height: 16,
        ),
        commonPlainTextFiled(
            hintText: password.tr,
            textEditingController: passwordController,
            isEnabled: true,
            validationFunction: (value) {
              if ((value ?? "").isEmpty) {
                return "Password is required";
              }
              return null;
            }),
        // const SizedBox(
        //   height: 16,
        // ),
        // Row(
        //   children: [
        //     Text(
        //       forgotPassword.tr,
        //       style: color595959w40014,
        //     ),
        //     GestureDetector(
        //         onTap: () {},
        //         child: Text(
        //           resetIt.tr,
        //           style: color2A9DA0w40014.copyWith(fontFamily: "Poppins"),
        //         )),
        //   ],
        // ),
        const SizedBox(
          height: 16,
        ),
        Obx(
          () => CommonButton(
            isLoading: AuthController.to.loginUserLoader.value,
            onPressed: () async {
              if (phoneKey.currentState!.validate()) {
                await AuthController.to.userLoginApiCall(
                  {"email": emailController.text, "password": passwordController.text},
                );
              }
            },
            title: login.tr,
            height: 40,
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Divider(thickness: 2, color: colorEDEDED),
      ],
    );
  }
}
