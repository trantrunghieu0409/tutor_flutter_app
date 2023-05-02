// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_flutter_app/presentation/providers/tutor_notifier.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/custom_dropdown_button.dart';
import 'package:tutor_flutter_app/presentation/widgets/tutors/input_chip_list.dart';
import 'package:tutor_flutter_app/presentation/widgets/tutors/secondary_input_filed.dart';

class Filter extends ConsumerStatefulWidget {
  const Filter({super.key});

  @override
  ConsumerState<Filter> createState() => _FilterState();
}

class _FilterState extends ConsumerState<Filter> {
  final List<String> _nationalities = [
    "Vietnamese Tutor",
    "Native English Tutor"
  ];
  String _name = '';
  int _nationality = -1;
  List<String> _specialities = [];

  @override
  void initState() {
    _handleFilter();
    super.initState();
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SecondaryInputField(
              textEditingController: controller,
              placeholder: "Enter tutor name",
              callback: (p0) {
                _name = p0!;
                _handleFilter();
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
              _handleFilter();
            }),
        const SizedBox(
          height: 16,
        ),
        InputChipList(
          callback: (list) {
            _specialities = list!;
            _handleFilter();
          },
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            _handleClear();
          },
          child: const Text('Reset filters'),
        )
      ],
    );
  }

  _handleClear() {
    if (_name != '' || _specialities.isNotEmpty || _nationality != -1) {
      setState(() {
        controller.clear();
        _name = '';
        _specialities = [];
        _nationality = -1;
      });
      _handleFilter();
    }
  }

  void _handleFilter() {
    ref.read(tutorsProvider.notifier).search(
        _specialities, _name, _nationality == -1 ? null : _nationality == 0);
  }
}
