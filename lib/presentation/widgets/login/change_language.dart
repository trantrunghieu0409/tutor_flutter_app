import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/injection/injector.dart';
import 'package:tutor_flutter_app/domain/entities/common/language.dart';
import 'package:tutor_flutter_app/presentation/controllers/settings_controller.dart';

class ChangeLanguageButton extends StatefulWidget {
  const ChangeLanguageButton({super.key});

  @override
  State<ChangeLanguageButton> createState() => _ChangeLanguageButtonState();
}

class _ChangeLanguageButtonState extends State<ChangeLanguageButton> {
  final SettingsController controller = Injector.resolve<SettingsController>();

  @override
  Widget build(BuildContext context) {
    bool isEnglish = controller.language == Language.english;
    return FloatingActionButton(
        onPressed: () {
          setState(() {
            log(isEnglish.toString());
            controller.updateLanguage(
                isEnglish ? Language.vietnamese : Language.english);
          });
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Image.asset(
            width: 32,
            isEnglish ? Language.english.flag : Language.vietnamese.flag));
  }
}
