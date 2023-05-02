import 'package:tutor_flutter_app/domain/entities/course/category_entity.dart';
import 'package:tutor_flutter_app/domain/entities/course/topic_entity.dart';

class CourseEntity {
  CourseEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.level,
    required this.reason,
    required this.purpose,
    required this.otherDetails,
    required this.defaultPrice,
    required this.coursePrice,
    required this.visible,
    required this.topics,
    required this.categories,
  });
  late final String id;
  late final String name;
  late final String description;
  late final String imageUrl;
  late final String level;
  late final String reason;
  late final String purpose;
  late final String otherDetails;
  late final int defaultPrice;
  late final int coursePrice;
  late final bool visible;
  late List<TopicEntity> topics;
  late final List<CategoryEntity> categories;

  getLevel() {
    if (int.parse(level) < 1) return "Any level";
    if (int.parse(level) < 3) return "Beginner";
    if (int.parse(level) < 6) return "Intermediate";
    return "Advanced";
  }
}
