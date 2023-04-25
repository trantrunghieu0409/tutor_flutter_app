import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/domain/entities/tutor/tutor_entity.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/button_column.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key, required this.tutor});

  final TutorEntity tutor;

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ButtonColumn(
            color: tutor.isFavorite ? Colors.red : color,
            icon: tutor.isFavorite ? Icons.favorite : Icons.favorite_outline,
            label: 'Favorite'),
        ButtonColumn(
            color: color, icon: Icons.report_outlined, label: 'Report'),
        ButtonColumn(color: color, icon: Icons.star_outline, label: 'Reviews'),
      ],
    );
  }
}
