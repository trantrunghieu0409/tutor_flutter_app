import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/features/login/presentation/pages/login_page.dart';
import 'package:tutor_flutter_app/features/tutorList/presentation/pages/tutor_list_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  bool isAuthenicated = false;
  late AnimationController controller;
  @override
  void initState() {
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
    onLoginSuccessCallback() => {
          setState(() {
            isAuthenicated = true;
            Navigator.pop(context);
            initialize();
          })
        };

    if (isAuthenicated) {
      print("Logging success...");
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const TutorListPage()),
          (route) => false);
    } else {
      print("Logging in...");

      Navigator.pushNamed(context, LoginPage.routeName,
          arguments: onLoginSuccessCallback);
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
