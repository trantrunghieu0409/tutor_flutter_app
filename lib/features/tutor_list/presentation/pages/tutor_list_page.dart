import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/common_widgets/common_scaffold.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/features/tutor_list/data/datasources/tutor_datasource.dart';
import 'package:tutor_flutter_app/features/tutor_list/presentation/widgets/filter.dart';
import 'package:tutor_flutter_app/features/tutor_list/presentation/widgets/header.dart';
import 'package:tutor_flutter_app/features/tutor_list/presentation/widgets/tutor_list.dart';

class TutorListPage extends StatelessWidget {
  const TutorListPage({super.key});
  static const routeName = '/tutor-list';

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      child: ListView(
        children: [
          const Header(),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Find a tutor",
                  style: CommonTextStyle.h1Black,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Filter(),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Recommended Tutors",
                  style: CommonTextStyle.h2Black,
                ),
                const SizedBox(
                  height: 16,
                ),
                TutorList(
                  tutorList: tutors,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
