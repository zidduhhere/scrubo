// uiconstants.dart
import 'package:flutter/material.dart';

class TUiConstants {
  // Padding
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 12.0;
  static const double paddingLarge = 20.0;

  // Margin
  static const double marginSmall = 8.0;
  static const double marginMedium = 16.0;
  static const double marginLarge = 24.0;

  // Font Size
  static const double fontSizeVerySmall = 12.0;
  static const double fontSizeSmall = 14.0;
  static const double fontSizeMedium = 16.0;
  static const double fontSizeMediumLarge = 18.0;
  static const double fontSizeLarge = 20.0;

  static const double fontSizeExtraLarge = 22.0;

  static const double headlineSmall = 24.0;
  static const double headlineMedium = 28.0;
  static const double headlineLarge = 32.0;

  // Logo Size
  static const double logoSizeSmall = 40.0;
  static const double logoSizeMedium = 80.0;
  static const double logoSizeLarge = 120.0;

  // Image Size
  static const double imageSizeSmall = 40.0;
  static const double imageSizeMedium = 80.0;
  static const double imageSizeLarge = 120.0;
// Icon Size
  static const double iconSizeSmall = 24.0;
  static const double iconSizeMedium = 32.0;
  static const double iconSizeLarge = 48.0;

// Border Radius
  static const double borderRadiusSmall = 4.0;
  static const double borderRadiusMedium = 8.0;
  static const double borderRadiusLarge = 16.0;

// Elevation
  static const double elevationLow = 2.0;
  static const double elevationMedium = 4.0;
  static const double elevationHigh = 8.0;

  static const double s = 8.0;
  static const double m = 16.0;
  static const double l = 24.0;
  static const double xl = 32.0;
  static const double xxl = 40.0;

  static const double textFieldBorder = 2;

  static const double appBarheight = 56.0;
  static const double bottomNavigationBarHeight = 56.0;
  static const double defaultSpacing = 16.0;

  // Button Size
  static const double buttonWidth = 350.0;
  static const double buttonHeight = 50.0;
  static const double buttonPaddingHorizontal = 24.0;
  static const double buttonPaddingVertical = 16.0;
}

class TSpacingStyles {
  TSpacingStyles._();

  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: TUiConstants.appBarheight,
    bottom: TUiConstants.appBarheight,
    left: TUiConstants.marginLarge,
    right: TUiConstants.marginLarge,
  );
}
