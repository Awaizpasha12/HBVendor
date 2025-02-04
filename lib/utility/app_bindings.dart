import 'package:get/get.dart';


import '../controllers/auth_controller.dart';
import '../controllers/language_selection_controller.dart';
import '../controllers/personal_information_controller.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put(AuthController(), permanent: true);
    Get.put(LanguageController(), permanent: true);
    Get.put(PersonalInformationController(), permanent: true);

  }
}
