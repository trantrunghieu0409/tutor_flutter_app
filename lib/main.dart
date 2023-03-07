import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/features/login/presentation/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tutor_flutter_app/features/tutorList/presentation/pages/TutorListPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LetTutor',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: const TutorListPage(),
    );
  }
}
