import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField(
      {super.key,
      required this.title,
      required this.placeholder,
      this.isObsecure = false,
      required this.textController});
  final String title;
  final String placeholder;
  final bool isObsecure;

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            title,
            selectionColor: Colors.black12,
            style: const TextStyle(fontSize: 16.0),
            textAlign: TextAlign.left,
          ),
        ),
        TextField(
          obscureText: isObsecure,
          controller: textController,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            isDense: true,
            labelText: placeholder,
          ),
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
