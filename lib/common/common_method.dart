import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api_call/api_config.dart';
import '../main.dart';
import '../model/user_details_model.dart';
import '../model/verify_otp_model.dart';
import '../utility/colors.dart';

isNotEmptyString(String? string) {
  return string != null && string.isNotEmpty;
}

setIsLogin({required bool isLogin}) {
  getPreference.write('isLogin', isLogin);
}

bool getIsLogin() {
  return (getPreference.read('isLogin') ?? false);
}

List<dynamic> getRoles() {
  return (getPreference.read('roles') ?? []);
}

getObject(String key) {
  return getPreference.read(key) != null
      ? json.decode(getPreference.read(key))
      : null;
}

setObject(String key, value) {
  getPreference.write(key, json.encode(value));
}

UserDetailsModel? getUserData() {
    if (getObject("authUserData") != null) {
      UserDetailsModel profileData =
      UserDetailsModel.fromJson(getObject("authUserData"));
      return profileData;
    } else {
      return UserDetailsModel();
    }

}

VerifyOtpModel? getVerifyOtpData() {
  if (getObject("verify_otp") != null) {
    VerifyOtpModel profileData = VerifyOtpModel.fromJson(getObject("verify_otp"));
    return profileData;
  } else {
    return VerifyOtpModel();
  }
}

showSnackBar({required String title, required String message}) {
  return Get.snackbar(title, message,
      backgroundColor: Colors.transparent,
      onTap: (_) {},
      shouldIconPulse: true,
      barBlur: 0,
      isDismissible: true,
      userInputForm: Form(
          child: Wrap(
        children: [
          Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: title == ApiConfig.success ? color2FE020 : colorE43131,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black12.withOpacity(0.15), blurRadius: 20)
                  ]),
              child: Wrap(children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: colorFFFFFF,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomText(txtTitle: title, style:TextStyle())
                        ],
                      ),
                      const SizedBox(height: 15),
                      CustomText(
                          txtTitle: message,
                          // style: color22242Aw60016,
                          textOverflow: TextOverflow.visible)
                    ],
                  ),
                )
              ]))
        ],
      )),
      borderRadius: 0,
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      //boxShadows: <BoxShadow>[BoxShadow(color: Colors.black12.withOpacity(0.15), blurRadius: 16)],
      duration: const Duration(seconds: 4));
}

class CustomText extends StatelessWidget {
  final String txtTitle;
  final TextStyle? style;
  final TextAlign align;
  final int? maxLine;
  final TextOverflow? textOverflow;
  final Widget? icon;
  final Function()? onTap;

  const CustomText(
      {Key? key,
      required this.txtTitle,
      this.style,
      this.align = TextAlign.start,
      this.maxLine,
      this.onTap,
      this.icon,
      this.textOverflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return onTap != null
        ? TextButton.icon(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero)),
            onPressed: onTap,
            icon: icon ?? Container(),
            label: Text(txtTitle,
                style: style,
                softWrap: true,
                textAlign: align,
                maxLines: maxLine,
                overflow: textOverflow))
        : Text(txtTitle,
            style: style,
            softWrap: true,
            textAlign: align,
            maxLines: maxLine,
            overflow: textOverflow);
  }
}
