// import 'package:get/get.dart';
// import 'package:scrubo/utils/helpers/helper_functions.dart';

// class OnboardingController extends GetxController {
//   RxBool isDarkMode = false.obs;

//   void toggleTheme() {
//     isDarkMode.value = !isDarkMode.value;
//     THelperFunctions.changeThemeMode(isDarkMode.value);
//   }
// }
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();
  void onClicked() {
    final deviceStorage = GetStorage();
    deviceStorage.write('isFirstTime', false);
    Get.offAllNamed('/login');
  }
}
