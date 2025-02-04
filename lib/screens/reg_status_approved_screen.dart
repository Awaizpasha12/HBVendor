import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happybash/common/common_widget.dart';
import 'package:happybash/screens/language_selection_screen.dart';
import 'package:happybash/screens/sign_up_vendor_screen.dart';
import 'package:happybash/utility/colors.dart';
import 'package:happybash/utility/common_string.dart';
import 'package:happybash/utility/styles.dart';

class RegStatusApprovedScreen extends StatefulWidget {
  const RegStatusApprovedScreen({super.key});

  @override
  State<RegStatusApprovedScreen> createState() => _RegStatusApprovedScreenState();
}

class _RegStatusApprovedScreenState extends State<RegStatusApprovedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFFFFFF,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: color2A9DA0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 70, 0, 0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              congratsVendor.tr,
                              style: colorFFFFFFw70020,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              accountActivated.tr,
                              style: colorFFFFFFw40014,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Image.asset("assets/images/verify_vendor.png", scale: 4.6),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: AppBar(
                    leading: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Image.asset(
                          "assets/images/Vector.png",
                          scale: 4,
                        )),
                    title: Text(
                      registrationStatus.tr,
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
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      commonListTile(personalInformation.tr, LanguageSelectionScreen(), approved.tr),
                      const SizedBox(
                        height: 12,
                      ),
                      commonListTile(personalDocuments.tr, LanguageSelectionScreen(), approved.tr),
                      const SizedBox(
                        height: 12,
                      ),
                      commonListTile(businessDocuments.tr, LanguageSelectionScreen(), approved.tr),
                      const SizedBox(
                        height: 12,
                      ),
                      commonListTile(termsAndCondition.tr, LanguageSelectionScreen(), approved.tr),
                      const SizedBox(
                        height: 12,
                      )
                    ],
                  ),
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
            // ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
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
                Get.to(SignUpVendorScreen());
              },
              child: Text(contactUs.tr, style: colorFF5963w40018.copyWith(decoration: TextDecoration.underline, decorationColor: colorFF5963))),
        ],
      ),
    );
  }

  commonListTile(String val, var f, String verifyVal) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: colorFFFFFF,
        boxShadow: const [
          BoxShadow(
            color: colorE2E2E2,
            blurRadius: 4,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Get.to(f);
        },
        child: ListTile(
          title: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  val,
                  style: color2B2E35w40018Istok,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  verifyVal,
                  style: color34A853w40016,
                ),
              ],
            ),
          ),
          trailing: Image.asset(
            'assets/images/Vector_right.png',
            scale: 4,
          ),
        ),
      ),
    );
  }
}
