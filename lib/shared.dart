import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double whiteSpace = 20;

TextStyle whiteTextStyle = GoogleFonts.lato(
  color: Colors.white,
);

TextStyle blackTextStyle = GoogleFonts.lato(
  color: Colors.black,
);

TextStyle greyTextStyle = GoogleFonts.lato(
  color: Colors.grey,
);

FontWeight thick = FontWeight.w200;
FontWeight normal = FontWeight.w400;
FontWeight semiBold = FontWeight.w700;
FontWeight bold = FontWeight.w900;

Color backgroundColor = const Color(0xFF000B06);
Color mainColor = const Color(0xFF07582C);
Color greyColor = const Color(0xFF54655F);
Color secondColor = const Color(0xFF206647);
Color ayatColor = const Color(0xFF378E67);
Color ayatBgColor = const Color(0xFF5DAD8F);
Color thirdColor = const Color(0xFF9BB6AB);

ThemeData lightTheme = ThemeData(
  primaryColor: backgroundColor,
  scaffoldBackgroundColor: backgroundColor,
  appBarTheme: AppBarTheme(
    backgroundColor: backgroundColor,
  ),
);
