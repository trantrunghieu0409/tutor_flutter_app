import 'package:tutor_flutter_app/domain/entities/tutor/tutor_entity.dart';

class TutorsResult {
  int total = 0;
  List<TutorEntity> tutors = [];
  List<String>? favoriteIds = [];
  int? page = 1;
  int? perPage = 10;

  TutorsResult(
      {required this.total,
      required this.tutors,
      this.favoriteIds,
      this.page,
      this.perPage});
}
