import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:tutor_flutter_app/core/injection/injector.dart';
import 'package:tutor_flutter_app/data/models/request/base_req.dart';
import 'package:tutor_flutter_app/domain/entities/course/course_entity.dart';
import 'package:riverpod/riverpod.dart';
import 'package:tutor_flutter_app/domain/usecases/course_usecase.dart';

class CourseNotifier extends StateNotifier<List<CourseEntity>> {
  late CourseUsecase _courseUsecase;

  late int _total = 0;
  int get total => _total;

  CourseNotifier() : super([]) {
    _courseUsecase = Injector.resolve<CourseUsecase>();
    getCourses();
  }

  Future<void> getCourses({BaseReq? baseReq}) async {
    var resp = await _courseUsecase.getCourses(baseReq ?? BaseReq());

    state = resp.fold((l) {
      log(l.error);
      return state;
    }, (r) {
      _total = r.total;
      return _sortTopicsByOrderCourse((baseReq == null || baseReq.page == 1)
          ? r.courses
          : [...state, ...r.courses]);
    });
  }

  _sortTopicsByOrderCourse(List<CourseEntity> courses) {
    for (var course in courses) {
      course.topics = course.topics
          .sorted((a, b) => a.orderCourse.compareTo(b.orderCourse));
    }

    return courses;
  }
}

final coursesProvider =
    StateNotifierProvider<CourseNotifier, List<CourseEntity>>((ref) {
  return CourseNotifier();
});
