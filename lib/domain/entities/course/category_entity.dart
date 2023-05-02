class CategoryEntity {
  CategoryEntity({
    required this.id,
    required this.title,
     this.description,
    required this.key,
  });
  late final String id;
  late final String title;
  late final String? description;
  late final String key;
}