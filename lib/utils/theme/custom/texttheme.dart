import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: TUiConstants.headlineLarge,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: TUiConstants.headlineMedium,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: TUiConstants.headlineSmall,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeExtraLarge,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeLarge,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeMediumLarge,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeMedium,
      color: Colors.black,
      fontWeight: FontWeight.w300,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeSmall,
      color: Colors.black,
      fontWeight: FontWeight.w300,
    ),
    labelSmall: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeVerySmall,
      color: Colors.black,
      fontWeight: FontWeight.w300,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeMedium,
      color: Colors.black,
      fontWeight: FontWeight.w300,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeSmall,
      color: Colors.black,
      fontWeight: FontWeight.w300,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeVerySmall,
      color: Colors.black,
      fontWeight: FontWeight.w300,
    ),
  );

  //Dark Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: TUiConstants.headlineLarge,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: TUiConstants.headlineMedium,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: TUiConstants.headlineSmall,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeExtraLarge,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeLarge,
      color: Colors.white,
      fontWeight: FontWeight.w300,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeMediumLarge,
      color: Colors.white,
      fontWeight: FontWeight.w300,
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeMedium,
      color: Colors.white,
      fontWeight: FontWeight.w300,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeSmall,
      color: Colors.white,
      fontWeight: FontWeight.w300,
    ),
    labelSmall: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeVerySmall,
      color: Colors.white,
      fontWeight: FontWeight.w300,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeMedium,
      color: Colors.white,
      fontWeight: FontWeight.w300,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeSmall,
      color: Colors.white,
      fontWeight: FontWeight.w300,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: TUiConstants.fontSizeVerySmall,
      color: Colors.white,
      fontWeight: FontWeight.w300,
    ),
  );
}
