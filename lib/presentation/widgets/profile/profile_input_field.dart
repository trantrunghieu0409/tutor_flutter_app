import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';

class ProfileInputField extends StatelessWidget {
  const ProfileInputField(
      {super.key,
      required this.title,
      required this.placeholder,
      this.isObsecure = false,
      required this.textController,
      this.isMultiline = false,
      this.maxLength = 100});
  final String title;
  final String placeholder;
  final bool isObsecure;

  final bool isMultiline;

  final int maxLength;

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Text(
              title,
              selectionColor: Colors.black,
              style: CommonTextStyle.h3Black,
              textAlign: TextAlign.left,
            ),
          ),
          if (isMultiline)
            TextField(
              maxLength: maxLength,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              obscureText: isObsecure,
              controller: textController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                isDense: true,
                labelText: placeholder,
              ),
              style: CommonTextStyle.bodyBlack,
            )
          else
            TextField(
              obscureText: isObsecure,
              controller: textController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                isDense: true,
                labelText: placeholder,
              ),
              style: CommonTextStyle.bodyBlack,
            )
        ],
      ),
    );
  }
}
