import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/utils/helpers/helper_functions.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final obscureState = true.obs;
  RxBool isDarkMode = Get.isDarkMode.obs;
  FormFieldValidator<String> get validator => (value) {
        return value;
      };

  void getThemeMode(BuildContext context) {
    isDarkMode.value = Theme.of(context).brightness == Brightness.dark;
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    THelperFunctions.changeThemeMode(isDarkMode.value);
  }

  void toggleObscure() {
    obscureState.value = !obscureState.value;
  }

  bool loginValidation() {
    //TODO: Implement login validation logic
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  bool login() {
    //TODO: Implement login logic
    return true;
  }
}
