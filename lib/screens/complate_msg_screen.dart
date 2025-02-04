import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:happybash/common/common_widget.dart';
import 'package:happybash/utility/colors.dart';
import 'package:happybash/utility/common_string.dart';
import 'package:happybash/utility/styles.dart';

import 'onboarding_screen.dart';

class ComplateMsgScreen extends StatefulWidget {
   ComplateMsgScreen({super.key});

  @override
  State<ComplateMsgScreen> createState() => _ComplateMsgScreenState();
}

class _ComplateMsgScreenState extends State<ComplateMsgScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFFFFFF,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
               SizedBox(
                height: 176.h,
              ),
              Image.asset(
                "assets/images/done_logo.png",
                scale: 4,
              ),
               SizedBox(
                height: 38.h,
              ),
              Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 30).r,
                child: Text(
                  yourApplicationSubmitted.tr,
                  style: color2B2E35w70024,
                  textAlign: TextAlign.center,
                ),
              ),
               SizedBox(
                height: 38.h,
              ),
              Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 30).r,
                child: Text(
                  kindlyWaitApplicationConfirmedViaEmail.tr,
                  style: color595959w40014,
                  textAlign: TextAlign.center,
                ),
              ),
               SizedBox(
                height: 31.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                child: CommonButton(
                    color: colorFFFFFF,
                    decoration: BoxDecoration(
                      border: Border.all(color: colorFF5963),
                      borderRadius: BorderRadius.circular(36),
                    ),
                    onPressed: (){
                      Get.offAll(()=> const OnboardingScreen());
                    },
                    style:  const TextStyle(
                      color: colorFF5963
                    ),
                    height: 45.03.h,
                    isLoading: false,
                    title: okay.tr),
              )
            ],
          ),
        ),
      ),
    );
  }
}
