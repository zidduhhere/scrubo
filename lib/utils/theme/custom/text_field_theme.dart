import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/theme/custom/texttheme.dart';

class TTextFieldTheme {
  static InputDecorationTheme lightTextFieldTheme = InputDecorationTheme(
    prefixIconColor: TColors.lightOutline,
    iconColor: TColors.lightOutline,
    contentPadding: const EdgeInsets.all(TUiConstants.m),
    hintStyle: TTextTheme.lightTextTheme.labelSmall!
        .copyWith(fontWeight: FontWeight.w500, color: TColors.lightOnSurface),
    floatingLabelStyle: TTextTheme.lightTextTheme.labelMedium!
        .copyWith(fontWeight: FontWeight.w500, color: TColors.lightOnSurface),
    labelStyle: TTextTheme.lightTextTheme.labelSmall!
        .copyWith(fontWeight: FontWeight.w500, color: TColors.lightOnSurface),
    border: OutlineInputBorder(
      borderSide: const BorderSide(
        width: TUiConstants.textFieldBorder,
        color: TColors.lightOutline,
      ),
      borderRadius: BorderRadius.circular(
        TUiConstants.borderRadiusMedium,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(TUiConstants.borderRadiusMedium),
      ),
      borderSide: BorderSide(
        width: TUiConstants.textFieldBorder,
        color: TColors.lightPrimaryColor,
      ),
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(TUiConstants.borderRadiusMedium),
      ),
      borderSide: BorderSide(
        width: TUiConstants.textFieldBorder,
        color: TColors.lightError,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(TUiConstants.borderRadiusMedium),
      ),
      borderSide: BorderSide(
        width: TUiConstants.textFieldBorder,
        color: TColors.lightError,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(TUiConstants.borderRadiusMedium),
      ),
      borderSide: BorderSide(
        width: TUiConstants.textFieldBorder,
        color: TColors.lightSecondary.withOpacity(0.3),
      ),
    ),
  );

  static InputDecorationTheme darkTextFieldTheme = InputDecorationTheme(
    prefixIconColor: TColors.darkOutline,
    iconColor: TColors.darkOutline,
    contentPadding: const EdgeInsets.all(TUiConstants.m),
    hintStyle: TTextTheme.lightTextTheme.labelSmall!
        .copyWith(fontWeight: FontWeight.w500, color: TColors.darkOnSurface),
    floatingLabelStyle: TTextTheme.lightTextTheme.labelMedium!
        .copyWith(fontWeight: FontWeight.w500, color: TColors.darkOnSurface),
    labelStyle: TTextTheme.lightTextTheme.labelSmall!
        .copyWith(fontWeight: FontWeight.w500, color: TColors.darkOnSurface),
    border: OutlineInputBorder(
      borderSide: const BorderSide(
        color: TColors.darkOutline,
      ),
      borderRadius: BorderRadius.circular(
        TUiConstants.borderRadiusMedium,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(TUiConstants.borderRadiusMedium),
      ),
      borderSide: BorderSide(
        color: TColors.darkPrimary,
      ),
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(TUiConstants.borderRadiusMedium),
      ),
      borderSide: BorderSide(
        color: TColors.darkError,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(TUiConstants.borderRadiusMedium),
      ),
      borderSide: BorderSide(
        color: TColors.darkError,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(TUiConstants.borderRadiusMedium),
      ),
      borderSide: BorderSide(
        width: TUiConstants.textFieldBorder,
        color: TColors.darkOutline.withOpacity(0.5),
      ),
    ),
  );
}
