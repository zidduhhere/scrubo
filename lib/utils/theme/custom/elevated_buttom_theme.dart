import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class TElevatedButtonTheme {
  // Private constructor to prevent instantiation
  TElevatedButtonTheme._();
  static final ButtonStyle lightElevatedButtonTheme = ElevatedButton.styleFrom(
    backgroundColor: TColors.lightPrimaryColor, // Background color
    foregroundColor: TColors.lightOnPrimary, // Text color
    disabledForegroundColor: TColors.lightOnSecondaryContainer,
    disabledBackgroundColor: TColors.lightSecondaryContainer,
    shadowColor: TColors.lightShadow, // Shadow color
    elevation: 5, // Elevation
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
          TUiConstants.borderRadiusMedium), // Rounded corners
    ),
  );

  static final ButtonStyle darkElevatedButtonTheme = ElevatedButton.styleFrom(
    backgroundColor: TColors.darkPrimary, // Background color
    foregroundColor: TColors.darkOnPrimary, // Text color
    shadowColor: TColors.darkShadow, // Shadow color
    disabledForegroundColor: TColors.darkOnSecondaryContainer,
    disabledBackgroundColor: TColors.darkSecondaryContainer,
    elevation: 5, // Elevation
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
          TUiConstants.borderRadiusMedium), // Rounded corners
    ),
  );
}
