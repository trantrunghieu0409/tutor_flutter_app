import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:tutor_flutter_app/core/injection/injector.dart';
import 'package:tutor_flutter_app/domain/entities/schedule/schedule_entity.dart';
import 'package:riverpod/riverpod.dart';
import 'package:tutor_flutter_app/domain/usecases/tutor_usecase.dart';

class ScheduleNotifier extends StateNotifier<List<ScheduleEntity>> {
  late TutorUsecase _tutorUsecase;

  ScheduleNotifier() : super([]) {
    _tutorUsecase = Injector.resolve<TutorUsecase>();
  }

  Future<void> getScheduleByTutorId(
      String tutorId, int startTimestamp, int endTimestamp) async {
    var resp = await _tutorUsecase.getScheduleByTutorId(
        tutorId, startTimestamp, endTimestamp);

    state = resp.fold((l) {
      log(l.error);
      return state;
    }, (r) => r.sorted((a, b) => a.startTimestamp.compareTo(b.startTimestamp)));
  }

  Future<bool> bookSchedule(String scheduleDetailId, String note) async {
    var resp = await _tutorUsecase.bookSchedule(scheduleDetailId, note);
    return resp.isRight();
  }
}

final schedulesProvider =
    StateNotifierProvider<ScheduleNotifier, List<ScheduleEntity>>((ref) {
  return ScheduleNotifier();
});
