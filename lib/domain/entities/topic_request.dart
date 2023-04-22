import 'package:tutor_flutter_app/domain/entities/topic.dart';

class TopicRequest {
  String title;
  List<Topic> topics;
  int selectedIndex;

  TopicRequest(
      {required this.title, required this.topics, this.selectedIndex = 0});
}
