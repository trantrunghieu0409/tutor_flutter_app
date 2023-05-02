import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/presentation/providers/tutor_notifier.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/common_scaffold.dart';
import 'package:tutor_flutter_app/presentation/widgets/tutors/filter.dart';
import 'package:tutor_flutter_app/presentation/widgets/tutors/upcoming_lesson.dart';
import 'package:tutor_flutter_app/presentation/widgets/tutors/tutor_list.dart';

class TutorListPage extends ConsumerStatefulWidget {
  const TutorListPage({Key? key}) : super(key: key);

  static const routeName = '/tutor-list';

  @override
  ConsumerState<TutorListPage> createState() => _TutorListPageState();
}

class _TutorListPageState extends ConsumerState<TutorListPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: CommonScaffold(
        child: ListView(
          children: [
            const UpcommingLesson(),
            Container(
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
                  Consumer(builder: (contex, ref, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Found ${ref.watch(tutorsProvider.notifier).total} result(s)",
                          style: CommonTextStyle.bodyBlack,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TutorList(
                          tutorList: ref
                              .watch(tutorsProvider.select((value) => value)),
                        ),
                      ],
                    );
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
