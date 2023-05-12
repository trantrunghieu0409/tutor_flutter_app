import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:tutor_flutter_app/core/injection/injector.dart';
import 'package:tutor_flutter_app/data/models/request/search_tutor_req.dart';
import 'package:tutor_flutter_app/domain/entities/tutor/tutor_entity.dart';
import 'package:riverpod/riverpod.dart';
import 'package:tutor_flutter_app/domain/usecases/tutor_usecase.dart';

class TutorNotifier extends StateNotifier<List<TutorEntity>> {
  late TutorUsecase _tutorUsecase;

  TutorNotifier() : super([]) {
    _tutorUsecase = Injector.resolve<TutorUsecase>();
    getAll();
  }

  int _total = 0;
  List<String> _favoriteIds = [];

  int get total => _total;

  Future<void> getAll() async {
    // call get all to get favorite tutors only
    var resp = await _tutorUsecase.getAll();

    resp.fold((l) {
      log(l.error);
      return state;
    }, (r) {
      _favoriteIds = r.favoriteIds!;
    });
  }

  Future<void> search(SearchTutorReq searchTutorReq) async {
    var resp = await _tutorUsecase.search(searchTutorReq);

    var res = resp.fold((l) {
      log(l.error);
      return state;
    }, (r) {
      _total = r.total;

      for (var element in r.tutors) {
        if (_favoriteIds.contains(element.userId)) {
          element.isFavorite = true;
        }
      }

      return _sortByFavoriteAndRating(r.tutors);
    });

    state = (searchTutorReq.page == 1) ? res : [...state, ...res];
  }
}

List<TutorEntity> _sortByFavoriteAndRating(List<TutorEntity> tutors) {
  return tutors.sorted((a, b) {
    if (a.isFavorite && !b.isFavorite) return -1;
    if (!a.isFavorite && b.isFavorite) return 1;
    return b.stars.compareTo(a.stars);
  });
}

final tutorsProvider =
    StateNotifierProvider<TutorNotifier, List<TutorEntity>>((ref) {
  return TutorNotifier();
});
