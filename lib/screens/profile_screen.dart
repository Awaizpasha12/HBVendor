import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:happybash/common/common_widget.dart';
import 'package:happybash/controllers/auth_controller.dart';
import 'package:happybash/screens/business_document_screen_edit.dart';
import 'package:happybash/screens/duplicates/business_document_screen.dart';
import 'package:happybash/screens/duplicates/personal_information_screen.dart';
import 'package:happybash/screens/personal_information_screen_edit.dart';
import 'package:happybash/screens/terms_and_condition_screen.dart';
import 'package:happybash/utility/colors.dart';
import 'package:happybash/utility/common_string.dart';

import '../controllers/personal_information_controller.dart';
import '../model/user_details_model.dart';
import '../utility/styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthController authController = Get.put(AuthController());

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
      appBar: AppBar(
        leadingWidth: 0,
        centerTitle: false,
        elevation: 4,
        shadowColor: Colors.grey,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
        ),
        backgroundColor: colorFFFFFF,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(profile.tr, style: color484646w50022),
        ),
      ),
      backgroundColor: colorFFFFFF,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(businessDocuments.tr, style: color57585Aw40016),
                            SizedBox(height: 25.h),
                            ListView(
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: [
                                commonListTile(businessInformation.tr, PersonalInformationScreen(),PersonalInformationController.to.userDetailsData.value.data?.vendor,1),
                                SizedBox(height: 12.h),
                                commonListTile(businessDocuments.tr, BusinessDocumentScreen(),PersonalInformationController.to.userDetailsData.value.data?.vendor,2),
                                SizedBox(height: 12.h),
                                commonListTile(termsAndCondition.tr, TermsAndConditionScreen(),PersonalInformationController.to.userDetailsData.value.data?.vendor,3),
                                SizedBox(height: 12.h)
                              ],
                            ),
                            SizedBox(height: 20.h),
                          ],
                        ),
            
                        CommonButton(
                          isLoading: false,
                          title: logout.tr,
                          onPressed: () {
                            authController.logoutApiCall();
                          },
                        ),
                        SizedBox(height: 12.h),
                        CommonButton(
                          isLoading: false,
                          title: deleteAccount.tr,
                          onPressed: () {
                            // authController.vendorDeleteAccountApiCall();
                            _showDeleteConfirmationDialog(context);
                          },
                        )
                      ],
                    ),
                  ),
                )),
              ],
            ),
          ),
          Image.asset("assets/images/CODE WAVE logo.png", scale: 4),
        ],
      ),
    );
  }
  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(deleteAccount.tr),
          content: Text(deleteConfirmation.tr),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(cancel.tr),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                authController.vendorDeleteAccountApiCall(); // Proceed with deletion
              },
              child: Text(okay.tr),
            ),
          ],
        );
      },
    );
  }
  // commonListTile(String val, var f, {bool isShow = false}) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(8),
  //       color: colorFFFFFF,
  //       boxShadow: const [
  //         BoxShadow(
  //           color: colorE2E2E2,
  //           blurRadius: 4,
  //         ),
  //       ],
  //     ),
  //     child: GestureDetector(
  //       onTap: () {
  //         if (isShow == false) {
  //           Get.to(f);
  //         }
  //       },
  //       child: ListTile(
  //         leading: isShow == true
  //             ? Image.asset(
  //                 "assets/images/Done_round.png",
  //                 scale: 4,
  //               )
  //             : null,
  //         title: Text(
  //           val,
  //           style: color2B2E35w40018Istok,
  //         ),
  //         trailing: isShow == true
  //             ? null
  //             : Image.asset(
  //                 'assets/images/Vector_right.png',
  //                 scale: 4,
  //               ),
  //       ),
  //     ),
  //   );
  // }

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
          if (isApproved == true) {
            switch (type) {
              case 1 : {
                Get.to(PersonalInformationScreen());
                break;
              }
              case 2 :{
                Get.to(BusinessDocumentScreen());
                break;
              }
            }
          }else{
            switch (type) {
              case 1 : {
                Get.to(PersonalInformationScreenEdit());
                break;
              }
              case 2 :{
                Get.to(BusinessDocumentScreenEdit());
                break;
              }
              case 3 :{
                Get.to(TncDocument());
                break;
              }
            }
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
