import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:tutor_flutter_app/core/exceptions/server_exception.dart';
import 'package:tutor_flutter_app/data/models/request/base_req.dart';
import 'package:tutor_flutter_app/data/models/request/search_course_req.dart';
import 'package:tutor_flutter_app/data/repositories/course_repository.dart';
import 'package:tutor_flutter_app/domain/entities/course/book_entity.dart';
import 'package:tutor_flutter_app/domain/entities/common/failure_entity.dart';
import 'package:tutor_flutter_app/domain/entities/course/category_entity.dart';
import 'package:tutor_flutter_app/domain/entities/course/course_result.dart';
import 'package:tutor_flutter_app/domain/mapper/book_mapper.dart';
import 'package:tutor_flutter_app/domain/mapper/course_mapper.dart';

class CourseUsecase {
  late final CourseRepository _courseRepository;

  CourseUsecase(this._courseRepository);

  final CourseMapper _courseMapper = CourseMapperImpl();
  final BookMapper _bookMapper = BookMapperImpl();

  Future<Either<FailureEntity, CourseResult>> getCourses(
      SearchCourseReq searchCourseReq) async {
    try {
      var resp = await _courseRepository.getCourses(searchCourseReq);

      return right(CourseResult(
          total: resp.data.count,
          courses:
              resp.data.rows.map((e) => _courseMapper.fromModel(e)).toList()));
    } on ServerException catch (e) {
      return left(FailureEntity(e.message));
    } catch (e) {
      log(e.toString());
      return left(FailureEntity(e.toString()));
    }
  }

  Future<Either<FailureEntity, List<BookEntity>>> getEBooks(
      BaseReq baseReq) async {
    try {
      var resp = await _courseRepository.getEBooks(baseReq);

      return right(
          resp.data.rows.map((e) => _bookMapper.fromModel(e)).toList());
    } on ServerException catch (e) {
      return left(FailureEntity(e.message));
    } catch (e) {
      log(e.toString());
      return left(FailureEntity(e.toString()));
    }
  }

  Future<Either<FailureEntity, List<CategoryEntity>>> getCategories() async {
    try {
      var resp = await _courseRepository.getCategories();

      return right(
          resp.rows.map((e) => _courseMapper.fromCategory(e)).toList());
    } on ServerException catch (e) {
      return left(FailureEntity(e.message));
    } catch (e) {
      log(e.toString());
      return left(FailureEntity(e.toString()));
    }
  }
}
