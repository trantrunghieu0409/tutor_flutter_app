import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/common_widgets/common_appbar.dart';
import 'package:tutor_flutter_app/core/common_widgets/custom_dropdown_button.dart';
import 'package:tutor_flutter_app/features/courses/data/datasources/books_data.dart';
import 'package:tutor_flutter_app/features/courses/data/datasources/courses_data.dart';
import 'package:tutor_flutter_app/features/courses/presentation/widgets/card_with_picture.dart';
import 'package:tutor_flutter_app/features/courses/presentation/widgets/custome_page_introduction.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

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
      child: Scaffold(
        appBar: const CommonAppBar(),
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const CustomPageIntroduction(),
                    const SizedBox(
                      height: 16,
                    ),
                    _buildFilters(),
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
                              footer:
                                  "${courses[index].level} - ${courses[index].nLessons} lessons",
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
                              footer: books[index].level,
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

  Widget _buildFilters() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            CustomDropdownButton(
              items: ["Any level", "Beginning", "Intermediate", "Advanced"],
              hintText: "Select level",
            ),
            CustomDropdownButton(
              items: [
                "Studying abroad",
                "English Travel",
                "Business English",
                "IELTS",
                "KET",
                "PET"
              ],
              hintText: "Select category",
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const CustomDropdownButton(
          items: ["Increasing", "Descreasing"],
          hintText: "Sort by level",
        ),
      ],
    );
  }
}
