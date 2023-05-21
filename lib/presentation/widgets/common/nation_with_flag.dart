import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/constants/common_nation.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';

class NationWithFlag extends StatelessWidget {
  const NationWithFlag(
      {super.key,
      required this.nation,
      this.mainAxisAlignment = MainAxisAlignment.start});
  final String nation;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        CommonNation.vietnam.getImage(),
        const SizedBox(
          width: 4,
        ),
        Text(
          nation,
          style: CommonTextStyle.bodySecond,
        )
      ],
    );
  }
}
