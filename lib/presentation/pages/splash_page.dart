import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/injection/injector.dart';
import 'package:tutor_flutter_app/presentation/pages/login_page.dart';
import 'package:tutor_flutter_app/presentation/pages/tutors_page.dart';
import 'package:tutor_flutter_app/presentation/providers/authentication_validator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key, this.isAuthenticated = false});

  final bool isAuthenticated;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController controller;

  late AutheticationValidator autheticationValidator;
  @override
  void initState() {
    autheticationValidator = Injector.resolve<AutheticationValidator>();

    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: false);

    super.initState();
    Future.delayed(const Duration(milliseconds: 500), initialize);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void initialize() async {
   if (autheticationValidator.isAuthenticated) {
      log("Logging success...");
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const TutorListPage()),
          (route) => false);
    } else {
      log("Logging in...");
      Navigator.pushNamed(context, LoginPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          value: controller.value,
          semanticsLabel: 'Circular progress indicator',
        ),
      ),
    );
  }
}
