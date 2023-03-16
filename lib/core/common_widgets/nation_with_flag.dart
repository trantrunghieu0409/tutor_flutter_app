import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/constants/common_nation.dart';

import '../constants/common_text_style.dart';

class NationWithFlag extends StatelessWidget {
  const NationWithFlag(
      {super.key,
      required this.nation,
      this.mainAxisAlignment = MainAxisAlignment.start});
  final Nation nation;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        nation.getImage(),
        const SizedBox(
          width: 4,
        ),
        Text(
          nation.name,
          style: CommonTextStyle.bodyBlack,
        )
      ],
    );
  }
}
