import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:happybash/api_call/api_config.dart';
import 'package:happybash/common/common_method.dart';
import 'package:happybash/common/common_widget.dart';
import 'package:happybash/controllers/personal_information_controller.dart';
import 'package:happybash/utility/colors.dart';
import 'package:happybash/utility/common_string.dart';
import 'package:happybash/utility/styles.dart';
import 'package:multiselect/multiselect.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key, this.isEdit});

  final bool? isEdit;

  @override
  State<PersonalInformationScreen> createState() => _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  //GetX Controllers...........
  final PersonalInformationController personalInformationController = Get.put(PersonalInformationController());

  //Validation upload Document...........
  List<String> allowedExtensions = ["jpeg", "png", "jpg", "heif", "heic"];
  List<String> languageList = [english.tr, arabic.tr];

  List<String> businessCategoryName = [];
  String selectedLanguage = "";
  List<String> selectedOptionLanguageList = [];

  String? selectedItem;

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
    await PersonalInformationController.to.getBusinessCategoryApiCall(() {});
    businessCategoryName = personalInformationController.businessCategoryData.value.data!.map((e) => e.name.toString()).toList();
    // mobileNumberController.text = personalInformationController.userDetailsData.value.data?.phone ?? "";
  }

  //TextField Controllers.............
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController whatsAppNumberController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController completeAddressController = TextEditingController();
  TextEditingController companyLogoController = TextEditingController();
  TextEditingController referralCodeController = TextEditingController();
  TextEditingController businessCategoryController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController civilIdController = TextEditingController();

  //variables..........

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 27, horizontal: 21),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    businessInformation.tr,
                    style: color2B2E35w50022,
                  ),
                  SizedBox(
                    height: 34.h,
                  ),
                  Text(
                    firstName.tr,
                    style: color57585Aw40016Istok,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  commonTextFiled(
                    isEnabled: false,
                    hintText: personalInformationController.userDetailsData.value.data?.vendor?.firstName ?? "",
                    textEditingController: firstNameController,
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  Text(
                    lastName.tr,
                    style: color57585Aw40016Istok,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  commonTextFiled(
                    isEnabled: false,
                    hintText: personalInformationController.userDetailsData.value.data?.vendor?.lastName ?? "",
                    textEditingController: lastNameController,
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  Text(
                    businessName.tr,
                    style: color57585Aw40016Istok,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  commonTextFiled(
                    isEnabled: false,
                    hintText: personalInformationController.userDetailsData.value.data?.vendor?.businessName ?? "",
                    textEditingController: businessNameController,
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  Text(
                    dateOfBirth.tr,
                    style: color57585Aw40016Istok,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  commonTextFiled(
                    isEnabled: false,
                    hintText: personalInformationController.userDetailsData.value.data?.vendor?.dateOfBirth.toString() ?? "",
                    textEditingController: personalInformationController.dateOfBirthController,
                    suffixIcon: Image.asset(
                      "assets/images/cale_icon.png",
                      scale: 4,
                    ),
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  Text(
                    primaryMobileNumber.tr,
                    style: color57585Aw40016Istok,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  commonTextFiled(
                      isEnabled: false,
                      preFixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: 15.w),
                          Text(
                              personalInformationController.userDetailsData.value.data?.phone.toString().length == 10 ? "+91" : "+965",
                          ),
                          const Icon(
                            Icons.arrow_drop_down_rounded,
                            color: Color(0xFF1E1E1E),
                          ),
                          SizedBox(width: 8.w),
                        ],
                      ),
                      // preFixIcon: Obx(() => GestureDetector(
                      //   onTap: () {
                      //     showCountryPicker(
                      //       useRootNavigator: true,
                      //       context: context,
                      //       showPhoneCode: true,
                      //       countryFilter: ['IN', 'KW'],
                      //       countryListTheme: CountryListThemeData(
                      //         bottomSheetHeight: 500.h,
                      //         inputDecoration: InputDecoration(
                      //           hintText: "Search",
                      //           contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      //           focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: color34A853), borderRadius: BorderRadius.circular(10)),
                      //           disabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: color969AA4), borderRadius: BorderRadius.circular(10)),
                      //           enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: color969AA4), borderRadius: BorderRadius.circular(10)),
                      //           border: InputBorder.none,
                      //         ),
                      //         searchTextStyle: color969AA4w40016.copyWith(color: color969AA4.withOpacity(0.5)),
                      //       ),
                      //       onSelect: (Country country) {
                      //         personalInformationController.selectedCountryCode.value = country.countryCode;
                      //         personalInformationController.selectedCountryPhone.value = "+${country.phoneCode}";
                      //       },
                      //     );
                      //   },
                      //   child: Row(
                      //     mainAxisSize: MainAxisSize.min,
                      //     children: [
                      //       SizedBox(width: 15.w),
                      //       Text(
                      //         personalInformationController.selectedCountryPhone.value,
                      //       ),
                      //       const Icon(
                      //         Icons.arrow_drop_down_rounded,
                      //         color: Color(0xFF1E1E1E),
                      //       ),
                      //       SizedBox(width: 8.w),
                      //     ],
                      //   ),
                      // )),
                      hintText: personalInformationController.userDetailsData.value.data?.phone ?? "",
                      keyboardType: TextInputType.number,
                      textEditingController: mobileNumberController),
                  SizedBox(
                    height: 26.h,
                  ),
                  Text(
                    whatsAppNumber.tr,
                    style: color57585Aw40016Istok,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  commonTextFiled(
                      isEnabled: false,
                      preFixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: 15.w),
                          Text(
                            personalInformationController.userDetailsData.value.data?.phone.toString().length == 10 ? "+91" : "+965",
                          ),
                          const Icon(
                            Icons.arrow_drop_down_rounded,
                            color: Color(0xFF1E1E1E),
                          ),
                          SizedBox(width: 8.w),
                        ],
                      ),
                      // preFixIcon: Obx(() => GestureDetector(
                      //   onTap: () {
                      //     showCountryPicker(
                      //       context: context,
                      //       showPhoneCode: true,
                      //       countryFilter: ['IN', 'KW'],
                      //       countryListTheme: CountryListThemeData(
                      //         bottomSheetHeight: 500.h,
                      //         inputDecoration: InputDecoration(
                      //           hintText: "Search",
                      //           contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      //           focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: color34A853), borderRadius: BorderRadius.circular(10)),
                      //           disabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: color969AA4), borderRadius: BorderRadius.circular(10)),
                      //           enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: color969AA4), borderRadius: BorderRadius.circular(10)),
                      //           border: InputBorder.none,
                      //         ),
                      //         searchTextStyle: color969AA4w40016.copyWith(color: color969AA4.withOpacity(0.5)),
                      //       ),
                      //       onSelect: (Country country) {
                      //         personalInformationController.selectedCountryCode.value = country.countryCode;
                      //         personalInformationController.selectedCountryPhoneA.value = "+${country.phoneCode}";
                      //       },
                      //     );
                      //   },
                      //   child: Row(
                      //     mainAxisSize: MainAxisSize.min,
                      //     children: [
                      //       SizedBox(width: 15.w),
                      //       Text(
                      //         personalInformationController.selectedCountryPhoneA.value,
                      //       ),
                      //       const Icon(
                      //         Icons.arrow_drop_down_rounded,
                      //         color: Color(0xFF1E1E1E),
                      //       ),
                      //       SizedBox(width: 8.w),
                      //     ],
                      //   ),
                      // )),
                      hintText: personalInformationController.userDetailsData.value.data?.vendor?.whatsappNumber ?? "",
                      textEditingController: whatsAppNumberController),
                  SizedBox(
                    height: 26.h,
                  ),
                  Text(
                    emailAddress.tr,
                    style: color57585Aw40016Istok,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  commonTextFiled(
                    isReadOnly: true,
                    hintText: personalInformationController.userDetailsData.value.data?.vendor?.email ?? "",
                    textEditingController: emailAddressController,
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  Text(
                    city.tr,
                    style: color57585Aw40016Istok,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  commonTextFiled(
                    isEnabled: false,
                    hintText: personalInformationController.userDetailsData.value.data?.vendor?.city ?? "",
                    textEditingController: cityController,
                    suffixIcon: Image.asset(
                      "assets/images/Vector_right.png",
                      scale: 4,
                    ),
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  Text(
                    completeAddress.tr,
                    style: color57585Aw40016Istok,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  commonTextFiled(
                    isEnabled: false,
                    hintText: personalInformationController.userDetailsData.value.data?.vendor?.address ?? "",
                    textEditingController: completeAddressController,
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  Text(
                    companyLogo.tr,
                    style: color57585Aw40016Istok,
                  ),
                  SizedBox(
                    height: 5.h,
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
                      height: 90.58,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          personalInformationController.userDetailsData.value.data?.vendor?.profilePicture?.split(".").last == "pdf"?
                          Text(personalInformationController.userDetailsData.value.data?.vendor?.businessDocument?.tradeLicense!.split("/").last ?? ""):
                          CachedNetworkImage(
                              imageUrl:  personalInformationController.userDetailsData.value.data?.vendor?.businessDocument?.tradeLicense ?? "",
                              scale: 4,
                              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                              fit: BoxFit.fill),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  Text(
                    referralCode.tr,
                    style: color57585Aw40016Istok,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  commonTextFiled(
                    isReadOnly: true,
                    hintText: personalInformationController.userDetailsData.value.data?.vendor?.referralCode ?? "",
                    textEditingController: referralCodeController,
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  Text(
                    businessCategory.tr,
                    style: color57585Aw40016Istok,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  commonTextFiled(
                    isReadOnly: true,
                    hintText:  personalInformationController.userDetailsData.value.data?.vendor?.businessCategory == 1 ? "Food & Dining" : "Event Management",
                    textEditingController: referralCodeController,
                  ),

                  SizedBox(
                    height: 26.h,
                  ),
                  Text(
                    languagesYouKnow.tr,
                    style: color57585Aw40016Istok,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  commonTextFiled(
                    isReadOnly: true,
                    isEnabled: false,
                    hintText: personalInformationController.userDetailsData.value.data?.vendor?.languages ?? "",
                    textEditingController: referralCodeController,
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
