import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:tutor_flutter_app/core/injection/injector.dart';
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
    var resp = await _tutorUsecase.getAll();

    state = resp.fold((l) {
      log(l.error);
      return state;
    }, (r) {
      _total = r.total;
      _favoriteIds = r.favoriteIds!;

      for (var element in r.tutors) {
        if (_favoriteIds.contains(element.id)) {
          element.isFavorite = true;
        }
      }

      return _sortByFavoriteAndRating(r.tutors);
    });
  }

  Future<void> search(
      List<String> specialities, String name, bool? isVietnamese) async {
    var resp = await _tutorUsecase.search(specialities, name, isVietnamese);

    state = resp.fold((l) {
      log(l.error);
      return state;
    }, (r) {
      _total = r.total;
      return _sortByFavoriteAndRating(r.tutors);
    });
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
