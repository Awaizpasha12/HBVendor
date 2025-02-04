import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happybash/api_call/api_config.dart';
import 'package:happybash/common/common_method.dart';
import 'package:happybash/common/common_widget.dart';
import 'package:happybash/utility/common_string.dart';
import 'package:happybash/utility/styles.dart';

import '../utility/colors.dart';

class ProductAddScreen extends StatefulWidget {
  const ProductAddScreen({super.key});

  @override
  State<ProductAddScreen> createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {
  TextEditingController addCaptionController = TextEditingController();
  TextEditingController productIdController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productCategoryController = TextEditingController();
  TextEditingController meterReadingController = TextEditingController();
  TextEditingController hoursController = TextEditingController();
  TextEditingController modelController = TextEditingController();

  List<String> allowedExtensions = ["jpeg", "png", "jpg", "heif", "heic", "pdf"];
  String? fileExtension = "pdf";
  String? filePath ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorFFFFFF,
        title: Text(addProducts.tr, style: color484646w50022),
        leading: Padding(
          padding: const EdgeInsets.only(left: 34),
          child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset(
                "assets/images/Vector.png",
                scale: 4,
              )),
        ),
      ),
      backgroundColor: colorFFFFFF,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 17),
              child: Container(
                width: double.infinity,
                color: colorE9F1FF,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(addImages.tr, style: color333333w50016),
                      Image.asset(
                        "assets/images/blue_down.png",
                        scale: 4,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 10), //(8.0),
              child: Column(
                children: [
                  Container(
                      height: 200,
                      child: Image.asset(
                        "assets/images/Rectangle 8.png",
                        scale: 4,
                        fit: BoxFit.fill,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  commonTextFiledWithIcon(hintText: addCaption.tr, textEditingController: addCaptionController),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: () async {
                      FilePickerResult? result = await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: allowedExtensions,
                      );

                      if (result != null) {
                        File file = File(result.files.single.path ?? "");
                        fileExtension = file.path.split('.').last.toLowerCase();

                        print(file.path);
                        filePath = file.path;
                        // if (allowedExtensions.contains(fileExtension)) {
                        //   list.firstWhere((element) => element.title == "Iban certificate").extension = result.files.first.name;
                        //   list.firstWhere((element) => element.title == "Iban certificate").path = file.path;
                        //   setState(() {});
                        // } else {
                        //   print("Invalid file type");
                        //   showSnackBar(title: ApiConfig.error, message: invalidFileType.tr);
                        // }
                      } else {
                        showSnackBar(title: ApiConfig.error, message: fileNotSelected.tr);
                      }
                    },

                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: colorDDDDDD),
                      ),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/add_blue.png",scale: 4,),
                            SizedBox(width: 10,),
                            Text(uploadMoreImages.tr, style: color006CE3w40014),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  commonTextFiledWithIcon(hintText: productId.tr,textEditingController: productIdController,suffixIcon: Image.asset("assets/images/Icon_Solid.png",scale: 4 ,),),
                  SizedBox(height: 10,),
                  commonTextFiledWithIcon(hintText: productName.tr,textEditingController: productNameController,),
                  SizedBox(height: 10,),
                  commonTextFiledWithIcon(hintText: productCategory.tr,textEditingController: productCategoryController,),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Flexible(flex: 4,child: commonTextFiledWithIcon( hintText: meterReading.tr,textEditingController: meterReadingController,)),
                      SizedBox(width: 10,),
                      Flexible(flex: 3,child: commonTextFiledWithIcon(hintText: hours.tr,textEditingController: hoursController,suffixIcon: Image.asset("assets/images/Shape.png",scale: 5 ,))),
                    ],
                  ),
                  // commonTextFiledWithIcon(hintText: "Product ID",textEditingController: modelController,),
                  // Image.asset("assets/images/Star 1.png",scale: 4,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 17),
              child: Container(
                width: double.infinity,
                color: colorE9F1FF,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(optionalFields.tr, style: color333333w50016),
                      Image.asset(
                        "assets/images/blue_down.png",
                        scale: 4,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 10), //(8.0),
              child: Column(
                children: [
                  commonTextFiledWithIcon(hintText: assetValue.tr, textEditingController: addCaptionController),
                  SizedBox(height: 10,),
                  commonTextFiledWithIcon(hintText: purchaseDate.tr,textEditingController: productIdController,),
                  SizedBox(height: 10,),
                  commonTextFiledWithIcon(hintText: warrantyExpDate.tr,textEditingController: productNameController,),
                  SizedBox(height: 10,),
                  commonTextFiledWithIcon(hintText: operatorName.tr,textEditingController: productCategoryController,),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Flexible(flex: 4,child: SizedBox(width: 190,child: commonTextFiledWithIcon(hintText: maintenancePriority.tr,textEditingController: meterReadingController,))),
                      SizedBox(width: 10,),
                      Flexible(flex: 3,child: commonTextFiledWithIcon(hintText: normal.tr,textEditingController: hoursController,suffixIcon: Image.asset("assets/images/Shape.png",scale: 5 ,),)),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Flexible(flex: 4,child: SizedBox(width: 190,child: commonTextFiledWithIcon(hintText: ownershipMode.tr,textEditingController: meterReadingController,))),
                      SizedBox(width: 10,),
                      Flexible(flex: 3,child: commonTextFiledWithIcon(hintText: customer.tr,textEditingController: hoursController,suffixIcon: Image.asset("assets/images/Shape.png",scale: 5 ,),)),
                    ],
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20,),
              child: CommonButton(isLoading: false, title: save.tr, decoration: BoxDecoration(color: color2A9DA0, borderRadius: BorderRadius.circular(8)),),
            )
          ],
        ),
      ),
    );
  }
}
