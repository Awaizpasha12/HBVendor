import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:happybash/screens/product_add_screen.dart';
import 'package:happybash/utility/colors.dart';
import 'package:happybash/utility/common_string.dart';
import 'package:happybash/utility/styles.dart';

import '../common/common_widget.dart';
import '../controllers/dashboard_controller.dart';

class ProductMenuScreen extends StatefulWidget {
  const ProductMenuScreen({super.key});

  @override
  State<ProductMenuScreen> createState() => _ProductMenuScreenState();
}

class _ProductMenuScreenState extends State<ProductMenuScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getData();
    });
  }

  getData() async {
    await DashboardController.to.getProductApiCall(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        backgroundColor: colorFFFFFF,
        title: Text(products.tr, style: color484646w50022),
        leading: SizedBox(),
      ),
      backgroundColor: colorFFFFFF,
      body: Obx(() => DashboardController.to.productListLoader.value
          ? const Center(child: SizedBox(height: 20, child: SpinKitThreeBounce(color: Color(0xFF2A9DA0), size: 30.0)))
          : DashboardController.to.productData.value.data?.isEmpty ?? false ? Center(child: Text(noDataFound.tr, style: color57585Aw40016)) : ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: colorFFFFFF,
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 5),
                          blurRadius: 6,
                          spreadRadius: 0,
                          color: colorB1A7A7,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.favorite_border, color: colorFB6236, weight: 1, size: 15),
                          const SizedBox(width: 7),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: 80,
                                    width: 117,
                                    child: CachedNetworkImage(
                                        imageUrl: (DashboardController.to.productData.value.data?[index].images ?? []).isEmpty ? "" : (DashboardController.to.productData.value.data?[index].images ?? []).first.imageUrl ?? "",
                                        scale: 4,
                                        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) => Icon(Icons.error),
                                        fit: BoxFit.fill)),
                                const SizedBox(width: 22),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(DashboardController.to.productData.value.data?[index].name ?? "--", style: color484646w60014, maxLines: 1, overflow: TextOverflow.ellipsis),
                                      const SizedBox(height: 4),
                                      Text(DashboardController.to.productData.value.data?[index].description ?? "--", maxLines: 1, overflow: TextOverflow.ellipsis, style: color484646w40013),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Image.asset("assets/images/star.png", scale: 4),
                                          const SizedBox(width: 1),
                                          Text((DashboardController.to.productData.value.data?[index].rating ?? "0").toString(), maxLines: 1, overflow: TextOverflow.ellipsis, style: colorFB6236w70011),
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text("KWD ${(DashboardController.to.productData.value.data?[index].pricePerDay ?? "0").toString()}", style: color000000w60015),
                                          GestureDetector(
                                              behavior: HitTestBehavior.opaque,
                                              onTap: () {
                                                final _formKey = GlobalKey<FormState>();

                                                TextEditingController addCaptionController = TextEditingController(text: DashboardController.to.productData.value.data?[index].name ?? "");
                                                TextEditingController productIdController = TextEditingController(text: DashboardController.to.productData.value.data?[index].pricePerDay ?? "");
                                                showModalBottomSheet(
                                                    context: context,
                                                    isScrollControlled: true,
                                                    useSafeArea: true,
                                                    backgroundColor: Colors.transparent,
                                                    barrierColor: Color(0xff000000).withOpacity(0.3),
                                                    builder: (BuildContext context) {
                                                      return Container(
                                                        decoration: const BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)), color: colorFFFFFF),
                                                        child: SafeArea(
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(15.0),
                                                            child: Form(
                                                              key: _formKey,
                                                              child: SingleChildScrollView(
                                                                child: Padding(
                                                                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                                                  child: Column(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    children: [
                                                                      SizedBox(height: 15),
                                                                      Text(editProduct.tr, style: color000000w60018),
                                                                      SizedBox(height: 30),
                                                                      commonTextFiledWithIcon(
                                                                          hintText: productName.tr,
                                                                          textEditingController: addCaptionController,
                                                                          validationFunction: (String? value) {
                                                                            if (value == null || value.isEmpty) {
                                                                              return enterProductName.tr;
                                                                            }

                                                                            return null;
                                                                          }),
                                                                      SizedBox(height: 10),
                                                                      commonTextFiledWithIcon(
                                                                          hintText: price.tr,
                                                                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                          inputFormatter: [FilteringTextInputFormatter.allow(RegExp('[0-9.]'))],
                                                                          textEditingController: productIdController,
                                                                          validationFunction: (String? value) => value == null || value == "" ? enterPrice.tr : null),
                                                                      SizedBox(height: 30),
                                                                      Row(
                                                                        children: [
                                                                          Expanded(
                                                                              child: CommonButton(
                                                                            onPressed: () {
                                                                              Get.back();
                                                                            },
                                                                            isLoading: false,
                                                                            title: cancel.tr,
                                                                            decoration: BoxDecoration(color: color2A9DA0, borderRadius: BorderRadius.circular(0)),
                                                                          )),
                                                                          SizedBox(width: 15),
                                                                          Expanded(
                                                                              child: Obx(() => CommonButton(
                                                                                    onPressed: () {
                                                                                      if (_formKey.currentState!.validate()) {
                                                                                        DashboardController.to.updateProductApiCall(DashboardController.to.productData.value.data?[index].id ?? 0, {"name" : addCaptionController.text, "price_per_day": productIdController.text},() {
                                                                                          Get.back();
                                                                                          getData();
                                                                                        });
                                                                                      }
                                                                                    },
                                                                                    isLoading: DashboardController.to.updateProductLoader.value,
                                                                                    title: save.tr,
                                                                                    decoration: BoxDecoration(color: color2A9DA0, borderRadius: BorderRadius.circular(0)),
                                                                                  ))),
                                                                        ],
                                                                      ),
                                                                      SizedBox(height: 15),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    });
                                              },
                                              child: Container(decoration: BoxDecoration(color: colorFB6236, borderRadius: BorderRadius.circular(3)), child: Image.asset("assets/images/edit.png", scale: 5))),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: DashboardController.to.productData.value.data?.length ?? 0)),
    );
  }
}
