import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DialogHelpers {
  static Future<void> showFutureResultDialog(
      {required String successText,
      required String failText,
      required Future<bool> isSuccess,
      required BuildContext context,
      required void Function() onSuccess}) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            content: FutureBuilder(
                future: isSuccess,
                builder: (ctx, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    bool isSuccess = snapshot.data!;

                    String displayText = isSuccess ? successText : failText;
                    if (isSuccess) {
                      onSuccess();
                    }

                    return SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              snapshot.data!
                                  ? const Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: 64,
                                    )
                                  : const Icon(
                                      Icons.cancel_outlined,
                                      color: Colors.red,
                                      size: 64,
                                    ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                displayText,
                                style: CommonTextStyle.bodySecond,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const Center(
                        heightFactor: 1.0,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ));
                  }
                }),
          );
        });
  }

  static Future<void> showSimpleResultDialog(
      BuildContext context, String title, String text) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(text),
              ],
            ),
          ),
          actions: <Widget>[
            OutlinedButton(
              child: Text(AppLocalizations.of(context)!.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
