import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  static OutlinedButtonThemeData lightOutlinedButtonTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      fixedSize:
          const Size(TUiConstants.buttonWidth, TUiConstants.buttonHeight),
      padding: const EdgeInsets.symmetric(
        vertical: TUiConstants.buttonPaddingVertical,
        horizontal: TUiConstants.buttonPaddingHorizontal,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TUiConstants.borderRadiusMedium),
      ),
      side: const BorderSide(
        color: TColors.lightPrimaryColor,
        width: 1,
      ),
      textStyle: const TextStyle().copyWith(
        fontSize: TUiConstants.fontSizeSmall,
        fontWeight: FontWeight.w500,
      ),
      foregroundColor: TColors.lightPrimaryColor,
      overlayColor: Colors.black.withOpacity(0.1),
    ),
  );

  static OutlinedButtonThemeData darkOutlinedButtonTheme =
      OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
    fixedSize: const Size(TUiConstants.buttonWidth, TUiConstants.buttonHeight),
    padding: const EdgeInsets.symmetric(
      vertical: TUiConstants.buttonPaddingVertical,
      horizontal: TUiConstants.buttonPaddingHorizontal,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(TUiConstants.borderRadiusMedium),
    ),
    side: const BorderSide(
      color: TColors.darkPrimary,
      width: 1,
    ),
    textStyle: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeSmall,
      fontWeight: FontWeight.w500,
    ),
    foregroundColor: TColors.darkPrimary,
    overlayColor: Colors.white.withOpacity(0.1),
  ));
}
