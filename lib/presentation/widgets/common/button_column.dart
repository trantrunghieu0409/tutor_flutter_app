import 'package:flutter/material.dart';

class ButtonColumn extends StatelessWidget {
  const ButtonColumn({
    super.key,
    this.color = Colors.blue,
    this.size = 12,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color,
          size: size * 3,
        ),
        Container(
          margin: const EdgeInsets.only(top: 4),
          child: Text(
            label,
            style: TextStyle(
              fontSize: size,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
