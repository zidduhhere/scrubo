import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class TChipTheme {
  TChipTheme._();

  static const ChipThemeData lightChipThemeData = ChipThemeData(
    checkmarkColor: TColors.lightPrimaryColor,
    disabledColor: TColors.lightSurfaceContainerHigh,
    selectedColor: TColors.lightPrimaryColor,
    shape: RoundedRectangleBorder(side: BorderSide.none),
    padding: EdgeInsets.all(TUiConstants.m * .8),
    labelStyle: TextStyle(
      color: Colors.white,
      fontSize: TUiConstants.fontSizeSmall,
    ),
  );

  static ChipThemeData darkChipThemeData = ChipThemeData(
    disabledColor: Colors.grey,
    selectedColor: TColors.darkPrimary,
    secondarySelectedColor: Colors.blue,
    padding: const EdgeInsets.all(TUiConstants.m),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    labelStyle: const TextStyle(
      color: Colors.white,
      fontSize: TUiConstants.fontSizeSmall,
    ),
    secondaryLabelStyle: const TextStyle(
      color: Colors.black,
      fontSize: TUiConstants.fontSizeMedium,
    ),
    brightness: Brightness.dark,
  );
}
