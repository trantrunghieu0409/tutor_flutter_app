// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learn_topic_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class LearnTopicMapperImpl extends LearnTopicMapper {
  LearnTopicMapperImpl() : super();

  @override
  LearnTopicEntity fromModel(LearnTopic model) {
    final learntopicentity = LearnTopicEntity(
      id: model.id,
      key: model.key,
      name: model.name,
    );
    return learntopicentity;
  }
}
