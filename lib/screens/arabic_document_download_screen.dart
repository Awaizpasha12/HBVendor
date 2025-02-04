import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:happybash/api_call/api_config.dart';
import 'package:happybash/common/common_method.dart';
import 'package:happybash/common/common_widget.dart';
import 'package:happybash/screens/complate_msg_screen.dart';
import 'package:happybash/screens/terms_and_condition_screen.dart';
import 'package:happybash/utility/colors.dart';
import 'package:happybash/utility/common_string.dart';
import 'package:happybash/utility/styles.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';

class ArabicDocumentDownloadScreen extends StatefulWidget {
  ArabicDocumentDownloadScreen({super.key});

  @override
  State<ArabicDocumentDownloadScreen> createState() => _ArabicDocumentDownloadScreenState();
}

class _ArabicDocumentDownloadScreenState extends State<ArabicDocumentDownloadScreen> {
  List<String> allowedExtensions = ["jpeg", "png", "jpg", "pdf", "doc", "docx"];
  String fileExtension = "pdf";
  bool isDownload = false;

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
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                termsAndConditionArabic.tr,
                style: color2B2E35w50022,
              ),
              SizedBox(height: 8.h),
              Text(
                downloadUploadSignedDocument.tr,
                style: color57585Aw40016,
              ),
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
                    borderRadius: BorderRadius.circular(9.23),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 36),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                            child: Text(
                              downloadTermsAndCondition.tr,
                          textAlign: TextAlign.center,
                          style: color57585Aw40016,
                        )),
                        SizedBox(
                          height: 22.29.h,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (isDownload == false) {
                              saveFileToDocumentsFolder();
                              isDownload = true;
                            }
                          },
                          child: Image.asset(
                            "assets/images/download_doc_logo.png",
                            scale: 4,
                          ),
                        ),
                      ],
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
                    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 36),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(child: Text(uploadTermsAndCondition.tr, textAlign: TextAlign.center, style: color57585Aw40016)),
                        SizedBox(height: 22.29.h),
                        (listItem.firstWhere((element) => element.title == downloadUploadInArabic.tr).path ?? "").isEmpty
                            ? GestureDetector(
                                onTap: () async {
                                  FilePickerResult? result = await FilePicker.platform.pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: allowedExtensions,
                                  );
                                  if (result != null) {
                                    File file = File(result.files.single.path ?? "");
                                    String fileExtension = file.path.split('.').last.toLowerCase();
                                    if (allowedExtensions.contains(fileExtension)) {
                                      listItem.firstWhere((element) => element.title == downloadUploadInArabic.tr).extension = result.files.first.name;
                                      listItem.firstWhere((element) => element.title == downloadUploadInArabic.tr).path = file.path;
                                      setState(() {});
                                    } else {
                                      showSnackBar(title: ApiConfig.error, message: "Invalid file type.");
                                    }
                                  } else {
                                    showSnackBar(title: ApiConfig.error, message: fileNotSelected.tr);
                                  }
                                },
                                child: Image.asset("assets/images/upload_doc_icon.png", scale: 4),
                              )
                            : Column(
                                children: [
                                  ((listItem.firstWhere((element) => element.title == downloadUploadInArabic.tr).extension ?? "").contains("pdf") ||
                                          (listItem.firstWhere((element) => element.title == downloadUploadInArabic.tr).extension ?? "").contains("doc") ||
                                          (listItem.firstWhere((element) => element.title == downloadUploadInArabic.tr).extension ?? "").contains("docx"))
                                      ? Text(listItem.firstWhere((element) => element.title == downloadUploadInArabic.tr).extension ?? "")
                                      : Image.file(File(listItem.firstWhere((element) => element.title == downloadUploadInArabic.tr).path ?? "")),
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
                                          listItem.firstWhere((element) => element.title == downloadUploadInArabic.tr).path = "";
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
              SizedBox(height: 22.h),
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
              if ((listItem.firstWhere((element) => element.title == downloadUploadInArabic.tr).path ?? "").isEmpty) {
                showSnackBar(title: ApiConfig.error, message: pleaseUploadDocument.tr);
              } else {
                Get.back();
              }
            }),
      ),
    );
  }
}

Future<void> saveFileToDocumentsFolder() async {
  try {
    // Load the file from the assets as bytes
    final ByteData data = await rootBundle.load('assets/file.docx');

    // Get the external documents directory
    final Directory? directory = await getExternalStorageDirectory();

    // Define the file path in the documents directory
    final String path = directory!.path + '/Documents';
    final Directory documentsDir = Directory(path);

    // Create the documents directory if it doesn't exist
    if (!(await documentsDir.exists())) {
      await documentsDir.create(recursive: true);
    }

    // Create the file in the documents directory
    final File file = File('${documentsDir.path}/file.docx');

    // Write the bytes to the file
    await file.writeAsBytes(data.buffer.asUint8List());

    showSnackBar(title: ApiConfig.success, message: "Downloaded Successfully at" + "${file.path}");
  } catch (e) {
    showSnackBar(title: ApiConfig.error, message: downloadedFailed.tr);
  }
}
