import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:happybash/screens/duplicates/auth_document_upload_screen.dart';
import 'package:happybash/screens/duplicates/civil_upload_one_screen.dart';
import 'package:happybash/screens/duplicates/commercial_registration_upload_screen.dart';
import 'package:happybash/screens/duplicates/iban_document_upload_screen.dart';
import 'package:happybash/screens/duplicates/memorandum_document_upload_screen.dart';
import 'package:happybash/screens/duplicates/trade_document_upload_screen.dart';
import 'package:happybash/utility/colors.dart';
import 'package:happybash/utility/common_string.dart';
import 'package:happybash/utility/styles.dart';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart' as dio;



class BusinessDocumentScreen extends StatefulWidget {
  BusinessDocumentScreen({super.key, this.isEdit});

  final bool? isEdit;

  @override
  State<BusinessDocumentScreen> createState() => _BusinessDocumentScreenState();
}

RxList<Item> list = <Item>[].obs;

class _BusinessDocumentScreenState extends State<BusinessDocumentScreen> {
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
          ],
        ),
      ),
    );
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
