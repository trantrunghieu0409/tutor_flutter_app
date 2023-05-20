import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutor_flutter_app/domain/entities/common/language.dart';

class SettingLocalDatasource {
  final String _themeKey = 'theme_mode';
  final String _languageKey = 'language_country';
  final String _autoSpeekFlagKey = 'is_auto_speak_enabled';

  Future<ThemeMode> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    String? theme = prefs.getString(_themeKey);

    return ThemeMode.values.firstWhere((element) => element.toString() == theme,
        orElse: () => ThemeMode.light);
  }

  Future<void> persistThemeMode(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, themeMode.toString());
  }

  Future<Language> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    String? country = prefs.getString(_languageKey);

    return Language.languages.firstWhere(
        (element) => element.country == country,
        orElse: () => Language.english);
  }

  Future<void> persistLanguage(Language language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, language.country);
  }

  Future<bool> getAutoSpeakFlag() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_autoSpeekFlagKey) ?? true;
  }

  Future<void> persistAutoSpeakFlag(bool isAutoSpeakEnabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_autoSpeekFlagKey, isAutoSpeakEnabled);
  }
}
