import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tutor_flutter_app/domain/entities/history/past_history_entity.dart';
import 'package:tutor_flutter_app/presentation/providers/past_history_notifier.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/common_scaffold.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/empty_widget.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/page_introduction.dart';
import 'package:tutor_flutter_app/presentation/widgets/history/history_card.dart';

class HistoryPage extends ConsumerStatefulWidget {
  const HistoryPage({super.key});

  static const routeName = '/history';

  @override
  ConsumerState<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends ConsumerState<HistoryPage> {
  late List<PastHistoryEntity> tutors;

  @override
  Widget build(BuildContext context) {
    tutors = ref.watch(pastHistoryProvider);

    return CommonScaffold(
        child: RefreshIndicator(
            onRefresh: _pullRefresh,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              children: [
                PageIntroduction(
                  title: "History",
                  description:
                      "The following is a list of lessons you have attended\nYou can review the details of the lessons you have attended",
                  image: SvgPicture.asset(
                    "assets/images/history_picture.svg",
                    semanticsLabel: "history_picture",
                  ),
                ),
                ..._buidHistoryCardList(),
              ],
            )));
  }

  Future<void> _pullRefresh() async {
    ref.watch(pastHistoryProvider.notifier).getHistory();
  }

  List<Widget> _buidHistoryCardList() {
    return tutors.isEmpty
        ? [const EmptyWidget(text: "History is empty")]
        : List<Widget>.generate(tutors.length,
            (index) => HistoryCard(tutor: tutors[index], time: DateTime.now()));
  }
}
