import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/common_widgets/common_appbar.dart';
import 'package:tutor_flutter_app/features/login/presentation/widgets/input_field.dart';
import 'package:tutor_flutter_app/features/login/presentation/widgets/primary_button.dart';
import 'package:tutor_flutter_app/features/login/presentation/widgets/row_icons.dart';

import '../widgets/text_widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: const [
                TextHeader(),
                TextSubheader(),
                InputField(title: "EMAIL", placeholder: "Your email"),
                InputField(
                  title: "PASSWORD",
                  placeholder: "Your password",
                  isObsecure: true,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: PrimaryButton(text: "LOGIN"),
                ),
                TextLink(
                  text: "Forget Password?",
                  link: "https://pub.dev/packages/url_launcher",
                ),
                SizedBox(
                  height: 40,
                ),
                Text("Or continue with"),
                RowIcons(),
                Footer()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
