import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class LanguageController extends GetxController {
  static LanguageController get to => Get.find();

  RxString selectedLanguage = 'arabic'.obs;

  //Function for language set........
  void selectLanguage(String language) {
    selectedLanguage.value = language;
  }
}