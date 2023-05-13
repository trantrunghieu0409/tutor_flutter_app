import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:tutor_flutter_app/core/exceptions/server_exception.dart';
import 'package:tutor_flutter_app/data/models/request/search_tutor_req.dart';
import 'package:tutor_flutter_app/data/repositories/tutor_repository.dart';
import 'package:tutor_flutter_app/domain/entities/common/failure_entity.dart';
import 'package:tutor_flutter_app/domain/entities/schedule/booking_entity.dart';
import 'package:tutor_flutter_app/domain/entities/schedule/schedule_entity.dart';
import 'package:tutor_flutter_app/domain/entities/tutor/feedback_entity.dart';
import 'package:tutor_flutter_app/domain/entities/tutor/tutors_result.dart';
import 'package:tutor_flutter_app/domain/mapper/schedule_mapper.dart';
import 'package:tutor_flutter_app/domain/mapper/tutor_mapper.dart';

class TutorUsecase {
  late final TutorRepository _tutorRepository;

  TutorUsecase(this._tutorRepository);

  final TutorMapper _tutorMapper = TutorMapperImpl();
  final ScheduleMapper _scheduleMapper = ScheduleMapperImpl();

  Future<Either<FailureEntity, TutorsResult>> getAll() async {
    try {
      var resp = await _tutorRepository.getAll();
      var favoriteTutorIds = resp.favoriteTutor.map((e) => e.secondId).toList();
      var tutors = resp.tutors.rows
          .map((event) => _tutorMapper.fromModel(event))
          .toList();

      return right(TutorsResult(
          total: resp.tutors.count,
          tutors: tutors,
          favoriteIds: favoriteTutorIds));
    } on ServerException catch (e) {
      return left(FailureEntity(e.message));
    } catch (e) {
      log(e.toString());
      return left(FailureEntity(e.toString()));
    }
  }

  Future<Either<FailureEntity, TutorsResult>> search(
      SearchTutorReq searchTutorReq) async {
    try {
      var resp = await _tutorRepository.search(searchTutorReq);

      var tutors =
          resp.rows.map((event) => _tutorMapper.fromModel(event)).toList();

      return right(TutorsResult(total: resp.count, tutors: tutors));
    } on ServerException catch (e) {
      return left(FailureEntity(e.message));
    } catch (e) {
      log(e.toString());
      return left(FailureEntity(e.toString()));
    }
  }

  Future<Either<FailureEntity, List<ScheduleEntity>>> getScheduleByTutorId(
      String tutorId, int startTimestamp, int endTimestamp) async {
    try {
      var resp = await _tutorRepository.getScheduleByTutorId(
          tutorId, startTimestamp, endTimestamp);

      var schedules = resp.scheduleOfTutor
          .map((event) => _scheduleMapper.fromModel(event))
          .toList();

      return right(schedules);
    } on ServerException catch (e) {
      return left(FailureEntity(e.message));
    } catch (e) {
      log(e.toString());
      return left(FailureEntity(e.toString()));
    }
  }

  Future<Either<FailureEntity, List<BookingEntity>>> bookSchedule(
      String scheduleDetailId, String note) async {
    try {
      var resp = await _tutorRepository.bookSchedule(scheduleDetailId, note);

      var bookings =
          resp.data.map((event) => _scheduleMapper.fromBooking(event)).toList();

      return right(bookings);
    } on ServerException catch (e) {
      return left(FailureEntity(e.message));
    } catch (e) {
      log(e.toString());
      return left(FailureEntity(e.toString()));
    }
  }

  Future<Either<FailureEntity, bool>> toggleFavorite(String tutorId) async {
    try {
      await _tutorRepository.toggleFavorite(tutorId);

      return right(true);
    } on ServerException catch (e) {
      return left(FailureEntity(e.message));
    } catch (e) {
      log(e.toString());
      return left(FailureEntity(e.toString()));
    }
  }

  Future<Either<FailureEntity, List<FeedbackEntity>>> getReviews(
      String tutorId) async {
    try {
      var resp = await _tutorRepository.getReviews(tutorId);

      return right(resp.data.rows
          .map((feedback) => _tutorMapper.fromFeedback(feedback))
          .toList());
    } on ServerException catch (e) {
      return left(FailureEntity(e.message));
    } catch (e) {
      log(e.toString());
      return left(FailureEntity(e.toString()));
    }
  }
}
