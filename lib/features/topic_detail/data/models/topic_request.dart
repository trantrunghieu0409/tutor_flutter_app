import 'package:tutor_flutter_app/features/course_detail/data/models/topic.dart';

class TopicRequest {
  String title;
  List<Topic> topics;
  int selectedIndex;

  TopicRequest(
      {required this.title, required this.topics, this.selectedIndex = 0});
}
