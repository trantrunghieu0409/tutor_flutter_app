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

  Future<void> getAll() async {
    var resp = await _tutorUsecase.getAll();

    state = resp.fold((l) {
      log(l.error);
      return state;
    }, (r) => r.sorted((a, b) => b.stars.compareTo(a.stars)));
  }
}

final tutorsProvider =
    StateNotifierProvider<TutorNotifier, List<TutorEntity>>((ref) {
  return TutorNotifier();
});
