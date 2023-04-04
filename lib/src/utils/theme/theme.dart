import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:misafu/src/constants/colors.dart';
import 'package:misafu/src/utils/theme/widget_themes/text_theme.dart';

class CAppTheme {
  CAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    splashColor: Colors.white,
    textTheme: CTextTheme.lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    splashColor: Colors.black,
    textTheme: CTextTheme.darkTextTheme,
  );
}
