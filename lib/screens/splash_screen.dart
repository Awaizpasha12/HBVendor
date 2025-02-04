import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happybash/screens/language_selection_screen.dart';
import 'package:happybash/utility/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/common_bottom_navigationbar.dart';
import '../common/common_method.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      if (getIsLogin() == true) {
        Get.offAll(() => const CommonBottomNavigationBar());
      } else {
        Get.offAll(() => const LanguageSelectionScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color2A9DA0,
      body: Center(
        child: Container(
          width: 300.w,
          height: 300.h,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: color3fa7aa,
          ),
          child: Center(
            child: Container(
              width: 222.w,
              height: 222.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: colorFFFFFF,
              ),
              child: Image.asset(
                'assets/images/Happy_Bash.png',
                scale: 5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
