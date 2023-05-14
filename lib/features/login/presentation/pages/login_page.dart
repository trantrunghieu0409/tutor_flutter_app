import 'package:flutter/material.dart';

import 'package:tutor_flutter_app/features/login/presentation/widgets/input_field.dart';
import 'package:tutor_flutter_app/core/common_widgets/primary_button.dart';
import 'package:tutor_flutter_app/features/login/presentation/widgets/row_icons.dart';

import '../widgets/text_widgets.dart';

typedef LoginCallback = void Function()?;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    final onLoginSuccessCallback =
        ModalRoute.of(context)!.settings.arguments as LoginCallback;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(40),
          children: [
            const TextHeader(),
            const TextSubheader(),
            const InputField(title: "EMAIL", placeholder: "Your email"),
            const InputField(
              title: "PASSWORD",
              placeholder: "Your password",
              isObsecure: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: PrimaryButton(
                text: "LOGIN",
                onPressed: onLoginSuccessCallback,
              ),
            ),
            const TextLink(
              text: "Forget Password?",
              link: "https://pub.dev/packages/url_launcher",
            ),
            const SizedBox(
              height: 40,
            ),
            const Text("Or continue with"),
            const RowIcons(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
