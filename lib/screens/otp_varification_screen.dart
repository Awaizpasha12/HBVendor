import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:happybash/common/common_bottom_navigationbar.dart';
import 'package:happybash/common/common_widget.dart';
import 'package:happybash/screens/document_screen.dart';
import 'package:happybash/screens/reg_status_review_screen.dart';
import 'package:happybash/utility/colors.dart';
import 'package:happybash/utility/common_string.dart';
import 'package:happybash/utility/styles.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../api_call/api_config.dart';
import '../common/common_method.dart';
import '../controllers/auth_controller.dart';
import '../controllers/personal_information_controller.dart';


class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, this.params});

  final Map<String, String>? params;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TextEditingController pinController = TextEditingController();
  RxString currentText = "".obs;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: colorFFFFFF,
        appBar: AppBar(
          backgroundColor: colorFFFFFF,
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset(
                'assets/images/Vector.png',
                scale: 4,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                otpVerification.tr,
                style: GoogleFonts.poppins(textStyle: color000000w60028),
              ),
              const SizedBox(
                height: 22,
              ),
              RichText(
                text: TextSpan(
                  //style: DefaultTextStyle.of(context).style,
                  children: [
                    TextSpan(
                      text: '${otpSentOnNumber.tr}  ${widget.params?['country_code']} ${widget.params?['mobile']}',
                      style: color2B2E35w40018,
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.back();
                        },
                      text: change.tr,
                      style: TextStyle(color: Color(0xFFFF5963)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 26.71.h,
              ),
              Text(
                enterOtpText.tr,
                style: color57585Aw40016,
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: const TextStyle(color: Color(0xffF6F6F6), fontWeight: FontWeight.normal),
                        length: 6,
                        obscureText: false,
                        pinTheme: PinTheme(
                            borderWidth: 1,
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(10),
                            fieldHeight: 40,
                            fieldWidth: 40,
                            selectedFillColor: colorFFFFFF,
                            selectedColor: color34A853,
                            activeFillColor: colorFFFFFF,
                            activeColor: color34A853,
                            inactiveFillColor: colorFFFFFF,
                            inactiveColor: Color(0xFFA6A6A6),
                            disabledColor: colorFFFFFF),
                        // backgroundColor: const Color(0xffF6F6F6),
                        enableActiveFill: true,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.grey,
                        cursorHeight: 20,
                        textStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 16, fontFamily: "Radian"),
                        // errorAnimationController: errorController,
                        animationType: AnimationType.fade,
                        onCompleted: (v) {},
                        onChanged: (value) {
                          currentText.value = value;
                        }),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                height: 48.h,
                child: Obx(() => CommonButton(
                      isLoading: AuthController.to.otpVerificationLoader.value || PersonalInformationController.to.userDetailsLoader.value,
                      title: verifyOTP.tr,
                      onPressed: () async {
                        if (currentText.value.length == 6) {
                          //
                          await AuthController.to.loginVerifyOtpApiCall({"country_code": widget.params?['country_code'], "mobile": widget.params?['mobile'], "otp": currentText.value, }, () async {
                            if(widget.params?['isVendor'] == "vendor" && AuthController.to.verifyOtpModel.value.user?.status == "Approved"){
                              Get.off(() => CommonBottomNavigationBar());
                            }else if (AuthController.to.verifyOtpModel.value.user?.status == "Submitted") {
                              Get.off(() => RegStatusReviewScreen());
                            } else if (AuthController.to.verifyOtpModel.value.user?.status == "Approved") {
                              Get.off(() => RegStatusReviewScreen());
                            } else{
                              Get.off(() =>DocumentScreen());
                            }
                          });
                        } else {
                          showSnackBar(title: ApiConfig.error, message: pleaseEnter6DigitCode.tr);
                        }
                      },
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
