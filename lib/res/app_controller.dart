import 'package:get/get.dart';

class AppController extends GetxController {
  RxBool isDarkMode = Get.isDarkMode.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }
}

abstract class AppControllerMixin {
  void toggleTheme();
  void toggleObscure();

  void getThemeMode();
}
