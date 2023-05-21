import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/data/datasources/local/settings_local_datasource.dart';
import 'package:tutor_flutter_app/domain/entities/common/language.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class SettingsRepository {
  final SettingLocalDatasource settingsLocalDatasource;

  SettingsRepository({required this.settingsLocalDatasource});

  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<ThemeMode> themeMode() async => settingsLocalDatasource.getThemeMode();
  Future<Language> language() async => settingsLocalDatasource.getLanguage();
  Future<bool> isAutoSpeakEnabled() async =>
      settingsLocalDatasource.getAutoSpeakFlag();

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode theme) async {
    await settingsLocalDatasource.persistThemeMode(theme);
  }

  Future<void> updateLanguage(Language language) async {
    await settingsLocalDatasource.persistLanguage(language);
  }

  Future<void> updateAutoSpeakFlag(bool isAutoSpeakEnabled) async {
    await settingsLocalDatasource.persistAutoSpeakFlag(isAutoSpeakEnabled);
  }
}
