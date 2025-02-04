import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:happybash/screens/language_selection_screen.dart';
import 'package:happybash/screens/reg_status_approved_screen.dart';
import 'package:happybash/screens/sign_up_vendor_screen.dart';
import 'package:happybash/screens/terms_and_condition_screen.dart';
import 'package:happybash/utility/colors.dart';
import 'package:happybash/utility/common_string.dart';
import 'package:happybash/utility/styles.dart';

import '../common/common_widget.dart';
import '../controllers/personal_information_controller.dart';
import 'business_document_screen_edit.dart';
import 'personal_information_screen_edit.dart';

class RegStatusReviewScreen extends StatefulWidget {
  const RegStatusReviewScreen({super.key});

  @override
  State<RegStatusReviewScreen> createState() => _RegStatusReviewScreenState();
}

class _RegStatusReviewScreenState extends State<RegStatusReviewScreen> {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFFFFFF,
      body: RefreshIndicator(
        onRefresh: () {
          return getData();
        },
        child: Obx(() => Column(
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  applicationUnderVerification.tr,
                                  style: colorFFFFFFw70020,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  accountWillGetActivated.tr,
                                  style: colorFFFFFFw40014,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Image.asset("assets/images/status.png", scale: 4),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: PersonalInformationController.to.userDetailsLoader.value
                      ? const Center(child: SizedBox(height: 20, child: SpinKitThreeBounce(color: colorFFFFFF, size: 30.0)))
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          child: Column(
                            children: [
                              ListView(
                                shrinkWrap: true,
                                children: [
                                  commonListTile(businessInformation.tr, PersonalInformationScreenEdit(isEdit: true), PersonalInformationController.to.userDetailsData.value.data?.vendor?.personalInfo?.status ?? ""),
                                  const SizedBox(height: 12),
                                  commonListTile(businessDocuments.tr, BusinessDocumentScreenEdit(isEdit: true), PersonalInformationController.to.userDetailsData.value.data?.vendor?.businessDocument?.status ?? ""),
                                  const SizedBox(height: 12),
                                  commonListTile(termsAndCondition.tr, TermsAndConditionScreen(isEdit: true), PersonalInformationController.to.userDetailsData.value.data?.vendor?.tncDocument?.status ?? ""),
                                  const SizedBox(height: 12)
                                ],
                              ),
                            ],
                          ),
                        ),
                ),
                // (PersonalInformationController.to.userDetailsData.value.data?.vendor?.personalInfo?.status ?? "") == "Approved" &&
                //         (PersonalInformationController.to.userDetailsData.value.data?.vendor?.businessDocument?.status ?? "") == "Approved" &&
                //         (PersonalInformationController.to.userDetailsData.value.data?.vendor?.tncDocument?.status ?? "") == "Approved"
                //     ? CommonButton(
                //         onPressed: () {
                //           Get.to(() => SignUpVendorScreen());
                //         },
                //         isLoading: false,
                //         title: signUpAsVendor.tr,
                //         height: 54,
                //         width: 211,
                //       )
                //     : SizedBox(),
              ],
            )),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(needHelp.tr, style: color2B2E35w40018Istok),
            const SizedBox(width: 5),
            GestureDetector(
                onTap: () async {
                  //await Get.to(() => RegStatusApprovedScreen());
                },
                child: Text(contactUs.tr, style: colorFF5963w40018.copyWith(decoration: TextDecoration.underline, decorationColor: colorFF5963))),
          ],
        ),
      ),
    );
  }

  commonListTile(String val, var f, String verifyVal) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: colorFFFFFF, boxShadow: const [BoxShadow(color: colorE2E2E2, blurRadius: 4)]),
      child: GestureDetector(
        onTap: () async {
          if (verifyVal == "Rejected") {
            await Get.to(f);
            PersonalInformationController.to.getUserDetailsApiCall(() {});
          }
        },
        child: ListTile(
          title: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(val, style: color2B2E35w40018Istok),
                const SizedBox(height: 10),
                Text(verifyVal, style: verifyVal == "Approved" ? color34A853w40016 : colorFF5963w40018),
              ],
            ),
          ),
          trailing: verifyVal == "Rejected" ? Image.asset('assets/images/Vector_right.png', scale: 4) : SizedBox(),
        ),
      ),
    );
  }
}
