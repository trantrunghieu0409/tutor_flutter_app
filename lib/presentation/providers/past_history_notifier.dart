import 'dart:developer';

import 'package:riverpod/riverpod.dart';
import 'package:tutor_flutter_app/core/injection/injector.dart';
import 'package:tutor_flutter_app/core/utils/datetime_utils.dart';
import 'package:tutor_flutter_app/data/models/request/history_req.dart';
import 'package:tutor_flutter_app/domain/entities/history/history_entity.dart';
import 'package:tutor_flutter_app/domain/entities/history/tutor_history_entity.dart';
import 'package:tutor_flutter_app/domain/usecases/history_usecase.dart';

class PastHistoryNotifier extends StateNotifier<List<TutorHistoryEntity>> {
  late HistoryUsecase _historyUsecase;

  PastHistoryNotifier() : super([]) {
    _historyUsecase = Injector.resolve<HistoryUsecase>();
    getHistory();
  }

  int _total = 0;
  int get total => _total;

  Future<void> getHistory(
      {int page = 1, int perPage = 10, HistoryReq? historyReq}) async {
    var resp = await _historyUsecase.getHistory(historyReq ??
        HistoryReq(
          dateTimeLte: DateTimeUtils.getTimestamp(DateTime.now()),
          perPage: perPage,
          page: page,
          sortBy: 'desc',
        ));

    var res = resp.fold((l) {
      log(l.error);
      return state;
    }, (r) {
      _total = r.total;
      return _groupRelatedSchedules(r.histories);
    });
    state = (page == 1) ? res : [...state, ...res];
  }

  List<TutorHistoryEntity> _groupRelatedSchedules(
      List<HistoryEntity> histories) {
    List<TutorHistoryEntity> res = [];

    for (var history in histories) {
      var tutorId = history.tutorId;

      int index = res.indexWhere((element) {
        Duration duration =
            DateTime.fromMillisecondsSinceEpoch(element.startTimestamp)
                .difference(DateTime.fromMillisecondsSinceEpoch(
                    history.scheduleDetailInfo.endPeriodTimestamp));

        return element.tutorInfo.id == tutorId &&
            duration.compareTo(const Duration(minutes: 10)) <= 0;
      });
      if (index == -1) {
        res.add(TutorHistoryEntity(
            tutorInfo: history.tutorInfo,
            histories: [history],
            scheduleHitories: [history.scheduleDetailInfo.scheduleInfo],
            date: history.date));
      } else {
        res[index]
            .scheduleHitories
            .add(history.scheduleDetailInfo.scheduleInfo);

        res[index].histories.add(history);
      }
    }

    return res;
  }
}

final pastHistoryProvider =
    StateNotifierProvider<PastHistoryNotifier, List<TutorHistoryEntity>>((ref) {
  return PastHistoryNotifier();
});
