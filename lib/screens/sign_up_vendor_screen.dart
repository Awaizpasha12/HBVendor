import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happybash/api_call/api_config.dart';
import 'package:happybash/common/common_method.dart';
import 'package:happybash/common/common_widget.dart';
import 'package:happybash/utility/colors.dart';
import 'package:happybash/utility/common_string.dart';
import 'package:happybash/utility/styles.dart';

import '../controllers/auth_controller.dart';
import '../controllers/personal_information_controller.dart';

class SignUpVendorScreen extends StatefulWidget {
  const SignUpVendorScreen({super.key});

  @override
  State<SignUpVendorScreen> createState() => _SignUpVendorScreenState();
}

class _SignUpVendorScreenState extends State<SignUpVendorScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController createPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.text = AuthController.to.verifyOtpModel.value.user?.email ?? "";
  }

  final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
  );
  final _formKey = GlobalKey<FormState>();

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
    return Scaffold(
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  createAccount.tr,
                  style: color1D2939w60032,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  pleaseGetOffersEventsMemorable.tr,
                  style: color595959w40014,
                ),
                const SizedBox(
                  height: 24,
                ),
                commonPlainTextFiled(hintText: 'Email', textEditingController: emailController, isEnabled: false),
                SizedBox(
                  height: 16,
                ),
                commonPlainTextFiled(hintText: 'Create password', textEditingController: createPasswordController, validationFunction: _validatePassword),
                SizedBox(
                  height: 16,
                ),
                commonPlainTextFiled(hintText: 'Confirm password', textEditingController: confirmPasswordController, validationFunction: _validatePassword),
                SizedBox(
                  height: 16,
                ),
                Obx(() => CommonButton(
                  isLoading: PersonalInformationController.to.createUserLoader.value,
                  title: "CONTINUE",
                  height: 40,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if(createPasswordController.text == confirmPasswordController.text){
                        PersonalInformationController.to.createUser({"email": emailController.text, "password": createPasswordController.text});
                      }else{
                        showSnackBar(title: ApiConfig.error, message: "Password and confirm password doesn't match");
                      }
          
                    }
                  },
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
