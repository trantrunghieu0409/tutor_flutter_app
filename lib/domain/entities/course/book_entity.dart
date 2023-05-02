import 'package:tutor_flutter_app/domain/entities/course/category_entity.dart';

class BookEntity {
  BookEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.level,
    required this.visible,
    required this.fileUrl,
    required this.createdAt,
    required this.updatedAt,
    isPrivate,
    createdBy,
    required this.categories,
  });
  late final String id;
  late final String name;
  late final String description;
  late final String imageUrl;
  late final String level;
  late final bool visible;
  late final String fileUrl;
  late final String createdAt;
  late final String updatedAt;
  late final void isPrivate;
  late final void createdBy;
  late final List<CategoryEntity> categories;

  getLevel() {
    if (int.parse(level) < 1) return "Any level";
    if (int.parse(level) < 3) return "Beginner";
    if (int.parse(level) < 6) return "Intermediate";
    return "Advanced";
  }
}
