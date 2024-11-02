import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: TUiConstants.headlineLarge,
      color: TColors.lightOnSurface,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: TUiConstants.headlineMedium,
      color: TColors.lightOnSurface,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: TUiConstants.headlineSmall,
      color: TColors.lightOnSurface,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeExtraLarge,
      color: TColors.lightOnSurface,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeLarge,
      color: TColors.lightOnSurface,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeMediumLarge,
      color: TColors.lightOnSurface,
      fontWeight: FontWeight.w300,
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeMedium,
      color: TColors.lightOnSurface,
      fontWeight: FontWeight.w300,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeSmall,
      color: TColors.lightPrimaryColor,
      fontWeight: FontWeight.w500,
      letterSpacing: .5,
    ),
    labelSmall: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeVerySmall,
      color: TColors.lightPrimaryColor,
      letterSpacing: .5,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeMedium,
      color: TColors.lightOnSurface,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeSmall,
      fontWeight: FontWeight.w500,
      color: TColors.lightSecondary,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeVerySmall,
      color: TColors.lightOnSurface,
      fontWeight: FontWeight.w300,
    ),
    displayLarge: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeExtraLarge,
      color: TColors.lightOnSurface,
      fontWeight: FontWeight.w300,
    ),
    displayMedium: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeLarge,
      color: TColors.lightOnSurface,
    ),
    displaySmall: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeMedium,
      color: TColors.lightOnSurface,
      fontWeight: FontWeight.w300,
    ),
  );

  //Dark Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: TUiConstants.headlineLarge,
      color: TColors.darkOnSurface,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: TUiConstants.headlineMedium,
      color: TColors.darkOnSurface,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: TUiConstants.headlineSmall,
      color: TColors.darkOnSurface,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeExtraLarge,
      color: TColors.darkOnSurface,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeLarge,
      color: TColors.darkOnSurface,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeMediumLarge,
      color: TColors.darkOnSurface,
      fontWeight: FontWeight.w300,
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeMedium,
      color: TColors.darkOnSurface,
      fontWeight: FontWeight.w300,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeSmall,
      color: TColors.darkPrimary,
      fontWeight: FontWeight.w500,
      letterSpacing: .5,
    ),
    labelSmall: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeVerySmall,
      color: TColors.darkPrimary,
      letterSpacing: .5,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeMedium,
      color: TColors.darkOnSurface,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeSmall,
      color: TColors.darkOnSurface,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeVerySmall,
      color: TColors.darkOnSurface,
      fontWeight: FontWeight.w300,
    ),
    displayLarge: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeExtraLarge,
      color: TColors.darkOnSurface,
      fontWeight: FontWeight.w300,
    ),
    displayMedium: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeLarge,
      color: TColors.darkOnSurface,
    ),
    displaySmall: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeMedium,
      color: TColors.darkOnSurface,
      fontWeight: FontWeight.w300,
    ),
  );
}
