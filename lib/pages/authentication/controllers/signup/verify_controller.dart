import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:scrubo/data/repositories/auth/authentication_repository.dart';
import 'package:scrubo/utils/exceptions/custom_firebase_auth_exception.dart';
import 'package:scrubo/utils/helpers/custom_snackbar.dart';

class VerifyController extends GetxController {
  static VerifyController get instance => Get.find();

  ///Send the email verification link to the user and start the timer
  @override
  void onInit() {
    super.onInit();
    sendEmailVerification();
    setTimerForAutoRedirect();
  }

  ///Send email verification link
  void sendEmailVerification() async {
    try {
      final auth = AuthenticationRepository.instance;
      await auth.sendEmailVerification();
      TSnackBars.infoSnackBar(
          'Email Send', 'Verification email sent to your email address');
    } on FirebaseAuthException catch (e) {
      TFirebaseAuthException authException =
          TFirebaseAuthException(code: e.code);
      TSnackBars.errorSnackBar(
          authException.title, e.message ?? authException.message);
    } catch (e) {
      TSnackBars.errorSnackBar('Error', e.toString());
    }
  }

  // Auto timer to check if the user has verified the email
  void setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      ///Check if the user has verified the email
      ///If the user has verified the email, stop the timer and redirect the user to the verifiedpage page
      await FirebaseAuth.instance.currentUser!.reload();
      if (FirebaseAuth.instance.currentUser?.emailVerified ?? false) {
        timer.cancel();
        Get.offAllNamed(
          '/signup/verify/verified',
        );
      }
    });
  }

  void checkifEmailVerfied() async {
    try {
      await FirebaseAuth.instance.currentUser!.reload();
      if (FirebaseAuth.instance.currentUser?.emailVerified ?? false) {
        Get.offAllNamed(
          '/signup/verify/verified',
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
