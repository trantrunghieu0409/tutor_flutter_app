import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_flutter_app/core/utils/image_utils.dart';
import 'package:tutor_flutter_app/domain/entities/course/book_entity.dart';
import 'package:tutor_flutter_app/domain/entities/course/course_entity.dart';
import 'package:tutor_flutter_app/presentation/pages/course_detail_page.dart';
import 'package:tutor_flutter_app/presentation/providers/book_notifier.dart';
import 'package:tutor_flutter_app/presentation/providers/course_notifier.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/card_with_picture.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/common_scaffold.dart';
import 'package:tutor_flutter_app/presentation/widgets/courses/custome_page_introduction.dart';
import 'package:tutor_flutter_app/presentation/widgets/courses/filters.dart';

class CoursesPage extends ConsumerStatefulWidget {
  const CoursesPage({super.key});
  static const routeName = '/courses';

  @override
  ConsumerState<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends ConsumerState<CoursesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {
        _handleChangeTab();
      });
    }
  }

  late List<CourseEntity> courses;
  late List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    courses = ref.watch(coursesProvider);
    books = ref.watch(booksProvider);

    return DefaultTabController(
      length: 3,
      child: CommonScaffold(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: RefreshIndicator(
            onRefresh: _pullRefresh,
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: const [
                      CustomPageIntroduction(),
                      SizedBox(
                        height: 16,
                      ),
                      Filters(),
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
                    Column(
                      children: List<Widget>.generate(
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
                    ),

                    // second tab bar view widget
                    Column(
                      children: List<Widget>.generate(
                          books.length,
                          (index) => CardWithPicture(
                                cover:
                                    ImageUtils.getImage(books[index].imageUrl),
                                title: books[index].name,
                                description: books[index].description,
                                footer: Text(books[index].getLevel()),
                              )),
                    ),

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
    _handleChangeTab();
  }

  _handleChangeTab() {
    switch (_tabController.index) {
      case 0:
        ref.watch(coursesProvider.notifier).getCourses();
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
