import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/data/repositories/setting_repository.dart';
import 'package:tutor_flutter_app/domain/entities/common/language.dart';

class SettingsController with ChangeNotifier {
  SettingsController(this._settingsRepository);

  final SettingsRepository _settingsRepository;

  late ThemeMode _themeMode;
  late Language _language;
  late bool _isAutoSpeakEnabled;

  ThemeMode get themeMode => _themeMode;
  Language get language => _language;
  bool get isAutoSpeakingEnabled => _isAutoSpeakEnabled;

  Future<void> loadSettings() async {
    _themeMode = await _settingsRepository.themeMode();
    _language = await _settingsRepository.language();
    _isAutoSpeakEnabled = await _settingsRepository.isAutoSpeakEnabled();

    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null || newThemeMode == _themeMode) return;

    _themeMode = newThemeMode;
    notifyListeners();
    await _settingsRepository.updateThemeMode(newThemeMode);
  }

  Future<void> updateLanguage(Language? newLanguage) async {
    if (newLanguage == null || newLanguage == _language) return;
    _language = newLanguage;
    notifyListeners();

    await _settingsRepository.updateLanguage(newLanguage);
  }

  Future<void> updateAutoSpeakFlag(bool? isAutoSpeakEnabled) async {
    if (isAutoSpeakEnabled == null ||
        isAutoSpeakEnabled == _isAutoSpeakEnabled) {
      return;
    }
    _isAutoSpeakEnabled = isAutoSpeakEnabled;
    notifyListeners();

    await _settingsRepository.updateAutoSpeakFlag(_isAutoSpeakEnabled);
  }
}
