import 'package:flutter/material.dart';

class AppTheme {
  static const color1 = Color(0xff11475A);
  static const color2 = Color(0xff006D79);
  static const color3 = Color(0xff009488);
  static const color4 = Color(0xff4CBA85);
  static const color5 = Color(0xff9EDC79);
  static const color6 = Color(0xffF9F871);

  // static const secondaryColor = Color(0xff4CBA85);

  static ThemeData get light => ThemeData(
      primaryColor: color1,
      primaryColorDark: color2,
      primaryColorLight: color5,
      fontFamily: "Outfit-Medium",
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: color1),
      textTheme: const TextTheme(
        headline2:
            TextStyle(fontFamily: "Outfit-Bold", fontSize: 26, color: color1),
        subtitle1:
            TextStyle(fontFamily: "Outfit-Medium", fontSize: 16, color: color1),
        labelMedium:
            TextStyle(fontFamily: "Outfit-Bold", fontSize: 16, color: color1),
      ),
      appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: color1),
          titleTextStyle: TextStyle(
              fontFamily: "Outfit-Black", fontSize: 24, color: color1)),
      iconTheme: const IconThemeData(color: color1),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: color1,

      ));
}
