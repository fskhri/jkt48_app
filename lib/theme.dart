import 'package:flutter/material.dart';

class JKT48Theme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Color(0xFFE41E63), // JKT48 Pink
    colorScheme: ColorScheme.light(
      primary: Color(0xFFE41E63), // JKT48 Pink
      secondary: Color(0xFF4CAF50), // Green
    ),
    // Add more theme configurations as needed
  );

  static ThemeData darkTheme = ThemeData(
    // Konfigurasi properti tema dark
    primarySwatch: Colors.indigo,
    // ...
  );
}
