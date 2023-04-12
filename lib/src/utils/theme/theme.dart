import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:misafu/src/constants/colors.dart';
import 'package:misafu/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:misafu/src/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:misafu/src/utils/theme/widget_themes/text_field_theme.dart';
import 'package:misafu/src/utils/theme/widget_themes/text_theme.dart';

import '../../constants/color_schemes.g.dart';

class CAppTheme {
  CAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Averta',
    brightness: Brightness.light,
    colorScheme: lightColorScheme,
    // primarySwatch: Colors.blue,
    splashColor: Colors.white,
    textTheme: CTextTheme.lightTextTheme,
    outlinedButtonTheme: COutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: CElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: CTextFormFieldTheme.lightInputDecorationTheme,
    // colorSchemeSeed: const Color(0xFF87ceeb),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Averta',
    brightness: Brightness.dark,
    colorScheme: darkColorScheme,
    // primarySwatch: Colors.blue,
    splashColor: Colors.black,
    textTheme: CTextTheme.darkTextTheme,
    outlinedButtonTheme: COutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: CElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: CTextFormFieldTheme.darkInputDecorationTheme,
    // colorSchemeSeed: const Color(0xFF87ceeb),
  );
}
