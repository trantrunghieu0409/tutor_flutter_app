import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/chatgpt/src/presentation/widgets/text_widget.dart';
import 'package:tutor_flutter_app/domain/entities/common/language.dart';
import 'package:tutor_flutter_app/presentation/controllers/settings_controller.dart';

class ModalHelpers {
  static Future<void> showModal(
      {required BuildContext context,
      required SettingsController controller}) async {
    await showModalBottomSheet<dynamic>(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: Wrap(
              spacing: 16,
              children: List<Widget>.generate(
                Language.languages.length,
                (index) => ListTile(
                    title: TextWidget(label: Language.languages[index].country),
                    leading: Image.asset(
                      Language.languages[index].flag,
                      width: 30,
                    ),
                    onTap: () => {
                          controller.updateLanguage(Language.languages[index]),
                          Navigator.pop(context)
                        }),
              ),
            ),
          );
        });
  }

  static Future<void> showClearHistoryDialog(
      {required BuildContext context, required Function callback}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Clear History'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text("Are you sure to clear the history?"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                callback();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
