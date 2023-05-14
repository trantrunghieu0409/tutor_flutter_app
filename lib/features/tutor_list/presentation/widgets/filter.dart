import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/common_widgets/date_picker.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/features/tutor_list/presentation/widgets/input_chip_list.dart';
import 'package:tutor_flutter_app/features/tutor_list/presentation/widgets/secondary_input_filed.dart';

class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            SecondaryInputField(placeholder: "Enter tutor name"),
            SizedBox(width: 16),
            SecondaryInputField(placeholder: "Select nation"),
          ],
        ),
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
        const InputChipList()
      ],
    );
  }
}
