import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:tutor_flutter_app/core/config/env.dart';
import 'package:tutor_flutter_app/core/injection/injector.dart';
import 'package:tutor_flutter_app/core/injection/injector_config.dart';
import 'package:tutor_flutter_app/presentation/controllers/settings_controller.dart';
import 'package:tutor_flutter_app/presentation/pages/splash_page.dart';
import 'package:tutor_flutter_app/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  // Get the env from argument ENVIRONMENT
  const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: Environment.DEV,
  );
  Environment().initConfig(environment);

  // Set up Injectors
  WidgetsFlutterBinding.ensureInitialized();
  InjectorConfig.setup();

  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = Injector.resolve<SettingsController>();

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final SettingsController settingController =
      Injector.resolve<SettingsController>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: AnimatedBuilder(
          animation: settingController,
          builder: (BuildContext context, Widget? child) {
            return MaterialApp(
              title: 'LetTutor',

              // Providing a restorationScopeId allows the Navigator built by the
              // MaterialApp to restore the navigation stack when a user leaves and
              // returns to the app after it has been killed while running in the
              // background.
              restorationScopeId: 'lettutor',

              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],

              supportedLocales: const [
                Locale('en', ''), // English, no country code
                Locale('vi', '')
              ],

              locale: Locale(settingController.language.locale, ''),

              theme: ThemeData(textTheme: GoogleFonts.openSansTextTheme()),
              darkTheme: ThemeData.dark(),
              themeMode: settingController.themeMode,

              debugShowCheckedModeBanner: false,

              home: const SplashPage(),
              routes: routes,
            );
          }),
    );
  }
}
