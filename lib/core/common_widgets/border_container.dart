import 'package:flutter/material.dart';

class BorderContainer extends StatelessWidget {
  const BorderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      width: double.infinity,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey)),
          color: Colors.white),
      child: child,
    );
  }
}
