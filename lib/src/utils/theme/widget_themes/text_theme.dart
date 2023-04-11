import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CTextTheme {
  // static TextTheme lightTextTheme = TextTheme(bodyLarge: GoogleFonts.poppins(color: Colors.black, fontSize: 24));
  static TextTheme lightTextTheme = const TextTheme(
    headlineSmall:
        TextStyle(fontWeight: FontWeight.bold),
    // bodySmall:
    //     TextStyle(fontFamily: 'Averta', color: Colors.black),
    // bodyMedium:
    //     TextStyle(fontFamily: 'Averta', color: Colors.black),
    // bodyLarge:
    //     TextStyle(fontFamily: 'Averta', color: Colors.black),
    // titleSmall:
    //     TextStyle(fontFamily: 'Averta', color: Colors.black),
    // labelLarge:
    //     TextStyle(fontFamily: 'Averta', color: Colors.black),
  );
  static TextTheme darkTextTheme = const TextTheme(
    headlineSmall:
        TextStyle(fontWeight: FontWeight.bold),
    // bodySmall:
    //     TextStyle(fontFamily: 'Averta', color: Colors.white),
    // bodyMedium:
    //     TextStyle(fontFamily: 'Averta', color: Colors.white),
    // bodyLarge:
    //     TextStyle(fontFamily: 'Averta', color: Colors.white),
    // titleSmall:
    //     TextStyle(fontFamily: 'Averta', color: Colors.black),
    // labelLarge:
    //     TextStyle(fontFamily: 'Averta', color: Colors.black),
  );
}
