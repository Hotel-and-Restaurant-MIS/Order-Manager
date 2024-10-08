import 'package:flutter/material.dart';

class TextConstants {
  static TextStyle kMainTextStyle(
      {double? fontSize,
      String? fontFamily,
      FontWeight? fontWeight,
      Color? textColour}) {
    return TextStyle(
      fontSize: fontSize ?? 25.0,
      fontWeight: fontWeight ?? FontWeight.w600,
      fontFamily: fontFamily ?? 'Barlow',
      color: textColour?? Colors.white,
    );
  }

  static TextStyle kSubTextStyle(
      {double? fontSize,
      String? fontFamily,
      FontWeight? fontWeight,
      Color? textColour}) {
    return TextStyle(
      fontSize: fontSize ?? 20.0,
      fontWeight: fontWeight ?? FontWeight.w400,
      fontFamily: fontFamily ?? 'Barlow',
      color: textColour?? Colors.white,
    );
  }

}
