import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class CElevatedButtonTheme {
  CElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        foregroundColor: cWhiteColor,
        backgroundColor: cSecondaryColor,
        side: BorderSide(color: cSecondaryColor),
        padding: EdgeInsets.symmetric(vertical: 15)
    ),
  );
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        foregroundColor: cSecondaryColor,
        backgroundColor: cWhiteColor,
        side: BorderSide(color: cWhiteColor),
        padding: EdgeInsets.symmetric(vertical: 15)
    ),
  );

}