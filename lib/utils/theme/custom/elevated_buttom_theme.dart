import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class TElevatedButtonTheme {
  // Private constructor to prevent instantiation
  TElevatedButtonTheme._();
  static final ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
    foregroundColor: TColors.lightOnPrimary,
    backgroundColor: TColors.lightPrimaryColor,

    fixedSize: const Size(
      240,
      TUiConstants.buttonHeight,
    ),
    disabledForegroundColor: TColors.lightOnSecondaryContainer,
    disabledBackgroundColor: TColors.lightSecondaryContainer,
    shadowColor: TColors.lightShadow, // Shadow color
    elevation: 1, // Elevation
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
          TUiConstants.borderRadiusMedium), // Rounded corners
    ),
  ));

  static final ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
    backgroundColor: TColors.darkPrimary, // Background color
    foregroundColor: TColors.darkOnPrimary, // Text color
    shadowColor: TColors.darkShadow, // Shadow color
    disabledForegroundColor: TColors.darkOnSecondaryContainer,
    disabledBackgroundColor: TColors.darkSecondaryContainer,
    elevation: 3, // Elevation
    fixedSize: const Size(
      TUiConstants.buttonWidth,
      TUiConstants.buttonHeight,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
          TUiConstants.borderRadiusMedium), // Rounded corners
    ),
  ));
}
