// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class CourseMapperImpl extends CourseMapper {
  CourseMapperImpl() : super();

  @override
  CourseEntity fromModel(Rows model) {
    final courseentity = CourseEntity(
      id: model.id,
      name: model.name,
      description: model.description,
      imageUrl: model.imageUrl,
      level: model.level,
      reason: model.reason,
      purpose: model.purpose,
      otherDetails: model.otherDetails,
      defaultPrice: model.defaultPrice,
      coursePrice: model.coursePrice,
      visible: model.visible,
      topics: model.topics.map((x) => fromTopic(x)).toList(),
      categories: model.categories.map((x) => fromCategory(x)).toList(),
    );
    return courseentity;
  }

  @override
  CategoryEntity fromCategory(Categories categories) {
    final categoryentity = CategoryEntity(
      id: categories.id,
      title: categories.title,
      description: categories.description,
      key: categories.key,
    );
    return categoryentity;
  }

  @override
  TopicEntity fromTopic(Topics topic) {
    final topicentity = TopicEntity(
      id: topic.id,
      courseId: topic.courseId,
      orderCourse: topic.orderCourse,
      name: topic.name,
      nameFile: topic.nameFile,
      numberOfPages: topic.numberOfPages,
      description: topic.description,
      videoUrl: topic.videoUrl,
      type: topic.type,
      createdAt: topic.createdAt,
      updatedAt: topic.updatedAt,
    );
    return topicentity;
  }
}
