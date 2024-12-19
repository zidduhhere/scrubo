import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/theme/custom/texttheme.dart';

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
      textStyle: TTextTheme.lightTextTheme.bodyMedium!.copyWith(
        color: TColors.lightPrimaryColor,
        fontWeight: FontWeight.w600,
      ),
      foregroundColor: TColors.lightPrimaryColor,
      overlayColor: Colors.black.withAlpha(3),
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
    textStyle: TTextTheme.darkTextTheme.bodyMedium!
        .copyWith(color: TColors.darkPrimary, fontWeight: FontWeight.w600),
    foregroundColor: TColors.darkPrimary,
    overlayColor: Colors.white.withAlpha(1),
  ));
}
