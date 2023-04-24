import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_flutter_app/presentation/providers/tutor_notifier.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/custom_dropdown_button.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/date_picker.dart';
import 'package:tutor_flutter_app/presentation/widgets/tutors/input_chip_list.dart';
import 'package:tutor_flutter_app/presentation/widgets/tutors/secondary_input_filed.dart';

class Filter extends ConsumerWidget {
  Filter({super.key});

  final List<String> _nationalities = [
    "Vietnamese Tutor",
    "Native English Tutor"
  ];
  String _name = '';
  int _nationality = -1;
  List<String> _specialities = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SecondaryInputField(
              placeholder: "Enter tutor name",
              callback: (p0) {
                _name = p0!;
                _handleFilter(ref);
              },
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        CustomDropdownButton(
            items: _nationalities,
            hintText: 'Select tutor nationality',
            callback: (p0) {
              _nationality = _nationalities.indexOf(p0!);
              _handleFilter(ref);
            }),
        const SizedBox(
          height: 8,
        ),
        const Text(
          "Select available tutoring time:",
          style: CommonTextStyle.bodyBlack,
          textAlign: TextAlign.start,
        ),
        const SizedBox(width: 160, child: DatePicker()),
        const SizedBox(
          height: 16,
        ),
        InputChipList(callback: (list) {
          _specialities = list!;
          _handleFilter(ref);
        })
      ],
    );
  }

  void _handleFilter(WidgetRef ref) {
    ref.read(tutorsProvider.notifier).search(
        _specialities, _name, _nationality == -1 ? null : _nationality == 0);
  }
}
