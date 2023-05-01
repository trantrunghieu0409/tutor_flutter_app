import 'dart:developer';

import 'package:tutor_flutter_app/core/injection/injector.dart';
import 'package:tutor_flutter_app/data/models/request/base_req.dart';
import 'package:tutor_flutter_app/domain/entities/course/book_entity.dart';
import 'package:riverpod/riverpod.dart';
import 'package:tutor_flutter_app/domain/usecases/course_usecase.dart';

class BookNotifier extends StateNotifier<List<BookEntity>> {
  late CourseUsecase _courseUsecase;

  BookNotifier() : super([]) {
    _courseUsecase = Injector.resolve<CourseUsecase>();
  }

  Future<void> getEBooks() async {
    var resp = await _courseUsecase.getEBooks(BaseReq());

    state = resp.fold((l) {
      log(l.error);
      return state;
    }, (r) => r);
  }
}

final booksProvider =
    StateNotifierProvider<BookNotifier, List<BookEntity>>((ref) {
  return BookNotifier();
});
