import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/border_container.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return BorderContainer(
        child: Text(text, style: CommonTextStyle.bodyItalicBlack));
  }
}
