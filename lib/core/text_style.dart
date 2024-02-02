import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getTitleStyle({
  double fontSize = 25,
  FontWeight fontWeight = FontWeight.bold,
  Color color = Colors.black,
}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: GoogleFonts.cairo().fontFamily);
}

TextStyle getBodyStyle(
    {double fontSize = 20,
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.grey}) {
  return TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
}

TextStyle getSmallStyle(
    {double fontSize = 15,
    FontWeight fontWeight = FontWeight.w300,
    Color color = Colors.black}) {
  return TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
}
