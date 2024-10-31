import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/colors.dart';

class TIconButtonTheme {
  TIconButtonTheme._();
  static IconButtonThemeData lightIconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      backgroundColor: TColors.lightPrimaryColor,
      foregroundColor: TColors.lightOnPrimary,
      disabledBackgroundColor: TColors.lightSecondaryContainer,
      disabledForegroundColor: TColors.lightOnSecondaryContainer,
      fixedSize: const Size(64, 64),
      elevation: 0,
    ),
  );

  static IconButtonThemeData darkIconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      backgroundColor: TColors.darkPrimary,
      foregroundColor: TColors.darkOnPrimary,
      disabledBackgroundColor: TColors.darkSecondaryContainer,
      disabledForegroundColor: TColors.darkOnSecondaryContainer,
      fixedSize: const Size(64, 64),
      elevation: 0,
    ),
  );
}
