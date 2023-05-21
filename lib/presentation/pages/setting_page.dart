import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/domain/entities/common/language.dart';
import 'package:tutor_flutter_app/presentation/controllers/settings_controller.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingPage extends StatelessWidget {
  const SettingPage({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        // Glue the SettingsController to the theme selection DropdownButton.
        //
        // When a user selects a theme from the dropdown list, the
        // SettingsController is updated, which rebuilds the MaterialApp.
        child: Column(
          // THEME
          children: [
            Row(
              children: [
                SizedBox(
                  width: 100,
                  child: TextWidget(label: AppLocalizations.of(context)!.theme),
                ),
                DropdownButton<ThemeMode>(
                  // Read the selected themeMode from the controller
                  value: controller.themeMode,
                  // Call the updateThemeMode method any time the user selects a theme.
                  onChanged: controller.updateThemeMode,
                  items: [
                    DropdownMenuItem(
                      value: ThemeMode.system,
                      child: Text(AppLocalizations.of(context)!.system_theme),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.light,
                      child: Text(AppLocalizations.of(context)!.light_theme),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.dark,
                      child: Text(AppLocalizations.of(context)!.dark_theme),
                    )
                  ],
                ),
              ],
            ),
            // LANGUAGE
            Row(
              children: [
                SizedBox(
                  width: 100,
                  child:
                      TextWidget(label: AppLocalizations.of(context)!.language),
                ),
                DropdownButton<Language>(
                    value: controller.language,
                    onChanged: (value) {
                      controller.updateLanguage(value);
                    },
                    items: List.generate(
                        Language.languages.length,
                        (index) => DropdownMenuItem(
                              value: Language.languages[index],
                              child: Row(
                                children: [
                                  Image.asset(
                                    Language.languages[index].flag,
                                    width: 20,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(Language.languages[index].country),
                                ],
                              ),
                            ))),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 90,
                  child: TextWidget(
                      label: AppLocalizations.of(context)!.auto_speak),
                ),
                Switch(
                    value: controller.isAutoSpeakingEnabled,
                    onChanged: controller.updateAutoSpeakFlag)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
