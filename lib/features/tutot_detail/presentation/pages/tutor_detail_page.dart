import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/common_widgets/previous_appbar.dart';
import 'package:tutor_flutter_app/features/tutor_list/data/models/tutor.dart';
import 'package:tutor_flutter_app/features/tutot_detail/presentation/widgets/tutor_info.dart';

class TutorDetailPage extends StatelessWidget {
  const TutorDetailPage({super.key});
  static const routeName = '/tutor-detail';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Tutor;
    onClosePage() => {Navigator.pop(context)};

    return Scaffold(
        appBar: PreviousAppBar(
          callback: onClosePage,
        ),
        body: TutorInfo(tutor: args));
  }
}
