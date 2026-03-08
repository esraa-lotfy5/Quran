import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quran/core/constants/app_globals.dart';

class LocalizationUtil {
  static late Locale locale;

  LocalizationUtil._();

  static void init() {
    setLocale();
  }

  static void setLocale() {
    locale = AppGlobals.arabicLocale;
  }

  static const String path = 'assets/translations';
  static List<Locale> supportedLocales = [AppGlobals.arabicLocale];
}
