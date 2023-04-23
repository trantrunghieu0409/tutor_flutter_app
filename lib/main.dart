import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:tutor_flutter_app/core/injection/injector_config.dart';
import 'package:tutor_flutter_app/presentation/pages/splash_page.dart';
import 'package:tutor_flutter_app/routes.dart';

void main() {
  InjectorConfig.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'LetTutor',

        // Providing a restorationScopeId allows the Navigator built by the
        // MaterialApp to restore the navigation stack when a user leaves and
        // returns to the app after it has been killed while running in the
        // background.
        restorationScopeId: 'lettutor',

        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          primarySwatch: Colors.blue,
        ),
        home: const SplashPage(),
        routes: routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
