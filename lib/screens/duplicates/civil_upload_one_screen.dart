import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:happybash/api_call/api_config.dart';
import 'package:happybash/common/common_method.dart';
import 'package:happybash/common/common_widget.dart';
import 'package:happybash/controllers/personal_information_controller.dart';
import 'package:happybash/utility/colors.dart';
import 'package:happybash/utility/common_string.dart';
import 'package:happybash/utility/styles.dart';
import 'package:dotted_border/dotted_border.dart';
import 'business_document_screen.dart';

class CivilUploadOneScreen extends StatefulWidget {
  const CivilUploadOneScreen({super.key});

  @override
  State<CivilUploadOneScreen> createState() => _CivilUploadOneScreenState();
}

class _CivilUploadOneScreenState extends State<CivilUploadOneScreen> {
  //GetX Controllers...........
  final PersonalInformationController personalInformationController = Get.put(PersonalInformationController());
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

  //Validation upload Document...........pe
  List<String> allowedExtensions = ["jpeg", "png", "jpg", "heif", "heic", "pdf"];
  String? fileExtension = "pdf";

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
          padding: const EdgeInsets.symmetric(horizontal: 21).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                civilCardDetails.tr,
                style: color2B2E35w50022,
              ),
              SizedBox(height: 8.h),
              // Text(
              //   uploadCivilCardVerification.tr,
              //   style: color57585Aw40016,
              // ),
              SizedBox(height: 22.29.h),
              DottedBorder(
                color: color969AA4,
                strokeWidth: 2,
                dashPattern: const [3, 4],
                borderType: BorderType.RRect,
                // Border type: RRect, Rect, Circle, etc.
                radius: const Radius.circular(9.23),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.23).r,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Center(
                          //     child: Text(
                          //   frontSideCivilCardPhoto.tr,
                          //   textAlign: TextAlign.center,
                          //   style: color57585Aw40016,
                          // )),
                          SizedBox(height: 19.h),
                          Column(
                                  children: [
                                    personalInformationController.userDetailsData.value.data?.vendor?.businessDocument?.civilCardDocumentFront?.split(".").last == "pdf"?
                                    Text(personalInformationController.userDetailsData.value.data?.vendor?.businessDocument?.civilCardDocumentFront!.split("/").last ?? ""):
                                    CachedNetworkImage(
                                        imageUrl:  personalInformationController.userDetailsData.value.data?.vendor?.businessDocument?.civilCardDocumentFront ?? "",
                                        scale: 4,
                                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) => const Icon(Icons.error),
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
              SizedBox(height: 22.h),
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
                    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Center(
                          //     child: Text(
                          //   backSideCivilCardPhoto.tr,
                          //   textAlign: TextAlign.center,
                          //   style: color57585Aw40016,
                          // )),
                          SizedBox(height: 19.h),
                          Column(
                            children: [
                              personalInformationController.userDetailsData.value.data?.vendor?.businessDocument?.civilCardDocumentBack?.split(".").last == "pdf"?
                              Text(personalInformationController.userDetailsData.value.data?.vendor?.businessDocument?.civilCardDocumentBack!.split("/").last ?? ""):
                              CachedNetworkImage(
                                  imageUrl:  personalInformationController.userDetailsData.value.data?.vendor?.businessDocument?.civilCardDocumentBack ?? "",
                                  scale: 4,
                                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
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
