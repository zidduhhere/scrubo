import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class TAppBarTheme {
  TAppBarTheme._();
  static AppBarTheme lightAppbarTheme = const AppBarTheme(
    centerTitle: true,
    actionsIconTheme: IconThemeData(color: TColors.lightOutline),
    // titleTextStyle: TTextTheme.lightTextTheme.headlineSmall,
    backgroundColor: TColors.lightSurface,
    elevation: 0,
    toolbarHeight: TUiConstants.appBarheight,
    titleSpacing: 1.0,
  );

  static AppBarTheme darkAppbarTheme = const AppBarTheme(
    centerTitle: true,
    actionsIconTheme: IconThemeData(color: TColors.darkOutline),
    backgroundColor: TColors.darkSurface,
    elevation: 0,
    toolbarHeight: TUiConstants.appBarheight,
    titleSpacing: 1.0,
  );
}
