import 'package:smartstruct/smartstruct.dart';
import 'package:tutor_flutter_app/data/models/response/course_resp.dart';
import 'package:tutor_flutter_app/domain/entities/course/category_entity.dart';
import 'package:tutor_flutter_app/domain/entities/course/course_entity.dart';
import 'package:tutor_flutter_app/domain/entities/course/topic_entity.dart';

part 'course_mapper.mapper.g.dart';

@Mapper()
abstract class CourseMapper {
  CourseEntity fromModel(Rows model);
  CategoryEntity fromCategory(Categories categories);
  TopicEntity fromTopic(Topics topic);
}
