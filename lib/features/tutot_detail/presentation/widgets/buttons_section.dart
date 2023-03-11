import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/common_widgets/button_column.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ButtonColumn(
            color: color, icon: Icons.favorite_outline, label: 'Favorite'),
        ButtonColumn(
            color: color, icon: Icons.report_outlined, label: 'Report'),
        ButtonColumn(color: color, icon: Icons.star_outline, label: 'Reviews'),
      ],
    );
  }
}
