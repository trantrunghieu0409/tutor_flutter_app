import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/common_widgets/common_appbar.dart';
import 'package:tutor_flutter_app/features/tutot_detail/presentation/widgets/tutor_info.dart';

class TutorDetailPage extends StatelessWidget {
  const TutorDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: CommonAppBar(), body: TutorInfo());
  }
}
