import 'package:tutor_flutter_app/domain/entities/course/topic_entity.dart';

class TopicRequest {
  String title;
  List<TopicEntity> topics;
  int selectedIndex;

  TopicRequest(
      {required this.title, required this.topics, this.selectedIndex = 0});
}
