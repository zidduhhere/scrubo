import 'package:get/get.dart';

class AppController extends GetxController {
  RxBool isDarkMode = Get.isDarkMode.obs;
  RxInt currentPage = 0.obs;
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }

  void changePage() {}
}

abstract class AppControllerMixin {
  void toggleTheme();
  void toggleObscure();

  void getThemeMode();
}
