import 'package:flutter/material.dart';

class SearchInputField extends StatelessWidget {
  const SearchInputField(
      {super.key, required this.controller, required this.onChange});

  final TextEditingController controller;
  final void Function() onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        onChange();
      },
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(),
        isDense: true,
        contentPadding: EdgeInsets.all(8),
        hintText: "Search",
      ),
    );
  }
}
