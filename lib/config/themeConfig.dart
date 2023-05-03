import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/utils.dart';

class ThemeConfig {
  static Color primaryColor = const Color(0xFF272944);
  static Color secondColor = Colors.green;
  static Color backgroundColor = const Color(0xff1B1103);
  static Color background2 = const Color(0xfff9fafd);
  static Color thirdColor = const Color(0xFFA7D676);
  static Color fourthColor = const Color(0xFFFE7235);
  static Color greenColor = Colors.green;
  static Color redColor = Colors.red;
  static Color textColor = const Color(0xFF444d5b);
  static Color whiteColor = Colors.white;
  static Color greyColor = Colors.grey;
  static Color greyColor2 = textColor;
  static Color blackColor = Colors.black;
  static Color buttonPrimary = Colors.blueAccent;
  static Color hoverColor = const Color(0xffe4e6ea);
  static Color successColor = const Color(0xFFaaf683);
  static Color errorColor = const Color(0xFFee6055);
  static Color warningColor = const Color(0xFFffd97d);
  static EdgeInsets contentPadding =
      EdgeInsets.symmetric(vertical: getSize(10), horizontal: getSize(10));

  static double get rateSize => 1.1;
  static double get headerSize => getSize(25 * rateSize);
  static double get headerLargeSize => getSize(30 * rateSize);
  static double get borderRadius => getSize(10 * rateSize);
  static double get borderRadiusMax => getSize(50 * rateSize);

  static double get defaultSize => getSize(14 * rateSize);
  static double get labelSize => getSize(12 * rateSize);
  static double get smallSize => getSize(13 * rateSize);
  static double get titleSize => getSize(20 * rateSize);
  static double get iconSize => getSize(30 * rateSize);

  static String fontFamily = 'Roboto';
  static double defaultHorPadding = getSize(10);
  static double defaultPadding = getSize(20);
  static double defaultVerPadding = getSize(20);
  static double lineHigh = 1.5;

  static TextStyle defaultStyle = GoogleFonts.tinos(
      textStyle: TextStyle(
          fontSize: ThemeConfig.defaultSize,
          color: ThemeConfig.textColor,
          height: 1.5));
  static TextStyle titleStyle = GoogleFonts.tinos(
      textStyle: TextStyle(
          fontSize: ThemeConfig.titleSize,
          color: ThemeConfig.textColor,
          height: 1.5));

  static TextStyle headerStyle = GoogleFonts.tinos(
      textStyle: TextStyle(
          fontSize: ThemeConfig.headerSize,
          color: ThemeConfig.textColor,
          height: 1.5));

  static TextStyle smallStyle = GoogleFonts.tinos(
      textStyle: TextStyle(
          fontSize: ThemeConfig.smallSize,
          color: ThemeConfig.textColor,
          height: 1.5));

  static TextStyle labelStyle = GoogleFonts.tinos(
      textStyle: TextStyle(
          fontSize: ThemeConfig.labelSize,
          color: ThemeConfig.textColor,
          height: 1.5));
}
