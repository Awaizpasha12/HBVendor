import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:happybash/common/common_widget.dart';
import 'package:happybash/screens/terms_and_condition_screen.dart';
import 'package:happybash/utility/colors.dart';
import 'package:happybash/utility/common_string.dart';
import 'package:happybash/utility/styles.dart';

import '../api_call/api_config.dart';
import '../common/common_method.dart';
import 'business_document_screen_edit.dart';

class IbanDocumentUploadScreen extends StatefulWidget {
  const IbanDocumentUploadScreen({super.key});

  @override
  State<IbanDocumentUploadScreen> createState() => _IbanDocumentUploadScreenState();
}

class _IbanDocumentUploadScreenState extends State<IbanDocumentUploadScreen> {
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
                ibanCertificate.tr,
                style: color2B2E35w50022,
              ),
              SizedBox(height: 8.h),
              Text(
                uploadRequiredDocument.tr,
                style: color57585Aw40016,
              ),
              SizedBox(
                height: 49.29.h,
              ),
              DottedBorder(
                color: color969AA4,
                strokeWidth: 2,
                dashPattern: const [3, 4],
                borderType: BorderType.RRect,
                // Border type: RRect, Rect, Circle, etc.
                radius: const Radius.circular(9.23).r,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.23),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                            child: Text(
                          uploadIbanCertificate.tr,
                          textAlign: TextAlign.center,
                          style: color57585Aw40016,
                        )),
                        SizedBox(height: 19.h),
                        (list.firstWhere((element) => element.title == ibanCertificate.tr).path ?? "").isEmpty
                            ? GestureDetector(
                                onTap: () async {
                                  FilePickerResult? result = await FilePicker.platform.pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: allowedExtensions,
                                  );

                                  if (result != null) {
                                    File file = File(result.files.single.path ?? "");
                                    fileExtension = file.path.split('.').last.toLowerCase();
                                    if (allowedExtensions.contains(fileExtension)) {
                                      list.firstWhere((element) => element.title == "Iban certificate").extension = result.files.first.name;
                                      list.firstWhere((element) => element.title == "Iban certificate").path = file.path;
                                      setState(() {});
                                    } else {
                                      print("Invalid file type");
                                      showSnackBar(title: ApiConfig.error, message: invalidFileType.tr);
                                    }
                                  } else {
                                    showSnackBar(title: ApiConfig.error, message: fileNotSelected.tr);
                                  }
                                },
                                child: Image.asset("assets/images/upload_logo.png", scale: 4),
                              )
                            : Column(
                                children: [
                                  (list.firstWhere((element) => element.title == "Iban certificate").extension ?? "").contains("pdf")
                                      ? Text(list.firstWhere((element) => element.title == "Iban certificate").extension ?? "")
                                      : Image.file(File(list.firstWhere((element) => element.title == "Iban certificate").path ?? "")),
                                  SizedBox(height: 19.h),
                                  SizedBox(
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor: colorFFFFFF,
                                          shape: RoundedRectangleBorder(
                                            side: const BorderSide(color: colorFF5963),
                                            borderRadius: BorderRadius.circular(47.55),
                                          ),
                                        ),
                                        onPressed: () {
                                          list.firstWhere((element) => element.title == ibanCertificate.tr).path = "";
                                          setState(() {});
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              uploaded.tr,
                                              style: colorFF5963w40018,
                                            ),
                                            Image.asset(
                                              "assets/images/Close_round_fill.png",
                                              scale: 4,
                                            ),
                                          ],
                                        )),
                                  ),

                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.only(top: 140),
              //   child: CommonButton(height: 51,isLoading: false, title: 'Submit',onPressed: (){Get.to(CivilUploadTwoScreen());},),
              // )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: CommonButton(
            height: 51,
            isLoading: false,
            title: submit.tr,
            onPressed: () {
              if ((list.firstWhere((element) => element.title == ibanCertificate.tr).path ?? "").isEmpty) {
                showSnackBar(title: ApiConfig.error, message: pleaseUploadDocument.tr);
              } else {
                Get.back();
              }
            }),
      ),
    );
    ;
  }
}
