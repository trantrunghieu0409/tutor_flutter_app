import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tutor_flutter_app/domain/entities/history/tutor_history_entity.dart';
import 'package:tutor_flutter_app/presentation/providers/past_history_notifier.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/common_scaffold.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/empty_widget.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/page_introduction.dart';
import 'package:tutor_flutter_app/presentation/widgets/history/history_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HistoryPage extends ConsumerStatefulWidget {
  const HistoryPage({super.key});

  static const routeName = '/history';

  @override
  ConsumerState<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends ConsumerState<HistoryPage> {
  int page = 1;
  int perPage = 10;
  bool isLoading = false;

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      onScrollNearEnd();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool isEndOfPage() {
    int total = ref.read(pastHistoryProvider.notifier).total;
    return page >= (total / perPage).ceil();
  }

  void onScrollNearEnd() async {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    double delta = 100.0;
    if (!isLoading && maxScroll - currentScroll <= delta && !isEndOfPage()) {
      isLoading = true;
      await _fetchPage(++page);
      isLoading = false;
    }
  }

  Future<void> _fetchPage(int page) async {
    await ref
        .watch(pastHistoryProvider.notifier)
        .getHistory(page: page, perPage: perPage);
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        child: RefreshIndicator(
            onRefresh: _pullRefresh,
            child: ListView(
              controller: _scrollController,
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              children: [
                PageIntroduction(
                  title: AppLocalizations.of(context)!.history,
                  description: AppLocalizations.of(context)!.history_desc,
                  image: SvgPicture.asset(
                    "assets/images/history_picture.svg",
                    semanticsLabel: "history_picture",
                  ),
                ),
                Consumer(builder: (context, ref, child) {
                  return Column(children: [
                    ..._buidHistoryCardList(ref.watch(pastHistoryProvider)),
                    if (!isEndOfPage())
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ),
                      )
                  ]);
                }),
              ],
            )));
  }

  Future<void> _pullRefresh() async {
    page = 1;
    _fetchPage(1);
  }

  List<Widget> _buidHistoryCardList(List<TutorHistoryEntity> tutors) {
    return tutors.isEmpty
        ? [EmptyWidget(text: AppLocalizations.of(context)!.no_data)]
        : List<Widget>.generate(
            tutors.length, (index) => HistoryCard(tutor: tutors[index]));
  }
}
