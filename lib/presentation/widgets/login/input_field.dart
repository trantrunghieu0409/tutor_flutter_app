import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';

class InputField extends StatefulWidget {
  const InputField(
      {super.key,
      required this.title,
      required this.placeholder,
      this.isObsecure = false,
      required this.textController,
      this.validate,
      this.errorText});
  final String title;
  final String placeholder;
  final bool isObsecure;
  final TextEditingController textController;
  final bool Function()? validate;
  final String? errorText;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isValid = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            widget.title,
            selectionColor: Colors.black12,
            style: CommonTextStyle.h3Second,
            textAlign: TextAlign.left,
          ),
        ),
        TextField(
          obscureText: widget.isObsecure,
          controller: widget.textController,
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              isDense: true,
              labelText: widget.placeholder,
              errorText:
                  widget.validate == null || isValid ? null : widget.errorText),
          onChanged: (value) {
            if (widget.validate != null) {
              setState(() {
                isValid = widget.validate!();
              });
            }
          },
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
