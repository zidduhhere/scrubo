// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/authentication/login/viewmodel/login_controller.dart';
import 'package:scrubo/res/app_controller.dart';

class SignupController extends GetxController implements AppControllerMixin {
  RxBool isDarkMode = Get.find<LoginController>().isDarkMode.value.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  RxBool obscureState = false.obs;
  final formKey = GlobalKey<FormState>();

  @override
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.find<LoginController>().toggleTheme();
  }

  @override
  void getThemeMode() {
    isDarkMode.value = Get.context!.theme.brightness == Brightness.dark;
  }

  @override
  void toggleObscure() {
    print(obscureState.value);
    obscureState.value = !obscureState.value;
  }

  FormFieldValidator<String> get emailValidator => (value) {
        print("Validating email");
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      };
  FormFieldValidator<String> get passwordValidator => (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        if (value.length < 8) {
          if (value.length > 15) {
            return 'Password must be at most 15 characters long';
          }
          return 'Password must be at least 8 characters long';
        }
        if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)').hasMatch(value)) {
          return 'Password must include uppercase, lowercase, and numeric characters';
        }
        return null;
      };
  FormFieldValidator<String> get usernameValidator => (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        if (value.length > 10) {
          return 'Username must be at most 10 characters long';
        }
        if (value.length < 6) {
          return 'Username must be at least 6 characters long';
        }
        if (!RegExp(r'^[a-z]+$').hasMatch(value)) {
          return 'Username must include only lowercase letters and no numbers';
        }
        return null;
      };
  FormFieldValidator<String> get firstNameValidator => (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        if (value.length < 2) {
          return 'First name must be at least 2 characters long';
        }
        if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
          return 'First name must contain only letters';
        }
        return null;
      };
  FormFieldValidator<String> get lastNameValidator => (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        if (value.length < 2) {
          return 'Last name must be at least 2 characters long';
        }
        if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
          return 'Last name must contain only letters';
        }
        return null;
      };
  FormFieldValidator<String> get phoneValidator => (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value)) {
          return 'Make sure the phone number is valid';
        }
        return null;
      };

  void createAccount() {
    if (true) {
      print("Account created");
      Get.toNamed('/signup/verify');
    }
  }

  void emailVerifyContinue() {
    Get.toNamed('/signup/verify/verified');
  }

  void resendEmail() {}

  void homeWithSignup() {
    Get.offAllNamed('/navigation');
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
