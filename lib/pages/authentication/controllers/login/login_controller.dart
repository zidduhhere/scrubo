import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scrubo/data/repositories/auth/authentication_repository.dart';
import 'package:scrubo/pages/authentication/screens/login/view/forgot_password.dart';
import 'package:scrubo/utils/device/network_manager.dart';
import 'package:scrubo/utils/exceptions/custom_firebase_auth_exception.dart';
import 'package:scrubo/utils/helpers/custom_loader_dialog.dart';
import 'package:scrubo/utils/helpers/custom_snackbar.dart';
import 'package:scrubo/utils/validator/validation.dart';

class LoginController extends GetxController {
  ///Instance of the controller
  static LoginController get instance => Get.find();

  //Functions

  @override
  void onInit() {
    super.onInit();
    emailController.text = getStorage.read('REMEMBER_EMAIL');
    passwordController.text = getStorage.read('REMEMBER_PASSWORD');
    obscureState.value = true;
  }

  void forgotPassword({bool resend = false}) async {
    try {
      // Check internet connectivity
      final isConnected = await NetworkManager.instance.hasInternetConnection();
      if (!isConnected) {
        TSnackBars.errorSnackBar('No Internet Connection',
            'Please check your internet connection and try again');
        return;
      }

      //Check and validate the email field
      final emailState =
          TValidation.emailValidator(emailController.text.trim());
      if (emailState != null) {
        TSnackBars.errorSnackBar('Check the email', emailState);

        return;
      }

      // Start the loading
      resend == false
          ? TLodaers.showCircularIndicatorFullScreenLoaderDialog(
              'We are resending you a password reset email')
          : null;

      // Send the password reset email
      await AuthenticationRepository.instance
          .resetPassword(emailController.text.trim());

      // Stop the loading
      resend == false ? TLodaers.stopLoading() : null;
      // Show a snackBar
      TSnackBars.infoSnackBar('Email Sent',
          'A password reset email has been sent to your email address');

      // Redirect the user to the forgot password page
      resend == false
          ? Get.to(() => ForgotPasswordView(email: emailController.text.trim()))
          : null;
    } on FirebaseAuthException catch (e) {
      TFirebaseAuthException authException =
          TFirebaseAuthException(code: e.code);
      TLodaers.stopLoading();
      TSnackBars.errorSnackBar(authException.title, authException.message);
    } catch (e) {
      TLodaers.stopLoading();
      TSnackBars.errorSnackBar('Ohh snap..', e.toString());
    }
  }

  ///Varibales

  ///Storage
  final getStorage = GetStorage();

  ///Email Controller
  final emailController = TextEditingController();

  ///Password Controller
  final passwordController = TextEditingController();

  ///Form Key
  final formKey = GlobalKey<FormState>();

  ///Obscure State
  RxBool obscureState = true.obs;

  ///Remember Me
  final rememberMe = false.obs;

  void signIn() async {
    try {
      // Check internet connectivity
      final isConnected = await NetworkManager.instance.hasInternetConnection();
      if (!isConnected) {
        // TLodaers.stopLoading();
        TSnackBars.errorSnackBar('No Internet Connection',
            'Please check your internet connection and try again');
        return;
      }

      // Form Validation

      if (!formKey.currentState!.validate()) {
        // TLodaers.stopLoading();
        TSnackBars.errorSnackBar(
            'Check the email', 'Please enter a valid email');
        return;
      }

      // Sign in the user

      await AuthenticationRepository.instance.loginWithEmailAndPassword(
          emailController.text.trim(), passwordController.text.trim());

      // Remember Me
      if (rememberMe.value) {
        getStorage.write('REMEMBER_EMAIL', emailController.text.trim());
        getStorage.write('REMEMBER_PASSWORD', passwordController.text.trim());
      }

      // Clear the text fields
      emailController.clear();
      passwordController.clear();

      // Stop the loading

      // TLodaers.stopLoading();

      // Redirect the user to the home page
      AuthenticationRepository.instance.screenRedirect();
    } on FirebaseAuthException catch (e) {
      TFirebaseAuthException authException =
          TFirebaseAuthException(code: e.code);

      // TLodaers.stopLoading();
      TSnackBars.errorSnackBar(authException.title, authException.message);
    } catch (e) {
      // TLodaers.stopLoading();
      TSnackBars.errorSnackBar('Ohh snap..', e.toString());
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
