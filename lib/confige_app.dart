import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/utils/localization_util.dart';

abstract class ConfigApp {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    ///    Easy localization
    await EasyLocalization.ensureInitialized();

    ///     LocalizationUtil
    LocalizationUtil.init();
  }
}
