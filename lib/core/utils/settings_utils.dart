import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/injection/injector.dart';
import 'package:tutor_flutter_app/presentation/controllers/settings_controller.dart';

class SettingUtils {
  static getTheme() {
    return Injector.resolve<SettingsController>().themeMode;
  }

  static bool get isLightTheme => getTheme() == ThemeMode.light;
  static bool get isDarkTheme => getTheme() == ThemeMode.dark;
}
