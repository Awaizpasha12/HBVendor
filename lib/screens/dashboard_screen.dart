import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:happybash/controllers/dashboard_controller.dart';
import 'package:happybash/screens/product_menu_screen.dart';
import 'package:happybash/utility/colors.dart';
import 'package:happybash/utility/common_string.dart';
import 'package:happybash/utility/styles.dart';

import '../common/common_method.dart';
import '../controllers/personal_information_controller.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DashboardController dashboardController = Get.put(DashboardController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getData();
    });
  }

  getData() async {
    await DashboardController.to.getDashboardApiCall(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBFBFB),
      appBar: AppBar(
        leadingWidth: 0,
        centerTitle: false,
        actions: [
          Obx(
            () => Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 2),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: SizedBox(height: 30, width: 30, child: CachedNetworkImage(imageUrl: PersonalInformationController.to.userDetailsData.value.data?.vendor?.profilePicture ?? "", errorWidget: (context, url, error) => Icon(Icons.error), fit: BoxFit.cover)))),
              ],
            ),
          ),
          SizedBox(width: 15)
        ],
        title: Obx(() => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text("Welcome\n${PersonalInformationController.to.userDetailsData.value.data?.vendor?.firstName ?? ""} ${PersonalInformationController.to.userDetailsData.value.data?.vendor?.lastName ?? ""}", style: color333333w60014))),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return getData()          ;
        },
        child: Obx(() => DashboardController.to.dashboardLoader.value
            ? const Center(child: SizedBox(height: 20, child: SpinKitThreeBounce(color: Color(0xFF2A9DA0), size: 30.0)))
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 250,
                          decoration: const BoxDecoration(
                              color: colorFCF4EA,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              )),
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 230,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    stops: [0.0, 0.4],
                                    begin: FractionalOffset.topCenter,
                                    end: FractionalOffset.bottomCenter,
                                    colors: [colorF2F3F4, colorEDD2B4],
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(50),
                                    bottomRight: Radius.circular(50),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                              child: Container(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: color3085FE)),
                                            child: Padding(
                                              padding: const EdgeInsets.fromLTRB(16, 13, 0, 22),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(totalSales.tr, style: color101317w70016),
                                                  SizedBox(height: 10),
                                                  Text("${DashboardController.to.dashboardData.value.data?.statistics?.totalSales ?? "0"} KWD", style: color3085FEw50020),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 11,
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Color(0xFFA3D139))),
                                            child: Padding(
                                              padding: const EdgeInsets.fromLTRB(16, 13, 0, 22),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(totalOrders.tr, style: color101317w70016),
                                                  SizedBox(height: 10),
                                                  Text("${DashboardController.to.dashboardData.value.data?.statistics?.totalOders ?? "0"}", style: colorA3D139w50020),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 11,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(color: colorEADAF4, borderRadius: BorderRadius.circular(10), border: Border.all(color: color9B59B6)),
                                            child: Padding(
                                              padding: const EdgeInsets.fromLTRB(16, 13, 0, 22),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    delivered.tr,
                                                    style: color101317w70016,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "${DashboardController.to.dashboardData.value.data?.statistics?.delivered ?? "0"}",
                                                    style: color9B59B6w50020,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 11,
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(color: colorFF7F74, borderRadius: BorderRadius.circular(10), border: Border.all(color: colorE74C3C)),
                                            child: Padding(
                                              padding: const EdgeInsets.fromLTRB(16, 13, 0, 22),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    pending.tr,
                                                    style: color101317w70016,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "${DashboardController.to.dashboardData.value.data?.statistics?.pending ?? "0"}",
                                                    style: colorB33022w50020,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    // const SizedBox(height: 9,),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 17),
                    //   child: Text("Recent Product",style: colo57585Aw40015,),
                    // ),
                    // const SizedBox(height: 6,),
                    // SizedBox(
                    //   height: 146,
                    //   child: ListView.builder(
                    //     scrollDirection: Axis.horizontal,
                    //     itemCount: 4,
                    //       shrinkWrap: true,
                    //     itemBuilder: (context, int index) {
                    //     return Stack(
                    //       alignment: Alignment.bottomLeft,
                    //       children: [
                    //         Padding(
                    //           padding: const EdgeInsets.fromLTRB(7,9,7,9),
                    //           child: Container(
                    //               height: 124,
                    //               width: 271,
                    //               decoration: BoxDecoration(
                    //
                    //                 borderRadius: BorderRadius.circular(10),
                    //               ),
                    //               child: Image.asset("assets/images/decoration.png",fit: BoxFit.fill,)),
                    //         ),
                    //         Padding(
                    //           padding: const EdgeInsets.fromLTRB(17,13,13,15),//(8.0),
                    //           child: Container(
                    //             height: 43,
                    //             width: 43,
                    //             decoration: BoxDecoration(
                    //               color: colorFFFFFF,
                    //               borderRadius: BorderRadius.circular(50),
                    //             ),
                    //             child: Image.asset("assets/images/Group.png",scale: 4,),
                    //           ),
                    //         )
                    //       ],
                    //     );
                    //     },
                    //
                    //   ),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: colorFFFFFF,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: colorDFE6E9),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 16.7),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/Button.png",
                                                scale: 4,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  product.tr,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: colo101317w30014,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "${DashboardController.to.dashboardData.value.data?.statistics?.products ?? "0"}",
                                            style: colo101317w50020,
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            totalProducts.tr,
                                            style: colo101317w30014,
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: colorFFFFFF,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: colorDFE6E9),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 16.7),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Flexible(
                                                  flex: 1,
                                                  child: Image.asset(
                                                    "assets/images/Button2.png",
                                                    scale: 4,
                                                  )),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  offline.tr,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: colo101317w30014,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "${DashboardController.to.dashboardData.value.data?.statistics?.offline ?? "0"}",
                                            style: colo101317w50020,
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            productOffline.tr,
                                            style: colo101317w30014,
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: colorFFFFFF,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: colorDFE6E9),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 16.7),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/Button.png",
                                                scale: 4,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  confirmation.tr,
                                                  style: colo101317w30014,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text("${DashboardController.to.dashboardData.value.data?.statistics?.confirmation ?? "0"}", style: colo101317w50020),
                                          const SizedBox(height: 8),
                                          FittedBox(
                                              child: Text(
                                            orderConfirmation.tr,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: colo101317w30014,
                                          )),
                                        ],
                                      ),
                                    )),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: colorFFFFFF,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: colorDFE6E9),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 16.7), //(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [Image.asset("assets/images/Button2.png", scale: 4), const SizedBox(width: 10), Expanded(child: Text(cancelled.tr, maxLines: 1, overflow: TextOverflow.ellipsis, style: colo101317w30014))],
                                          ),
                                          const SizedBox(height: 8),
                                          Text("${DashboardController.to.dashboardData.value.data?.statistics?.cancelled ?? "0"}", style: colo101317w50020),
                                          const SizedBox(height: 8),
                                          Text(ordersCancelled.tr, style: colo101317w30014)
                                        ],
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 25),//(8.0),
                    //   child: GridView.builder(
                    //     physics: const NeverScrollableScrollPhysics(),
                    //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                    //       crossAxisSpacing: 5,
                    //       childAspectRatio: 1,
                    //       mainAxisSpacing: 5,),
                    //     itemBuilder: (BuildContext context, int index) {
                    //     context;
                    //     return Container(
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(10),
                    //           border: Border.all(color: colorDFE6E9),
                    //         ),
                    //         child: Padding(
                    //           padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 16.7),
                    //           child: Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Row(
                    //                 children: [
                    //                   Image.asset(
                    //                     "assets/images/Button.png",
                    //                     scale: 4,
                    //                   ),
                    //                   const SizedBox(
                    //                     width: 10,
                    //                   ),
                    //                   Expanded(
                    //                     child: Text(
                    //                       DashboardController.to.dashboardData.value.data?.recentProducts?[index].product?.name ?? "",
                    //                       style: colo101317w30014,maxLines: 2,overflow: TextOverflow.ellipsis,
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //               const SizedBox(
                    //                 height: 8,
                    //               ),
                    //               Text(
                    //                 "150",
                    //                 style: colo101317w50020,
                    //               ),
                    //               const SizedBox(
                    //                 height: 8,
                    //               ),
                    //               Text(
                    //                 totalProducts.tr,
                    //                 style: colo101317w30014,
                    //               ),
                    //               const SizedBox(
                    //                 height: 16.87,
                    //               )
                    //             ],
                    //           ),
                    //         ));
                    //
                    //   }, itemCount:  DashboardController.to.dashboardData.value.data?.recentProducts?.length ?? 0, shrinkWrap: true,),
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )),
      ),
    );
  }
}
