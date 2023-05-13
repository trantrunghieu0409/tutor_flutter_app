import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/utils/settings_utils.dart';

class BorderContainer extends StatelessWidget {
  const BorderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      width: double.infinity,
      decoration: BoxDecoration(
          border: const Border(bottom: BorderSide(color: Colors.grey)),
          color: SettingUtils.isLightTheme ? Colors.white : Colors.black12),
      child: child,
    );
  }
}
