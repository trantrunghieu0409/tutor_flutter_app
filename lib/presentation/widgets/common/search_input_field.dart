import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        border: const OutlineInputBorder(),
        isDense: true,
        contentPadding: const EdgeInsets.all(8),
        hintText: AppLocalizations.of(context)!.search,
      ),
    );
  }
}
