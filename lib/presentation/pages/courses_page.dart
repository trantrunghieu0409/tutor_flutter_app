import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/data/datasources/books_data.dart';
import 'package:tutor_flutter_app/data/datasources/courses_data.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/card_with_picture.dart';
import 'package:tutor_flutter_app/data/datasources/course_detail_data.dart';
import 'package:tutor_flutter_app/presentation/pages/course_detail_page.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/common_scaffold.dart';
import 'package:tutor_flutter_app/presentation/widgets/courses/custome_page_introduction.dart';
import 'package:tutor_flutter_app/presentation/widgets/courses/filters.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});
  static const routeName = '/courses';

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage>
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
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: CommonScaffold(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
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
                              cover: courses[index].image,
                              title: courses[index].title,
                              description: courses[index].description,
                              footer: Text(
                                "${courses[index].level} - ${courses[index].nLessons} lessons",
                              ),
                              callback: () {
                                Navigator.pushNamed(
                                    context, CourseDetailPage.routeName,
                                    arguments: courseDetail);
                              },
                            )),
                  ),

                  // second tab bar view widget
                  Column(
                    children: List<Widget>.generate(
                        books.length,
                        (index) => CardWithPicture(
                              cover: books[index].image,
                              title: books[index].title,
                              description: books[index].description,
                              footer: Text(books[index].level),
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
                          style: TextStyle(fontSize: 16, color: Colors.black45),
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
    );
  }
}
