import 'package:flutter/material.dart';

class AppGlobals {
  AppGlobals._();

  static final navigatorKey = GlobalKey<NavigatorState>();
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  ///   Localization
  static final arLangCode = 'ar';
  static final arCountryCode = 'SA';
  static final arabicLocale = Locale(AppGlobals.arLangCode, AppGlobals.arCountryCode);
}
