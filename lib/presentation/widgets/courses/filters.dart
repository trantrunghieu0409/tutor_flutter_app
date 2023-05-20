import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/custom_dropdown_button.dart';

class Filters extends StatelessWidget {
  const Filters({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDropdownButton(
          items: const ["Any level", "Beginning", "Intermediate", "Advanced"],
          hintText: "Select level",
        ),
        const SizedBox(
          height: 16,
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
