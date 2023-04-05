import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CTextTheme {
  // static TextTheme lightTextTheme = TextTheme(bodyLarge: GoogleFonts.poppins(color: Colors.black, fontSize: 24));
  static TextTheme lightTextTheme = const TextTheme(
    bodySmall:
        TextStyle(fontFamily: 'Averta', color: Colors.black, fontSize: 24),
    bodyMedium:
        TextStyle(fontFamily: 'Averta', color: Colors.black, fontSize: 27),
    bodyLarge:
        TextStyle(fontFamily: 'Averta', color: Colors.black, fontSize: 30),
    titleSmall:
        TextStyle(fontFamily: 'Averta', color: Colors.black),
  );
  static TextTheme darkTextTheme = const TextTheme(
    bodySmall:
        TextStyle(fontFamily: 'Averta', color: Colors.white, fontSize: 24),
    bodyMedium:
        TextStyle(fontFamily: 'Averta', color: Colors.white, fontSize: 27),
    bodyLarge:
        TextStyle(fontFamily: 'Averta', color: Colors.white, fontSize: 30),
  );
}
