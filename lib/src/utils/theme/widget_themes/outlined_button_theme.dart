import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class COutlinedButtonTheme {
  COutlinedButtonTheme._();
  
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        foregroundColor: cSecondaryColor,
        side: BorderSide(color: cSecondaryColor),
        padding: EdgeInsets.symmetric(vertical: 15)
    ),
  );
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        foregroundColor: cWhiteColor,
        side: BorderSide(color: cWhiteColor),
        padding: EdgeInsets.symmetric(vertical: 15)
    ),
  );

}