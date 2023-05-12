import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/data/models/request/base_req.dart';
import 'package:tutor_flutter_app/data/models/request/search_tutor_req.dart';
import 'package:tutor_flutter_app/presentation/providers/tutor_notifier.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/common_scaffold.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/custom_dropdown_button.dart';
import 'package:tutor_flutter_app/presentation/widgets/tutors/input_chip_list.dart';
import 'package:tutor_flutter_app/presentation/widgets/tutors/secondary_input_filed.dart';
import 'package:tutor_flutter_app/presentation/widgets/tutors/tutor_list.dart';
import 'package:tutor_flutter_app/presentation/widgets/tutors/upcoming_lesson.dart';

class TutorListPage extends ConsumerStatefulWidget {
  const TutorListPage({Key? key}) : super(key: key);

  static const routeName = '/tutor-list';

  @override
  ConsumerState<TutorListPage> createState() => _TutorListPageState();
}

class _TutorListPageState extends ConsumerState<TutorListPage> {
  final List<String> _nationalities = [
    "Vietnamese Tutor",
    "Native English Tutor"
  ];
  late String _name = '';
  late int _nationality = -1;
  late List<String> _specialities = [];
  int page = 1;
  bool isLoading = false;

  TextEditingController controller = TextEditingController();

  final _scrollController = ScrollController();
  @override
  void initState() {
    _fetchPage(page);
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
    int total = ref.read(tutorsProvider.notifier).total;
    return page >= (total / BaseReq.defaultPageSize).ceil();
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
    await ref.read(tutorsProvider.notifier).search(SearchTutorReq(
        name: _name,
        specialities: _specialities,
        isVietnamese: _nationality == -1 ? null : _nationality == 0,
        page: page));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: CommonScaffold(
        child: RefreshIndicator(
          onRefresh: _pullRefresh,
          child: ListView(
            controller: _scrollController,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SecondaryInputField(
                              textEditingController: controller,
                              placeholder: "Enter tutor name",
                              callback: (p0) {
                                _name = p0!;
                                _handleFilter();
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomDropdownButton(
                            items: _nationalities,
                            hintText: 'Select tutor nationality',
                            callback: (p0) {
                              _nationality = _nationalities.indexOf(p0!);
                              _handleFilter();
                            }),
                        const SizedBox(
                          height: 16,
                        ),
                        InputChipList(
                          callback: (list) {
                            _specialities = list!;
                            _handleFilter();
                          },
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            _handleClear();
                          },
                          child: const Text('Reset filters'),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      "Recommended Tutors",
                      style: CommonTextStyle.h2Black,
                    ),
                    Consumer(builder: (contex, ref, child) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
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
                            tutorList: ref.watch(tutorsProvider),
                          ),
                          if (!isEndOfPage())
                            const Center(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(),
                            ))
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _handleClear() {
    if (_name != '' || _specialities.isNotEmpty || _nationality != -1) {
      setState(() {
        controller.clear();
        _name = '';
        _specialities = [];
        _nationality = -1;
      });
      _handleFilter();
    }
  }

  _handleFilter() {
    page = 1;
    ref.read(tutorsProvider.notifier).search(SearchTutorReq(
          name: _name,
          specialities: _specialities,
          isVietnamese: _nationality == -1 ? null : _nationality == 0,
        ));
  }

  Future<void> _pullRefresh() async {
    _handleClear();
    _handleFilter();
  }
}
