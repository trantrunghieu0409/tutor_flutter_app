import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/common_widgets/CommonAppBar.dart';
import 'package:tutor_flutter_app/features/login/presentation/widgets/InputFieldsWidget.dart';
import 'package:tutor_flutter_app/features/login/presentation/widgets/PrimaryButton.dart';
import 'package:tutor_flutter_app/features/login/presentation/widgets/RowIcons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/TextWidgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: SizedBox(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            Image.asset("assets/images/main_picture_login.png",
                semanticLabel: "Main Picture", fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
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
                  PrimaryButton(text: "LOGIN"),
                  SizedBox(
                    height: 8,
                  ),
                  TextLink(
                    text: "Forget Password?",
                    link: "https://pub.dev/packages/url_launcher",
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text("Or continue with"),
                  RowIcons(),
                  Footer()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
