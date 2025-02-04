import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:happybash/api_call/api_config.dart';
import 'package:happybash/common/common_method.dart';
import 'package:happybash/common/common_widget.dart';
import 'package:happybash/controllers/personal_information_controller.dart';
import 'package:happybash/screens/terms_and_condition_screen.dart';
import 'package:happybash/utility/colors.dart';
import 'package:happybash/utility/common_string.dart';
import 'package:happybash/utility/styles.dart';

import 'business_document_screen.dart';

class AuthDocumentUploadScreen extends StatefulWidget {
  AuthDocumentUploadScreen({super.key});

  @override
  State<AuthDocumentUploadScreen> createState() => _AuthDocumentUploadScreenState();
}

class _AuthDocumentUploadScreenState extends State<AuthDocumentUploadScreen> {
  //GetX Controllers...........
  final PersonalInformationController personalInformationController = Get.put(PersonalInformationController());

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

  List<String> allowedExtensions = ["jpeg", "png", "jpg", "heif", "heic", "pdf"];
  String fileExtension = "pdf";

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                authorizedSignature.tr,
                style: color2B2E35w50022,
              ),
              SizedBox(height: 8.h),
              // Text(
              //   uploadRequiredDocument.tr,
              //   style: color57585Aw40016,
              // ),
              SizedBox(
                height: 49.29.h,
              ),
              DottedBorder(
                color: color969AA4,
                strokeWidth: 2,
                dashPattern: const [3, 4],
                borderType: BorderType.RRect,
                // Border type: RRect, Rect, Circle, etc.
                radius: const Radius.circular(9.23),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.23),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Center(
                          //     child: Text(
                          //   uploadAuthorizedSignature.tr,
                          //   textAlign: TextAlign.center,
                          //   style: color57585Aw40016,
                          // )),
                          SizedBox(height: 19.h),
                          Column(
                            children: [
                              personalInformationController.userDetailsData.value.data?.vendor?.businessDocument?.signatureOfClient?.split(".").last == "pdf"?
                              Text(personalInformationController.userDetailsData.value.data?.vendor?.businessDocument?.signatureOfClient!.split("/").last ?? ""):
                              CachedNetworkImage(
                                  imageUrl:  personalInformationController.userDetailsData.value.data?.vendor?.businessDocument?.signatureOfClient ?? "",
                                  scale: 4,
                                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                  fit: BoxFit.fill),
                              SizedBox(height: 19.h),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
