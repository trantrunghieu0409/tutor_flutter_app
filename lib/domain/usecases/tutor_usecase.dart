import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:tutor_flutter_app/core/exceptions/server_exception.dart';
import 'package:tutor_flutter_app/data/repositories/tutor_repository.dart';
import 'package:tutor_flutter_app/domain/entities/failure_entity.dart';
import 'package:tutor_flutter_app/domain/entities/tutor/tutor_entity.dart';
import 'package:tutor_flutter_app/domain/entities/tutor/tutors_result.dart';
import 'package:tutor_flutter_app/domain/mapper/tutor_mapper.dart';

class TutorUsecase {
  late final TutorRepository _tutorRepository;

  TutorUsecase(this._tutorRepository);

  final TutorMapper _tutorMapper = TutorMapperImpl();

  Future<Either<FailureEntity, TutorsResult>> getAll() async {
    try {
      var resp = await _tutorRepository.getAll();
      var favoriteTutorIds = resp.favoriteTutor.map((e) => e.secondId).toList();
      var tutors = resp.tutors.rows
          .map((event) => _tutorMapper.fromModel(event))
          .toList();

      return right(TutorsResult(total: resp.tutors.count, tutors:tutors, favoriteIds: favoriteTutorIds));
    } on ServerException catch (e) {
      return left(FailureEntity(e.message));
    } catch (e) {
      log(e.toString());
      return left(FailureEntity(e.toString()));
    }
  }

  Future<Either<FailureEntity, TutorsResult>> search(
      List<String> specialities, String name, bool? isVietnamese) async {
    try {
      var resp =
          await _tutorRepository.search(specialities, name, isVietnamese);

      var tutors = resp.rows
          .map((event) => _tutorMapper.fromModel(event))
          .toList();

      return right(TutorsResult(total: resp.count, tutors: tutors));
    } on ServerException catch (e) {
      return left(FailureEntity(e.message));
    } catch (e) {
      log(e.toString());
      return left(FailureEntity(e.toString()));
    }
  }
}
