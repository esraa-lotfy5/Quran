import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/confige_app.dart';
import 'package:quran/core/constants/app_globals.dart';
import 'package:quran/core/routes/app_routes.dart';
import 'package:quran/core/utils/localization_util.dart';

void main() async {
  // Initialize app configuration
  await ConfigApp.init();

  runApp(
    EasyLocalization(
      supportedLocales: LocalizationUtil.supportedLocales,
      path: LocalizationUtil.path,
      fallbackLocale: LocalizationUtil.supportedLocales.first,
      child: const ProviderScope(child: MyApp()),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // Set your desired locale
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.setLocale(AppGlobals.arabicLocale);
    });

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, __) => MaterialApp.router(
        title: 'Quran',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routerConfig: AppRoutes.routes,
        scaffoldMessengerKey: AppGlobals.scaffoldMessengerKey,
      ),
    );
  }
}
