import 'package:flutter/material.dart';

//App Font
class AppFonts {
  static const String quicksandBold = 'Quicksand-Bold';
  static const String quicksandLight = 'Quicksand-Light';
  static const String quicksandMedium = 'Quicksand-Medium';
  static const String quicksandRegular = 'Quicksand-Regular';
  static const String quicksandSemiBold = 'Quicksand-SemiBold';

  static TextStyle quicksand900(double fontSize, Color color) => TextStyle(
        fontFamily: quicksandBold,
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w900,
      );
  static TextStyle quicksand700(double fontSize, Color color) => TextStyle(
        fontFamily: quicksandBold,
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w700,
      );
  static TextStyle quicksandMedium500(double fontSize, Color color) =>
      TextStyle(
        fontFamily: quicksandMedium,
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w500,
      );
  static TextStyle quicksand600(double fontSize, Color color) => TextStyle(
        fontFamily: quicksandBold,
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w600,
      );
  static TextStyle quicksandSemi600(double fontSize, Color color) => TextStyle(
        fontFamily: quicksandSemiBold,
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w600,
      );

  //FontWeight 400
  static TextStyle light([double fontSize = 14, Color color = Colors.black]) =>
      TextStyle(
        fontFamily: 'Lato',
        fontWeight: FontWeight.w400,
        fontSize: fontSize,
        color: color,
      );

  //FontWeight 500
  static TextStyle regular(
          [double fontSize = 14, Color color = Colors.black]) =>
      TextStyle(
        fontFamily: 'Lato',
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
        color: color,
      );

  //FontWeight 600
  static TextStyle normalBold(
          [double fontSize = 14, Color color = Colors.black]) =>
      TextStyle(
        fontFamily: 'Lato',
        fontWeight: FontWeight.w600,
        fontSize: fontSize,
        color: color,
      );

  //FontWeight 700
  static TextStyle bold([double fontSize = 14, Color color = Colors.black]) =>
      TextStyle(
        fontFamily: 'Lato',
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
        color: color,
      );

  //FontWeight 800
  static TextStyle ultraBold(
          [double fontSize = 14, Color color = Colors.black]) =>
      TextStyle(
        fontFamily: 'Lato',
        fontWeight: FontWeight.w800,
        fontSize: fontSize,
        color: color,
      );

  //Inter
  //FontWeight 400
  static TextStyle lightInter(
          [double fontSize = 14, Color color = Colors.black]) =>
      TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: fontSize,
        color: color,
      );

  //Fontweight 500
  static TextStyle regularInter(
          [double fontSize = 14, Color color = Colors.black]) =>
      TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
        color: color,
      );

  //FontWeight 600
  static TextStyle normalBoldInter(
          [double fontSize = 14, Color color = Colors.black]) =>
      TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        fontSize: fontSize,
        color: color,
      );

  //FontWeight 700
  static TextStyle boldInter(
          [double fontSize = 14, Color color = Colors.black]) =>
      TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
        color: color,
      );

  static const String laTo = 'Lato';
}
