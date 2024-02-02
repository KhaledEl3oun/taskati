import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskati/core/app_color.dart';
import 'package:taskati/core/text_style.dart';

var lightTheme = ThemeData(
    fontFamily: GoogleFonts.cairo().fontFamily,
    appBarTheme: AppBarTheme(
        backgroundColor: appColors.primaryColor,
        centerTitle: true,
        titleTextStyle: getTitleStyle(
            color: appColors.whiteColor, fontWeight: FontWeight.w700)));
