import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:happybash/screens/arabic_document_download_screen.dart';
import 'package:happybash/screens/english_document_download_screen.dart';
import 'package:happybash/utility/colors.dart';
import 'package:happybash/utility/common_string.dart';
import 'package:happybash/utility/styles.dart';

import '../api_call/api_config.dart';
import '../common/common_method.dart';
import '../common/common_widget.dart';
import '../controllers/personal_information_controller.dart';
import 'business_document_screen_edit.dart';
import 'package:dio/dio.dart' as dio;

import 'document_screen.dart';

class TermsAndConditionScreen extends StatefulWidget {
  const TermsAndConditionScreen({super.key,this.isEdit});
   final bool? isEdit;
  @override
  State<TermsAndConditionScreen> createState() => _TermsAndConditionScreenState();
}

RxList<Item> listItem = <Item>[].obs;

class _TermsAndConditionScreenState extends State<TermsAndConditionScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listItem.clear();
    listItem.add(Item(path: "", path2: "a", title: downloadUploadInArabic.tr, f: ArabicDocumentDownloadScreen()));
    // listItem.add(Item(path: "", path2: "a", title: downloadUploadInEnglish.tr, f: EnglishDocumentDownloadScreen()));
    print(listItem);
  }

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(termsAndCondition.tr, style: color2B2E35w50022),
            SizedBox(height: 8.h),
            Text(downloadUploadDocumentsVerification.tr, style: color57585Aw40016),
            SizedBox(height: 25.h),
            Obx(() => Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                        children: listItem
                            .map((element) => Padding(
                                  padding: EdgeInsets.only(bottom: 12.h),
                                  child: commonListTile(element.title ?? "", element.f, element.path ?? "", element.path2 ?? ""),
                                ))
                            .toList()),
                  ),
                )),
            listItem.where((p0) => (p0.path ?? "").isEmpty).isEmpty
                ? Padding(
                    padding: EdgeInsets.all(15),
                    child: Obx(
                      () => CommonButton(
                        height: 51,
                        isLoading: PersonalInformationController.to.storeTncDocumentLoader.value,
                        title: 'Submit',
                        onPressed: () async {
                          var formData = dio.FormData.fromMap({
                            "tnc_ar_document": await dio.MultipartFile.fromFile((listItem.firstWhere((element) => element.title == downloadUploadInArabic.tr).path ?? ""),
                                filename: (listItem.firstWhere((element) => element.title == downloadUploadInArabic.tr).path ?? "").split('/').last),
                            // "tnc_eng_document": await dio.MultipartFile.fromFile((listItem.firstWhere((element) => element.title == downloadUploadInEnglish.tr).path ?? ""),
                            //     filename: (listItem.firstWhere((element) => element.title == downloadUploadInEnglish.tr).path ?? "").split('/').last),
                          });
                          await PersonalInformationController.to.storeTncDocumentApiCall(formData, () {
                            if(widget.isEdit == true){
                              Get.back();
                              showSnackBar(title: ApiConfig.success, message: "Uploaded successfully");
                            }else{
                              Get.back();
                              Get.back();
                              Get.to(() => DocumentScreen());
                              showSnackBar(title: ApiConfig.success, message: "Uploaded successfully");
                            }
                          });
                        },
                      ),
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }

  commonListTile(String val, var f, String path, String path2) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: color969AA4),
        borderRadius: BorderRadius.circular(8),
        color: colorFFFFFF,
        // // boxShadow: const [
        // //   BoxShadow(
        // //     color: colorE2E2E2,
        // //     blurRadius: 4,
        // //   ),
        // ],
      ),
      child: GestureDetector(
        onTap: () async {
          await Get.to(f);
          setState(() {});
        },
        child: Center(
          child: ListTile(
            leading: path.isEmpty ? null : Image.asset("assets/images/Done_round.png", scale: 4),
            title: Text(
              val,
              style: color2B2E35w40018Istok,
            ),
            trailing: Image.asset(
              'assets/images/Vector_right.png',
              scale: 4,
            ),
          ),
        ),
      ),
    );
  }
}
