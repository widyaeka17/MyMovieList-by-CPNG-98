import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// text style
final TextStyle heading5 =
    GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w400);
final TextStyle heading6 = GoogleFonts.poppins(
    fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15);
final TextStyle subtitle = GoogleFonts.poppins(
    fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15);
final TextStyle bodyText =
    GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w400);
final TextStyle ratingText =
    GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w700);

// text theme
final movieTextTheme = TextTheme(
  headline5: heading5,
  headline6: heading6,
  subtitle1: subtitle,
  bodyText2: bodyText,
);
