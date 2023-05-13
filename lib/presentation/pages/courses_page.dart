import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_flutter_app/core/constants/common_consts.dart';
import 'package:tutor_flutter_app/core/utils/image_utils.dart';
import 'package:tutor_flutter_app/data/models/request/search_course_req.dart';
import 'package:tutor_flutter_app/domain/entities/course/book_entity.dart';
import 'package:tutor_flutter_app/domain/entities/course/category_entity.dart';
import 'package:tutor_flutter_app/domain/entities/course/course_entity.dart';
import 'package:tutor_flutter_app/presentation/pages/course_detail_page.dart';
import 'package:tutor_flutter_app/presentation/providers/book_notifier.dart';
import 'package:tutor_flutter_app/presentation/providers/course_notifier.dart';
import 'package:tutor_flutter_app/presentation/providers/helper_future_providers.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/card_with_picture.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/common_scaffold.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/custom_dropdown_button.dart';
import 'package:tutor_flutter_app/presentation/widgets/courses/custome_page_introduction.dart';

class CoursesPage extends ConsumerStatefulWidget {
  const CoursesPage({super.key});
  static const routeName = '/courses';

  @override
  ConsumerState<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends ConsumerState<CoursesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _scrollController = ScrollController();

  int page = 1;
  bool isLoading = false;

  bool isEndOfPage() {
    int total = ref.read(coursesProvider.notifier).total;
    return page >= (total / 10).ceil();
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
    String query = searchTextController.text;
    await ref.watch(coursesProvider.notifier).getCourses(
        searchCourseReq: SearchCourseReq(
            page: page,
            query: query.isNotEmpty ? query : null,
            levels: level != -1 ? [level] : [],
            categoryIds: categoryId != null ? [categoryId!] : [],
            direction: direction));
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
    super.initState();

    _scrollController.addListener(() {
      onScrollNearEnd();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {
        _handleChangeTab();
      });
    }
  }

  late List<CategoryEntity> categories = [];
  late List<CourseEntity> courses;
  late List<BookEntity> books;
  final searchTextController = TextEditingController();

  final levels = const [
    "Any level",
    "Beginner",
    "Upper-Beginner",
    "Pre-Intermediate",
    "Intermediate",
    "Upper-Intermediate",
    "Pre-Advanced",
    "Advanced",
    "Very Advanced"
  ];
  int level = -1;
  String? categoryId;
  String? direction;

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      categories = ref
          .watch(categoriesProvider)
          .when(data: (data) => data, error: (_, __) => [], loading: () => []);
    }
    return DefaultTabController(
      length: 3,
      child: CommonScaffold(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: RefreshIndicator(
            onRefresh: _pullRefresh,
            child: ListView(
              controller: _scrollController,
              shrinkWrap: true,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      CustomPageIntroduction(
                        searchTextController: searchTextController,
                        onChange: () {
                          _fetchPage(1);
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Column(
                        children: [
                          CustomDropdownButton(
                            items: levels,
                            selectedValue: level == -1 ? null : levels[level],
                            hintText: "Select level",
                            callback: (value) {
                              setState(() {
                                level = levels.indexOf(value!);
                              });
                              _fetchPage(1);
                            },
                            keepState: true,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          CustomDropdownButton(
                            items: categories.map((e) => e.title).toList(),
                            selectedValue: categoryId == null
                                ? null
                                : categories
                                    .firstWhere(
                                        (element) => element.id == categoryId)
                                    .title,
                            hintText: "Select category",
                            callback: (value) {
                              setState(() {
                                categoryId = categories
                                    .firstWhere(
                                        (element) => element.title == value!)
                                    .id;
                              });
                              _fetchPage(1);
                            },
                            keepState: true,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          CustomDropdownButton(
                            items: const ["Increasing", "Descreasing"],
                            selectedValue: direction == null
                                ? null
                                : (direction == CommonConsts.asc
                                    ? "Increasing"
                                    : "Descreasing"),
                            hintText: "Sort by level",
                            callback: (value) {
                              setState(() {
                                direction = value == "Increasing"
                                    ? CommonConsts.asc
                                    : CommonConsts.desc;
                              });
                              _fetchPage(1);
                            },
                            keepState: true,
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                // the tab bar with two items
                TabBar(
                  controller: _tabController,
                  labelColor: Colors.blue,
                  tabs: const [
                    Tab(
                      text: "Course",
                    ),
                    Tab(
                      text: "E-Book",
                    ),
                    Tab(
                      text: "Modern E-book",
                    ),
                  ],
                ),

                // create widgets for each tab bar here
                Center(
                  child: [
                    // first tab bar view widget
                    Consumer(builder: (contex, ref, child) {
                      courses = ref.watch(coursesProvider);

                      return Column(children: [
                        ...List<Widget>.generate(
                            courses.length,
                            (index) => CardWithPicture(
                                  cover: ImageUtils.getImage(
                                      courses[index].imageUrl),
                                  title: courses[index].name,
                                  description: courses[index].description,
                                  footer: Text(
                                    "${courses[index].getLevel()} - ${courses[index].topics.length} lessons",
                                  ),
                                  callback: () {
                                    Navigator.pushNamed(
                                        context, CourseDetailPage.routeName,
                                        arguments: courses[index]);
                                  },
                                )),
                        if (!isEndOfPage())
                          const Center(
                              child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator()))
                      ]);
                    }),

                    // second tab bar view widget
                    Consumer(builder: (contex, ref, child) {
                      books = ref.watch(booksProvider);

                      return Column(
                        children: List<Widget>.generate(
                            books.length,
                            (index) => CardWithPicture(
                                  cover: ImageUtils.getImage(
                                      books[index].imageUrl),
                                  title: books[index].name,
                                  description: books[index].description,
                                  footer: Text(books[index].getLevel()),
                                )),
                      );
                    }),

                    // third tab bar view widget
                    SizedBox(
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.event_note_sharp,
                            size: 36,
                          ),
                          Text(
                            "No data",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black45),
                          )
                        ],
                      ),
                    ),
                  ][_tabController.index],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pullRefresh() async {
    setState(() {
      searchTextController.clear();
      level = -1;
      categoryId = null;
      direction = null;
    });
    _handleChangeTab();
  }

  _handleChangeTab() {
    switch (_tabController.index) {
      case 0:
        _fetchPage(1);
        break;
      case 1:
        ref.watch(booksProvider.notifier).getEBooks();
        break;
      case 2:
        // do nothing because interactive book list is always empty
        break;
    }
  }
}
