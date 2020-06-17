import 'package:flutter/material.dart';

final ThemeData themeData = new ThemeData(
  primarySwatch: const MaterialColor(0xFF141E30, AppColors.color),
  primaryColor: const Color(0xFF141E30),
  accentColor: const Color(0xFF243B55),
  errorColor: const Color(0xFFAF6566),
  backgroundColor: const Color(0xFFFFFFFF),
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  fontFamily: 'OpenSans',
  textTheme: TextTheme(
    headline1: TextStyle(fontFamily: "Montserrat"),
    headline2: TextStyle(fontFamily: "Montserrat"),
    headline3: TextStyle(fontFamily: "Montserrat"),
    headline4: TextStyle(fontFamily: "Montserrat"),
    headline5: TextStyle(
      fontFamily: "Montserrat",
      color: const Color(0xFF141E30),
    ),
    headline6: TextStyle(
      fontFamily: "Montserrat",
      color: const Color(0xFF141E30),
    ),
    bodyText1: TextStyle(
      color: const Color(0xFF141E30),
    ),
    bodyText2: TextStyle(
      color: const Color(0xFF141E30),
    ),
  ),
);

class AppColors {
  AppColors._(); // this basically makes it so you can instantiate this class
  static const Map<int, Color> color = const <int, Color>{
    50: const Color(0x1A141E30),
    100: const Color(0x33141E30),
    200: const Color(0x4D141E30),
    300: const Color(0x66141E30),
    400: const Color(0x80141E30),
    500: const Color(0x99141E30),
    600: const Color(0xB3141E30),
    700: const Color(0xCC141E30),
    800: const Color(0xE6141E30),
    900: const Color(0xFF141E30)
  };

  static const Color greyBackground = Color(0xFFF9F9F9);
  static const Color greyLight = const Color(0xFFDCDCDC);
  static const Color greyMedium = const Color(0xFFBBBBBB);
  static const Color greyDark = const Color(0xFF707070);

  static const Color ideaColor = const Color(0xFFFFD31D);
  static const Color issueColor = const Color(0xFFF79071);

  static const Color premiumFirstColor = const Color(0xFFFEC107);
  static const Color premiumSecondColor = const Color(0xFFDEA807);
}
