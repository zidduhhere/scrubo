import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scrubo/utils/constants/colors.dart';

class TSnackBars {
  TSnackBars._();

  /// Displays a warning snackbar at the top of the screen.
  /// Parameters:
  /// - `String title`: The title of the snackbar.
  /// - `String message`: The message to be displayed in the snackbar.
  /// - `Color? color`: The color of the text in the snackbar.
  /// - `Color? backgroundColor`: The background color of the snackbar.
  static void warningSnackBar(String title, String message,
      {Color? color, Color? backgroundColor}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      snackStyle: SnackStyle.FLOATING,
      icon: const Icon(
        Iconsax.warning_2,
        color: Colors.black,
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: backgroundColor ?? Colors.orangeAccent,
      colorText: color ?? TColors.lightOnSurface,
    );
  }

  /// Displays a error snackbar at the top of the screen.
  /// Parameters:
  /// - `String title`: The title of the snackbar.
  /// - `String message`: The message to be displayed in the snackbar.
  /// - `Color? color`: The color of the text in the snackbar.
  /// - `Color? backgroundColor`: The background color of the snackbar.
  static void errorSnackBar(String title, String message,
      {Color? color, Color? backgroundColor}) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: backgroundColor ?? TColors.lightErrorContainer,
        colorText: color ?? TColors.lightOnErrorContainer,
        icon: const Icon(
          Iconsax.close_circle,
          color: TColors.lightOnErrorContainer,
        ));
  }

  /// Displays a success snackbar at the top of the screen.
  /// Parameters:
  /// - `String title`: The title of the snackbar.
  /// - `String message`: The message to be displayed in the snackbar.
  static void successSnackBar(String title, String message, {icon}) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: TColors.lightTertiaryContainer,
        colorText: TColors.lightOnTertiaryContainer,
        icon: Icon(
          icon ?? Iconsax.check,
          color: TColors.lightOnTertiaryContainer,
        ));
  }

  /// Displays a info snackbar at the top of the screen.
  /// Parameters:
  /// - `String title`: The title of the snackbar.
  /// - `String message`: The message to be displayed in the snackbar.
  static void infoSnackBar(String title, String message) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: TColors.lightPrimaryColor,
        colorText: TColors.lightOnPrimaryContainer,
        icon: const Icon(
          Iconsax.info_circle,
          color: TColors.lightOnPrimaryContainer,
        ));
  }
}
