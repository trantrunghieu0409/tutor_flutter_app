import 'package:flutter/material.dart';

class SecondaryInputField extends StatelessWidget {
  const SecondaryInputField(
      {super.key, required this.placeholder, this.isObsecure = false, this.callback});
  final String placeholder;
  final bool isObsecure;
  final void Function(String?)? callback;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        onSubmitted: callback,
        obscureText: isObsecure,
        decoration: InputDecoration(
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          isDense: true,
          contentPadding: const EdgeInsets.all(8),
          labelText: placeholder,
        ),
      ),
    );
  }
}
