// ignore_for_file: avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/data/repositories/auth/authentication_repository.dart';
import 'package:scrubo/data/repositories/user/user_controller.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/device/device_utility.dart';
import 'package:scrubo/utils/device/network_manager.dart';
import 'package:scrubo/utils/exceptions/custom_firebase_auth_exception.dart';
import 'package:scrubo/utils/helpers/custom_loader_dialog.dart';
import 'package:scrubo/utils/helpers/custom_snackbar.dart';

///Signup Controller used for signup page state management
class SignupController extends GetxController {
  ///Instance of the controller
  ///'Get.put(SignupController())' in the view to make use of this instance
  ///'SignupController.instance' to access the instance of this controller
  ///in other controllers
  static SignupController get instance => Get.find();

  //Variables

  ///Privacy and Terms agreement check variable
  final agreeTerms = false.obs;

  ///A GlobalKey for the form
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ///email controller
  final emailController = TextEditingController();

  ///password controller
  final passwordController = TextEditingController();

  ///username controller
  final Rx<TextEditingController> userNameController =
      TextEditingController().obs;

  ///first name controller
  final firstNameController = TextEditingController();

  ///last name controller
  final lastNameController = TextEditingController();

  ///phone controller
  final phoneController = TextEditingController();

  ///A Getx variable for tracking the obscure text's in the password field
  final obscureState = false.obs; //obscure text

  final userController = Get.put(UserController());

  //Functions

  @override
  void onInit() {
    lastNameController.addListener(() {
      firstNameController.text.isNotEmpty && lastNameController.text.isNotEmpty
          ? userNameController.value.text =
              '${firstNameController.text.trim().toLowerCase()}${lastNameController.text.trim().toLowerCase()}'
          : userNameController.value.text = '';
    });
    super.onInit();
  }

  String _displayName(String a, String b) {
    return "${a.trim()} ${b.trim()}";
  }

  void signUp() async {
    try {
      ///Start Loading
      TLodaers.showFullScreenLoaderDialog(
          'We are processing your information...',
          animation: TLotties.animationLoading);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.hasInternetConnection();
      if (!isConnected) {
        TSnackBars.warningSnackBar(
            'No Internet Connection', 'Please check your internet connection');
        TLodaers.stopLoading();
        return;
      }

      //Form Validation
      if (!formKey.currentState!.validate()) {
        TLodaers.stopLoading();
        return;
      }

      //Agree terms and conditions check
      if (!agreeTerms.value) {
        TSnackBars.warningSnackBar(
            'Terms and Conditions', 'Please agree to the terms and conditions');
        return;
      }

      //Register User in the Firebase Authentication
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              emailController.text.trim(), passwordController.text.trim());

      /// Save authenticated user details in the Firebase firestore
      await userController.saveUserRecord(
        userCredential: userCredential,
        displayName: _displayName(
            firstNameController.text.trim(), lastNameController.text.trim()),
        userName: userNameController.value.text,
        phoneNumber: phoneController.text.trim(),
      );

      //Show success message
      TSnackBars.successSnackBar(
          'Congratulations', 'Your account has been created successfully');

      TLodaers.stopLoading();

      //Navigate to the verify email page
      Get.toNamed('/signup/verify');

      //Clear the form fields
      // emailController.clear();
      // passwordController.clear();
      // userNameController.clear();
      // firstNameController.clear();
      // lastNameController.clear();
      // phoneController.clear();
    } on FirebaseAuthException catch (e) {
      TFirebaseAuthException authException =
          TFirebaseAuthException(code: e.code);
      TSnackBars.errorSnackBar(authException.title, authException.message);
      TLodaers.stopLoading();
    } catch (e) {
      print(e);
      TSnackBars.errorSnackBar('Oh Snap...', e.toString());
      TLodaers.stopLoading();
    } finally {
      TDeviceUtility.hideKeyboard(Get.context!);
      //Remove Loader
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.value.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
