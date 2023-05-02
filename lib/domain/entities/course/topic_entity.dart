class TopicEntity {
  TopicEntity({
    required this.id,
    required this.courseId,
    required this.orderCourse,
    required this.name,
    required this.nameFile,
    this.numberOfPages,
    required this.description,
    this.videoUrl,
    this.type,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String courseId;
  late final int orderCourse;
  late final String name;
  late final String nameFile;
  late final void numberOfPages;
  late final String description;
  late final void videoUrl;
  late final void type;
  late final String createdAt;
  late final String updatedAt;
}
