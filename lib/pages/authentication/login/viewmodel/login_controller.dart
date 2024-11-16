// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/utils/helpers/helper_functions.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  static const String email = 'email';
  static const String password = 'password';
  RxBool obscureState = true.obs;
  final rememberMe = false.obs;
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
    print("isDarkMode: ${isDarkMode.value}");
  }

  void toggleObscure() {
    obscureState.value = !obscureState.value;
  }

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  bool loginValidation() {
    if (emailController.text == email && passwordController.text == password) {
      print("validation complete");
      return true;
    }

    return false;
  }

  bool login() {
    if (loginValidation()) {
      print("Logged in");
      Get.offAllNamed('/home');
      return true;
    }
    return false;
  }

  void signUp() {
    Get.toNamed('/signup');
  }
}
