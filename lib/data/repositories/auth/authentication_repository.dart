import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/helpers/custom_snackbar.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  ///Firebase Auth instance
  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final User? user = _auth.currentUser;
    if (user != null) {
      user.emailVerified
          ? Get.offAllNamed('/navigation')
          : Get.offAllNamed('/signup/verify', arguments: {'email': user.email});
    } else {
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') == true
          ? Get.offAllNamed('/onboarding')
          : Get.offAllNamed('/login');
    }
  }

  //Email Authentication - Sign In

  ///Email Authentication - [REGISTER]
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    } catch (e) {
      throw 'Something went wrong, please try again';
    }
  }

  ///Email Authentication - [SEND_EMAIL_VERIFICATION]
  Future<void> sendEmailVerification() async {
    try {
      return await _auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    } catch (e) {
      throw 'Something went wrong, please try again';
    }
  }

  ///Email Authentication - [SIGN_IN]
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    } catch (e) {
      throw 'Something went wrong, please try again';
    }
  }

  ///Email Authentication - [RESET_PASSWORD]
  ///Send a password reset email to the user
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    } catch (e) {
      throw 'Something went wrong, please try again';
    }
  }

  ///Email Authentication - [LOGOUT]
  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.offAllNamed('/login');
      TSnackBars.successSnackBar(
        'Logged out',
        'Succesfully logged out',
        icon: TUiConstants.iconSuccess,
      );
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    } catch (e) {
      throw 'Something went wrong, please try again';
    }
  }
}
