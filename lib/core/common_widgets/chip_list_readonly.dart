import 'package:flutter/material.dart';

class ChipListReadOnly extends StatelessWidget {
  const ChipListReadOnly({super.key, required this.chipTextList});
  final List<String> chipTextList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(children: <Widget>[
        Wrap(
          spacing: 4.0,
          children: List<Widget>.generate(
            chipTextList.length,
            (int index) {
              return ChoiceChip(
                label: Text(chipTextList[index]),
                selectedColor: const Color.fromARGB(255, 228, 237, 244),
                selected: true,
                onSelected: (bool value) => {},
                labelStyle: const TextStyle(
                    fontWeight: FontWeight.w700, color: Colors.blue),
              );
            },
          ).toList(),
        )
      ]),
    );
  }
}
