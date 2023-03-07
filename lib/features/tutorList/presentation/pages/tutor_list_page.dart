import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tutor_flutter_app/core/common_widgets/CommonAppBar.dart';
import 'package:tutor_flutter_app/features/tutorList/presentation/widgets/header.dart';

class TutorListPage extends StatelessWidget {
  const TutorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Column(
        children: const [
          Header(),
        ],
      ),
    );
  }
}
