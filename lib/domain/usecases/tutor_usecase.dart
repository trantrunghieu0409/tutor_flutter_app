import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:tutor_flutter_app/core/exceptions/server_exception.dart';
import 'package:tutor_flutter_app/data/repositories/tutor_repository.dart';
import 'package:tutor_flutter_app/domain/entities/failure_entity.dart';
import 'package:tutor_flutter_app/domain/entities/tutor/tutor_entity.dart';
import 'package:tutor_flutter_app/domain/mapper/tutor_mapper.dart';

class TutorUsecase {
  late final TutorRepository _tutorRepository;

  TutorUsecase(this._tutorRepository);

  final TutorMapper _tutorMapper = TutorMapperImpl();

  Future<Either<FailureEntity, List<TutorEntity>>> getAll() async {
    try {
      var resp = await _tutorRepository.getAll();
      var favoriteTutorIds = resp.favoriteTutor.map((e) => e.secondId).toList();
      var tutors = resp.tutors.rows
          .map((event) => _tutorMapper.fromModel(event))
          .toList();

      for (var element in tutors) {
        if (favoriteTutorIds.contains(element.id)) {
          element.isFavorite = true;
        }
      }
      for (var element in tutors) {
        if (element.isFavorite) log(element.name);
      }
      return right(tutors);
      //return right(_userMapper.fromUser(resp.user));
    } on ServerException catch (e) {
      return left(FailureEntity(e.message));
    } catch (e) {
      log(e.toString());
      return left(FailureEntity(e.toString()));
    }
  }
}
