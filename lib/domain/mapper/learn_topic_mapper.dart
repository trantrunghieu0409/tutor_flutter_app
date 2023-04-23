
import 'package:smartstruct/smartstruct.dart';
import 'package:tutor_flutter_app/data/models/response/login_resp.dart';
import 'package:tutor_flutter_app/domain/entities/authentication/learn_topic_entity.dart';

part 'learn_topic_mapper.mapper.g.dart';

@Mapper()
abstract class LearnTopicMapper {
    LearnTopicEntity fromModel(LearnTopic model);
}