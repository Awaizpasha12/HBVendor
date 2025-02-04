import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:happybash/screens/auth_document_upload_screen.dart';
import 'package:happybash/screens/commercial_registration_upload_screen.dart';
import 'package:happybash/screens/iban_document_upload_screen.dart';
import 'package:happybash/screens/memorandum_document_upload_screen.dart';
import 'package:happybash/screens/trade_document_upload_screen.dart';
import 'package:happybash/utility/colors.dart';
import 'package:happybash/utility/common_string.dart';
import 'package:happybash/utility/styles.dart';
import 'package:http_parser/http_parser.dart';

import '../api_call/api_config.dart';
import '../common/common_method.dart';
import '../common/common_widget.dart';
import '../controllers/personal_information_controller.dart';
import 'civil_upload_one_screen.dart';
import 'package:dio/dio.dart' as dio;

import 'document_screen.dart';

class BusinessDocumentScreenEdit extends StatefulWidget {
  BusinessDocumentScreenEdit({super.key, this.isEdit});

  final bool? isEdit;

  @override
  State<BusinessDocumentScreenEdit> createState() => _BusinessDocumentScreenEditState();
}

RxList<Item> list = <Item>[].obs;

class _BusinessDocumentScreenEditState extends State<BusinessDocumentScreenEdit> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list.clear();
    list.add(Item(path: "", path2: "a", title: commercialRegistration.tr, f: CommercialRegistrationUploadScreen()));
    list.add(Item(path: "", path2: "a", title: memorandumAssociationCompany.tr, f: MemorandumDocumentUploadScreen()));
    list.add(Item(path: "", path2: "a", title: tradeLicense.tr, f: TradeDocumentUploadScreen()));
    list.add(Item(path: "", path2: "a", title: authorizedSignature.tr, f: AuthDocumentUploadScreen()));
    list.add(Item(path: "", path2: "a", title: ibanCertificate.tr, f: IbanDocumentUploadScreen()));
    list.add(Item(path: "", path2: "", title: civilId.tr, f: CivilUploadOneScreen()));
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
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(businessDocuments.tr, style: color2B2E35w50022),
            SizedBox(height: 8.h),
            Text(uploadDocumentsVerification.tr, style: color57585Aw40016),
            SizedBox(height: 25.h),
            Obx(() => Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                        children: list
                            .map((element) => Padding(
                                  padding: EdgeInsets.only(bottom: 12.h),
                                  child: commonListTile(element.title ?? "", element.f, element.path ?? "", element.path2 ?? ""),
                                ))
                            .toList()),
                  ),
                )),
            list.where((p0) => (p0.path ?? "").isEmpty).isEmpty && list.where((p0) => (p0.path2 ?? "").isEmpty).isEmpty
                ? Padding(
                    padding: EdgeInsets.all(15),
                    child: Obx(
                      () => CommonButton(
                        height: 51,
                        isLoading: PersonalInformationController.to.storeBusinessDocumentLoader.value,
                        title: submit.tr,
                        onPressed: () async {
                          // var formData = dio.FormData.fromMap({
                          //   "commercial_registration": await dio.MultipartFile.fromFile((list.firstWhere((element) => element.title == commercialRegistration.tr).path ?? ""),
                          //       filename: (list.firstWhere((element) => element.title == commercialRegistration.tr).path ?? "").split('/').last),
                          //   "moa_of_company": await dio.MultipartFile.fromFile((list.firstWhere((element) => element.title == memorandumAssociationCompany.tr).path ?? ""),
                          //       filename: (list.firstWhere((element) => element.title == memorandumAssociationCompany.tr).path ?? "").split('/').last),
                          //   "trade_license":
                          //       await dio.MultipartFile.fromFile((list.firstWhere((element) => element.title == tradeLicense.tr).path ?? ""), filename: (list.firstWhere((element) => element.title == tradeLicense.tr).path ?? "").split('/').last),
                          //   "signature_of_client": await dio.MultipartFile.fromFile((list.firstWhere((element) => element.title == authorizedSignature.tr).path ?? ""),
                          //       filename: (list.firstWhere((element) => element.title == authorizedSignature.tr).path ?? "").split('/').last),
                          //   "iban_certificate": await dio.MultipartFile.fromFile((list.firstWhere((element) => element.title == ibanCertificate.tr).path ?? ""),
                          //       filename: (list.firstWhere((element) => element.title == ibanCertificate.tr).path ?? "").split('/').last),
                          //   "civil_card_document_front":
                          //       await dio.MultipartFile.fromFile((list.firstWhere((element) => element.title == civilId.tr).path ?? ""), filename: (list.firstWhere((element) => element.title == civilId.tr).path ?? "").split('/').last),
                          //   "civil_card_document_back":
                          //       await dio.MultipartFile.fromFile((list.firstWhere((element) => element.title == civilId.tr).path2 ?? ""), filename: (list.firstWhere((element) => element.title == civilId.tr).path2 ?? "").split('/').last),
                          // });
                          var formData = await createFormData();
                          await PersonalInformationController.to.storeBusinessDocumentApiCall(formData , () {
                            if (widget.isEdit == true) {
                              Get.back();
                              showSnackBar(title: ApiConfig.success, message: "Business Documents Submitted Successfully.");
                            } else {
                              Get.back();
                              Get.back();
                              Get.to(() => DocumentScreen());
                              showSnackBar(title: ApiConfig.success, message: "Business Documents Submitted Successfully.");
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


  Future<String> getPath(List<dynamic> list, String title, {bool isBack = false}) async {
    try {
      var element = list.firstWhere((element) => element.title == title.tr);
      return isBack ? (element.path2 ?? "") : (element.path ?? "");
    } catch (e) {
      print("Error fetching path for $title (back: $isBack): $e");
      return "";
    }
  }

  Future<dio.MultipartFile?> createMultipartFile(String path, String description) async {
    if (path.isEmpty) {
      print("Path is empty for $description");
      return null;
    }
    try {
      return await dio.MultipartFile.fromFile(path, filename: path.split('/').last);
    } catch (e) {
      print("Failed to create MultipartFile for $description: $e");
      return null;
    }
  }

  Future<dio.FormData> createFormData() async {
    var formData = dio.FormData();

    var paths = {
      'commercial_registration': await getPath(list, commercialRegistration.tr),
      'moa_of_company': await getPath(list, memorandumAssociationCompany.tr),
      'trade_license': await getPath(list, tradeLicense.tr),
      'signature_of_client': await getPath(list, authorizedSignature.tr),
      'iban_certificate': await getPath(list, ibanCertificate.tr),
      'civil_card_document_front': await getPath(list, civilId.tr),
      'civil_card_document_back': await getPath(list, civilId.tr,isBack: true) // Assuming a different handling or parameter for back
    };

    // Sequentially adding files allows for better debugging
    for (var entry in paths.entries) {
      var file = await createMultipartFile(entry.value, entry.key);
      if (file != null) {
        formData.files.add(MapEntry(entry.key, file));
      }
    }

    return formData;
  }

  Widget commonListTile(String val, var f, String path, String path2) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: color969AA4), borderRadius: BorderRadius.circular(8), color: colorFFFFFF),
      child: GestureDetector(
        onTap: () async {
          await Get.to(f);
          setState(() {});
        },
        child: Center(
          child: ListTile(
            leading: val == civilId.tr
                ? path.isNotEmpty && path2.isNotEmpty
                    ? Image.asset("assets/images/Done_round.png", scale: 4)
                    : null
                : path.isEmpty
                    ? null
                    : Image.asset("assets/images/Done_round.png", scale: 4),
            title: Text(val, style: color2B2E35w40018Istok),
            trailing: Image.asset('assets/images/Vector_right.png', scale: 4),
          ),
        ),
      ),
    );
  }
}

class Item {
  String? path;
  String? extension;
  String? title;
  String? path2;
  String? extension2;
  var f;

  Item({this.path, this.title, this.path2, this.f});
}
