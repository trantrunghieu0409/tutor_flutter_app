import 'package:flutter/material.dart';

class InputChipList extends StatefulWidget {
  const InputChipList({super.key});

  @override
  State<InputChipList> createState() => _InputChipListState();
}

class _InputChipListState extends State<InputChipList> {
  var inputs = [
    "All",
    "English for kids",
    "English for Business",
    "Conversational",
    "STARTERES",
    "MOVERS",
    "FLYERS",
    "KET",
    "PET",
    "IELTS",
    "TOELF",
    "TOIEC"
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 4.0,
            children: List<Widget>.generate(
              inputs.length,
              (int index) {
                return ChoiceChip(
                  label: Text(inputs[index]),
                  selected: selectedIndex == index,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedIndex = selected ? index : null;
                    });
                  },
                  backgroundColor: Color.fromARGB(255, 236, 243, 248),
                  selectedColor: Color.fromARGB(255, 228, 237, 244),
                  labelStyle: TextStyle(
                      fontWeight: selectedIndex == index
                          ? FontWeight.w700
                          : FontWeight.normal,
                      color: selectedIndex == index
                          ? Color.fromARGB(255, 7, 77, 199)
                          : Colors.black),
                );
              },
            ).toList(),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              setState(() {
                selectedIndex = null;
              });
            },
            child: const Text('Reset'),
          )
        ]);
  }
}
