import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/theme/custom/appbar_theme.dart';
import 'package:scrubo/utils/theme/custom/elevated_buttom_theme.dart';
import 'package:scrubo/utils/theme/custom/iconbutton_theme.dart';
import 'package:scrubo/utils/theme/custom/outlined_button_theme.dart';
import 'package:scrubo/utils/theme/custom/text_field_theme.dart';
import 'package:scrubo/utils/theme/custom/texttheme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
      primarySwatch: Colors.blue,
      useMaterial3: true,

      ///Button Themes
      ///
      ///
      ///
      ///
      ///
      elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
      iconButtonTheme: TIconButtonTheme.lightIconButtonTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,

      ///
      ///
      ///
      ///
      ///
      ///
      fontFamily: 'Poppins',
      iconTheme: const IconThemeData(color: TColors.lightOutline),
      inputDecorationTheme: TTextFieldTheme.lightTextFieldTheme,
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TTextTheme.lightTextTheme,
      appBarTheme: TAppBarTheme.lightAppbarTheme,

      ///
      ///
      ///
      ///
      ///
      ///
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF0061A3),
        surfaceTint: Color(0xFF0061A3),
        onPrimary: Color(0xFFFFFFFF),
        primaryContainer: Color(0xFFD1E4FF),
        onPrimaryContainer: Color(0xFFFFFFFF),
        secondary: Color(0xFF535F70),
        onSecondary: Color(0xFFFFFFFF),
        secondaryContainer: Color(0xFFD7E3F7),
        onSecondaryContainer: Color(0xFF101C2B),
        tertiary: Color(0xFF006C48),
        onTertiary: Color(0xFFFFFFFF),
        tertiaryContainer: Color(0xFF8EF7C4),
        onTertiaryContainer: Color(0xFF002112),
        error: Color(0xFFBA1A1A),
        onError: Color(0xFFFFFFFF),
        errorContainer: Color(0xFFFFDAD6),
        onErrorContainer: Color(0xFF410002),
        surface: Color(0xFFFCFCFF),
        onSurface: Color(0xFF1A1C1E),
        onSurfaceVariant: Color(0xFF42474E),
        outline: Color(0xFF73777F),
        outlineVariant: Color(0xFFC3C7CF),
        shadow: Color(0xFF000000),
        scrim: Color(0xFF000000),
        inverseSurface: Color(0xFF2F3033),
        inversePrimary: Color(0xFF9ECAFF),
        primaryFixed: Color(0xFFD1E4FF),
        onPrimaryFixed: Color(0xFF00325B),
        primaryFixedDim: Color(0xFF9ECAFF),
        onPrimaryFixedVariant: Color(0xFF004880),
        secondaryFixed: Color(0xFFD7E3F7),
        onSecondaryFixed: Color(0xFF101C2B),
        secondaryFixedDim: Color(0xFFBAC8DB),
        onSecondaryFixedVariant: Color(0xFF3B4858),
        tertiaryFixed: Color(0xFF8EF7C4),
        onTertiaryFixed: Color(0xFF00391F),
        tertiaryFixedDim: Color(0xFF72DAA9),
        onTertiaryFixedVariant: Color(0xFF005235),
        surfaceDim: Color(0xFFDCDEE3),
        surfaceBright: Color(0xFFFCFCFF),
        surfaceContainerLowest: Color(0xFFFFFFFF),
        surfaceContainerLow: Color(0xFFF6F6F9),
        surfaceContainer: Color(0xFFF0F0F4),
        surfaceContainerHigh: Color(0xFFEAEBEF),
        surfaceContainerHighest: Color(0xFFE4E5E9),
      ));
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      useMaterial3: true,
      fontFamily: 'Poppins',
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TTextTheme.darkTextTheme,
      iconTheme: const IconThemeData(color: TColors.darkOutline),
      appBarTheme: TAppBarTheme.darkAppbarTheme,

      ///Button Themes
      elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
      iconButtonTheme: TIconButtonTheme.darkIconButtonTheme,
      inputDecorationTheme: TTextFieldTheme.darkTextFieldTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,

      ///
      ///
      ///
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFF9ECAFF),
        surfaceTint: Color(0xFF9ECAFF),
        onPrimary: Color(0xFF003258),
        primaryContainer: Color(0xFF00497D),
        onPrimaryContainer: Color(0xFFFFFFFF),
        secondary: Color(0xFFFFFFFF),
        onSecondary: Color(0xFF253140),
        secondaryContainer: Color(0xFFFFFFFF),
        onSecondaryContainer: Color(0xFF2A3545),
        tertiary: Color(0xFF72DAA9),
        onTertiary: Color(0xFF003920),
        tertiaryContainer: Color(0xFF005235),
        onTertiaryContainer: Color(0xFFFFFFFF),
        error: Color(0xFFFFB4AB),
        onError: Color(0xFF690005),
        errorContainer: Color(0xFF93000A),
        onErrorContainer: Color(0xFFFFDAD6),
        surface: Color(0xFF1A1C1E),
        onSurface: Color(0xFFE2E2E5),
        onSurfaceVariant: Color(0xFFC3C7CF),
        outline: Color(0xFF8C9199),
        outlineVariant: Color(0xFF42474E),
        shadow: Color(0xFF000000),
        scrim: Color(0xFF000000),
        inverseSurface: Color(0xFFE2E2E5),
        inversePrimary: Color(0xFF0061A3),
        primaryFixed: Color(0xFFD1E4FF),
        onPrimaryFixed: Color(0xFF00325B),
        primaryFixedDim: Color(0xFF9ECAFF),
        onPrimaryFixedVariant: Color(0xFF004880),
        secondaryFixed: Color(0xFFD7E3F7),
        onSecondaryFixed: Color(0xFF101C2B),
        secondaryFixedDim: Color(0xFFBAC8DB),
        onSecondaryFixedVariant: Color(0xFF3B4858),
        tertiaryFixed: Color(0xFF8EF7C4),
        onTertiaryFixed: Color(0xFF00391F),
        tertiaryFixedDim: Color(0xFF72DAA9),
        onTertiaryFixedVariant: Color(0xFF005235),
        surfaceDim: Color(0xFF1A1C1E),
        surfaceBright: Color(0xFF35373A),
        surfaceContainerLowest: Color(0xFF0D0E11),
        surfaceContainerLow: Color(0xFF1A1C1E),
        surfaceContainer: Color(0xFF1F2123),
        surfaceContainerHigh: Color(0xFF292B2D),
        surfaceContainerHighest: Color(0xFF34363A),
      ));
}
