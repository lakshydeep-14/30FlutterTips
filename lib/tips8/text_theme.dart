import 'package:flutter/material.dart';
import 'package:flutter_30_tips/home.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  AppTextStyle._();
  static TextTheme get textTheme => TextTheme(
        headline1: _headline1.copyWith(color: mainColor),
        headline2: _headline2.copyWith(color: mainColor),
        headline3: _headline3.copyWith(color: mainColor),
        headline4: _headline4.copyWith(color: mainColor),
        headline5: _headline5.copyWith(color: mainColor),
      );

  static TextStyle get _baseHeadline => TextStyle(
        fontFamily: GoogleFonts.pacifico().fontFamily,
        color: mainColor,
      );

  static TextStyle get _headline1 => _baseHeadline.copyWith(
        fontSize: 32,
        fontFamily: GoogleFonts.inter().fontFamily,
        fontWeight: FontWeight.w700,
        // letterSpacing: 1.0,
      );
  static TextStyle get _headline2 => _baseHeadline.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get _headline3 => _baseHeadline.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get _headline4 => _baseHeadline.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get _headline5 => _baseHeadline.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      );
}
