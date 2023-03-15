import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/common_widgets/custom_dropdown_button.dart';

class Filters extends StatelessWidget {
  const Filters({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomDropdownButton(
              items: const [
                "Any level",
                "Beginning",
                "Intermediate",
                "Advanced"
              ],
              hintText: "Select level",
            ),
            CustomDropdownButton(
              items: const [
                "Studying abroad",
                "English Travel",
                "Business English",
                "IELTS",
                "KET",
                "PET"
              ],
              hintText: "Select category",
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        CustomDropdownButton(
          items: const ["Increasing", "Descreasing"],
          hintText: "Sort by level",
        ),
      ],
    );
  }
}
