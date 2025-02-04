import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:happybash/common/common_widget.dart';
import 'package:happybash/model/user_details_model.dart';
import 'package:happybash/screens/language_selection_screen.dart';
import 'package:happybash/screens/personal_information_screen_edit.dart';
import 'package:happybash/screens/terms_and_condition_screen.dart';
import 'package:happybash/utility/colors.dart';
import 'package:happybash/utility/common_string.dart';
import 'package:happybash/utility/styles.dart';

import '../controllers/personal_information_controller.dart';
import 'business_document_screen_edit.dart';
import 'complate_msg_screen.dart';

class DocumentScreen extends StatefulWidget {
   const DocumentScreen( {super.key,});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {


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
      // appBar: AppBar(
      //   backgroundColor: colorFFFFFF,
      //   automaticallyImplyLeading: false,
      //   flexibleSpace: ,
      // ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset('assets/images/appbar_bg.png', width: double.infinity, height: 200, fit: BoxFit.fitWidth),
              Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(welcomeHappyBash.tr, style: colorFFFFFFw70026),
                      SizedBox(height: 10.h),
                      Text(justAFewStepsAwayHappyBash.tr, style: colorFFFFFFw40016),
                    ],
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Obx(() => PersonalInformationController.to.userDetailsLoader.value
                ? const Center(child: SizedBox(height: 20, child: SpinKitThreeBounce(color: colorFFFFFF, size: 30.0)))
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          // (PersonalInformationController.to.userDetailsData.value.data?.vendor?.personalInfo?.firstName ?? "").isEmpty ||
                          //         PersonalInformationController.to.userDetailsData.value.data?.vendor?.businessDocument == null ||
                          //         PersonalInformationController.to.userDetailsData.value.data?.vendor?.tncDocument == null
                          //     ? Column(
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           Text(businessDocuments.tr, style: color57585Aw40016),
                          //           SizedBox(height: 25.h),
                          //           ListView(
                          //             padding: EdgeInsets.zero,
                          //             physics: const NeverScrollableScrollPhysics(),
                          //             shrinkWrap: true,
                          //             children: [
                          //               (PersonalInformationController.to.userDetailsData.value.data?.vendor?.personalInfo?.firstName ?? "").isNotEmpty ? Container() : commonListTile(businessInformation.tr, PersonalInformationScreen(),PersonalInformationController.to.userDetailsData.value.data?.vendor,1),
                          //               (PersonalInformationController.to.userDetailsData.value.data?.vendor?.personalInfo?.firstName ?? "").isNotEmpty ? Container() : SizedBox(height: 12.h),
                          //               PersonalInformationController.to.userDetailsData.value.data?.vendor?.businessDocument != null ? Container() : commonListTile(businessDocuments.tr, BusinessDocumentScreen(),PersonalInformationController.to.userDetailsData.value.data?.vendor,2),
                          //               PersonalInformationController.to.userDetailsData.value.data?.vendor?.businessDocument != null ? Container() : SizedBox(height: 12.h),
                          //               PersonalInformationController.to.userDetailsData.value.data?.vendor?.tncDocument != null ? Container() : commonListTile(termsAndCondition.tr, TermsAndConditionScreen(),PersonalInformationController.to.userDetailsData.value.data?.vendor,3),
                          //               PersonalInformationController.to.userDetailsData.value.data?.vendor?.tncDocument != null ? Container() : SizedBox(height: 12.h)
                          //             ],
                          //           ),
                          //           SizedBox(height: 90.h),
                          //         ],
                          //       )
                          //     : SizedBox(),
                          // (PersonalInformationController.to.userDetailsData.value.data?.vendor?.personalInfo?.firstName ?? "").isNotEmpty ||
                          //         PersonalInformationController.to.userDetailsData.value.data?.vendor?.businessDocument != null ||
                          //         PersonalInformationController.to.userDetailsData.value.data?.vendor?.tncDocument != null
                          //     ? Column(
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           Text(
                          //             'Completed Documents',
                          //             style: color57585Aw40016,
                          //           ),
                          //           SizedBox(height: 25.h),
                          //           ListView(
                          //             padding: EdgeInsets.zero,
                          //             physics: const NeverScrollableScrollPhysics(),
                          //             shrinkWrap: true,
                          //             children: [
                          //               (PersonalInformationController.to.userDetailsData.value.data?.vendor?.personalInfo?.firstName ?? "").isEmpty ? Container() : commonListTile(businessInformation.tr, PersonalInformationScreen(),PersonalInformationController.to.userDetailsData.value.data?.vendor, isShow: true,1),
                          //               (PersonalInformationController.to.userDetailsData.value.data?.vendor?.personalInfo?.firstName ?? "").isEmpty ? Container() : SizedBox(height: 12.h),
                          //               PersonalInformationController.to.userDetailsData.value.data?.vendor?.businessDocument == null ? Container() : commonListTile(businessDocuments.tr, BusinessDocumentScreen(),PersonalInformationController.to.userDetailsData.value.data?.vendor, isShow: true,2),
                          //               PersonalInformationController.to.userDetailsData.value.data?.vendor?.businessDocument == null ? Container() : SizedBox(height: 12.h),
                          //               PersonalInformationController.to.userDetailsData.value.data?.vendor?.tncDocument == null ? Container() : commonListTile(termsAndCondition.tr, TermsAndConditionScreen(),PersonalInformationController.to.userDetailsData.value.data?.vendor, isShow: true,3),
                          //               PersonalInformationController.to.userDetailsData.value.data?.vendor?.tncDocument == null ? Container() : SizedBox(height: 12.h)
                          //             ],
                          //           ),
                          //           SizedBox(height: 90.h),
                          //         ],
                          //       )
                          //     : SizedBox(),


                          Text(businessDocuments.tr, style: color57585Aw40016),
                          SizedBox(height: 25.h),
                          ListView(
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: [
                              commonListTile(businessInformation.tr, PersonalInformationScreenEdit(),PersonalInformationController.to.userDetailsData.value.data?.vendor,1),
                              SizedBox(height: 12.h),
                              commonListTile(businessDocuments.tr, BusinessDocumentScreenEdit(),PersonalInformationController.to.userDetailsData.value.data?.vendor,2),
                              SizedBox(height: 12.h),
                              commonListTile(termsAndCondition.tr, TermsAndConditionScreen(),PersonalInformationController.to.userDetailsData.value.data?.vendor,3),
                              SizedBox(height: 12.h)
                            ],
                          ),
                          SizedBox(height: 90.h),
                          (PersonalInformationController.to.userDetailsData.value.data?.vendor?.personalInfo?.firstName ?? "").isNotEmpty &&
                                  PersonalInformationController.to.userDetailsData.value.data?.vendor?.businessDocument != null &&
                                  PersonalInformationController.to.userDetailsData.value.data?.vendor?.tncDocument != null
                              ? Obx(() => CommonButton(
                                    height: 51,
                                    isLoading: PersonalInformationController.to.statusUpdateLoader.value,
                                    title: submit.tr,
                                    onPressed: () {
                                      PersonalInformationController.to.storeStatusUpdateApiCall();
                                    },
                                  ))
                              : SizedBox()
                        ],
                      ),
                    ),
                  )),
          ),
        ],
      ),
    );
  }

  commonListTile(String val, var f, Vendor? vendor, int type) {
    // type defines the rendering type
    // 1 -> personal and business info
    // 2 -> business documents
    // 3 -> terms and conditions
    var comment = "";
    var docStatus = "Pending";
    var isApproved = false;
    switch (type) {
      case 1:
        {
          docStatus = vendor?.personalInfo?.status ?? "Pending";
            comment = vendor?.personalInfo?.comment ?? "";
            if((vendor?.personalInfo?.status ?? "") == "Approved"){
              isApproved = true;
            }
          break;
        }
      case 2:
        {
          docStatus = vendor?.businessDocument?.status ?? "Pending";
            comment = vendor?.businessDocument?.comment ?? "";
          if((vendor?.businessDocument?.status ?? "") == "Approved"){
            isApproved = true;
          }
          break;
        }
      case 3:
        {
            docStatus = vendor?.tncDocument?.status ?? "Pending";
            comment = vendor?.tncDocument?.comment ?? "";
            if((vendor?.tncDocument?.status ?? "") == "Approved"){
              isApproved = true;
            }
          break;
        }
    }
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
          if (isApproved == false) {
            Get.to(f);
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: isApproved == true
                  ? Image.asset(
                "assets/images/Done_round.png",
                scale: 4,
              )
                  : null,
              title: Text(
                val,
                style: color2B2E35w40018Istok,
              ),
              trailing: isApproved == true
                  ? null
                  : Image.asset(
                'assets/images/Vector_right.png',
                scale: 4,
              ),
            ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Status : ",
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          docStatus,
                          style: TextStyle(
                            color: docStatus == "Rejected" ? Colors.red :
                            docStatus == "Pending" ? Colors.orange :
                            Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    if (comment.isNotEmpty)
                      Text(
                        comment,
                        style: const TextStyle(color: Colors.black),
                      ),
                    SizedBox(height: 10.h),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
