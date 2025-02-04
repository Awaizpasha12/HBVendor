import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:happybash/common/common_widget.dart';
import 'package:happybash/controllers/language_selection_controller.dart';
import 'package:happybash/screens/onboarding_screen.dart';
import 'package:happybash/utility/colors.dart';
import 'package:happybash/utility/common_string.dart';
import 'package:happybash/utility/styles.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  final LanguageController languageSelectionController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFFFFFF,
      body: Column(
        children: [
          Image.asset('assets/images/bg.png'),
          Padding(
            padding: const EdgeInsets.only(top: 21),
            child: Column(
              children: [
                Text(
                  selectLanguage.tr,
                  style: color1D2939w40024,
                ),
                const SizedBox(
                  height: 32,
                ),
                GestureDetector(
                  onTap: () {
                    languageSelectionController.selectedLanguage('arabic');
                  },
                  child: Obx(() {
                    return Container(
                      decoration: BoxDecoration(
                        color: languageSelectionController.selectedLanguage.value == "arabic" ? colorEAF5F5 : colorFFFFFF,
                        borderRadius: const BorderRadius.all(Radius.circular(8)).w,
                        border: Border.all(color: languageSelectionController.selectedLanguage.value == 'arabic' ? color2A9DA0 : colorEDEDED),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 24).r,
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/arabic_logo.png",
                              scale: 4,
                            ),
                            3.verticalSpace,
                            Text(
                              "Arabic",
                              style: color000000w60014,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: () {
                    languageSelectionController.selectedLanguage('english');
                  },
                  child: Obx(() {
                    return Container(
                      decoration: BoxDecoration(
                        color: languageSelectionController.selectedLanguage.value == "english" ? colorEAF5F5 : colorFFFFFF,
                        borderRadius: const BorderRadius.all(Radius.circular(8)).r,
                        border: Border.all(color: languageSelectionController.selectedLanguage.value == 'english' ? color2A9DA0 : colorEDEDED),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 24).r,
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/English_logo.png",
                              scale: 4,
                            ),
                            3.verticalSpace,
                            Text(
                              "English",
                              style: color000000w60014,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: SafeArea(
          child: CommonButton(
              height: 51,
              isLoading: false,
              title: confirmAndContinue.tr,
              onPressed: () {
                var locale = Locale(languageSelectionController.selectedLanguage.value == "arabic" ? "hi" : "en");
                Get.updateLocale(locale);
                Get.to(() => OnboardingScreen());
              }),
        ),
      ),
    );
  }
}
