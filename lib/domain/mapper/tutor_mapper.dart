import 'package:smartstruct/smartstruct.dart';
import 'package:tutor_flutter_app/data/models/response/tutors_resp.dart';
import 'package:tutor_flutter_app/domain/entities/tutor/tutor_entity.dart';

part 'tutor_mapper.mapper.g.dart';

@Mapper()
abstract class TutorMapper {
  TutorEntity fromModel(Rows model);
}
