import 'package:flutter/material.dart';
import 'package:quran/core/theme/app_colors.dart';

import 'font_manager.dart';

class TextStyleManager {
  TextStyleManager._();

  static TextStyle _base({
    required FontWeight fontWeight,
    double? size,
    Color? color,
    TextDecoration? textDecoration,
    Color? decorationColor,
    double? height,
  }) =>
      TextStyle(
        fontFamily: FontConstants.fontFamily,
        fontWeight: fontWeight,
        fontSize: size ?? FontSize.s14,
        decoration: textDecoration ?? TextDecoration.none,
        color: color ?? AppColors.blue21353e,
        decorationColor: decorationColor,
        height: height ?? 1.2,
      );

  static TextStyle regular({
    double? fontSize,
    Color? color,
    TextDecoration? textDecoration,
    Color? decorationColor,
    double? height,
  }) =>
      _base(
        fontWeight: FontWeight.w400,
        size: fontSize,
        color: color,
        textDecoration: textDecoration,
        decorationColor: decorationColor,
        height: height,
      );

  static TextStyle medium({
    double? fontSize,
    Color? color,
    TextDecoration? textDecoration,
    Color? decorationColor,
    double? height,
  }) =>
      _base(
        fontWeight: FontWeight.w500,
        size: fontSize,
        color: color,
        textDecoration: textDecoration,
        decorationColor: decorationColor,
        height: height,
      );

  static TextStyle semiBold({
    double? fontSize,
    Color? color,
    TextDecoration? textDecoration,
    Color? decorationColor,
    double? height,
  }) =>
      _base(
        fontWeight: FontWeight.w600,
        size: fontSize,
        color: color,
        textDecoration: textDecoration,
        decorationColor: decorationColor,
        height: height,
      );

  static TextStyle bold({
    double? fontSize,
    Color? color,
    TextDecoration? textDecoration,
    Color? decorationColor,
    double? height,
  }) =>
      _base(
        fontWeight: FontWeight.w700,
        size: fontSize,
        color: color,
        textDecoration: textDecoration,
        decorationColor: decorationColor,
        height: height,
      );
}
