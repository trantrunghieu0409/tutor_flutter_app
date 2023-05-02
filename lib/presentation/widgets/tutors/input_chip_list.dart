import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/domain/entities/common/specility_enum.dart';

class InputChipList extends StatefulWidget {
  const InputChipList({super.key, this.callback});
  final void Function(List<String>?)? callback;

  @override
  State<InputChipList> createState() => _InputChipListState();
}

class _InputChipListState extends State<InputChipList> {
  var inputs = SpecialityEnum.values;

  List<int> selectedIndices = List.empty(growable: true);

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
                  label: Text(inputs[index].value),
                  selected: selectedIndices.contains(index),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        selectedIndices.add(index);
                      } else {
                        selectedIndices.remove(index);
                      }
                      if (widget.callback != null) {
                        widget.callback!(selectedIndices
                            .map((e) => inputs[e].filterKey)
                            .toList());
                      }
                    });
                  },
                  backgroundColor: const Color.fromARGB(255, 236, 243, 248),
                  selectedColor: const Color.fromARGB(255, 228, 237, 244),
                  labelStyle: TextStyle(
                      fontWeight: selectedIndices.contains(index)
                          ? FontWeight.w700
                          : FontWeight.normal,
                      color: selectedIndices.contains(index)
                          ? Colors.blue
                          : Colors.black),
                );
              },
            ).toList(),
          )
        ]);
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    selectedIndices.clear();
  }
}
