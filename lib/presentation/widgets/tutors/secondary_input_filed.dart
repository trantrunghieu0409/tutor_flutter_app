import 'package:flutter/material.dart';

class SecondaryInputField extends StatelessWidget {
  const SecondaryInputField(
      {super.key,
      required this.placeholder,
      this.isObsecure = false,
      this.callback, this.textEditingController});
  final String placeholder;
  final bool isObsecure;
  final void Function(String?)? callback;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: textEditingController,
        onChanged: callback,
        obscureText: isObsecure,
        decoration: InputDecoration(
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black12),
            borderRadius: BorderRadius.circular(8.0),
          ),
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
          labelText: placeholder,
        ),
      ),
    );
  }
}
