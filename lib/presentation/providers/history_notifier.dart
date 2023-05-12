import 'dart:developer';

import 'package:riverpod/riverpod.dart';
import 'package:tutor_flutter_app/core/injection/injector.dart';
import 'package:tutor_flutter_app/core/utils/datetime_utils.dart';
import 'package:tutor_flutter_app/data/models/request/history_req.dart';
import 'package:tutor_flutter_app/domain/entities/history/history_entity.dart';
import 'package:tutor_flutter_app/domain/entities/history/tutor_history_entity.dart';
import 'package:tutor_flutter_app/domain/usecases/history_usecase.dart';

class HistoryNotifier extends StateNotifier<List<TutorHistoryEntity>> {
  late HistoryUsecase _historyUsecase;

  int _total = 0;
  int get total => _total;

  HistoryNotifier() : super([]) {
    _historyUsecase = Injector.resolve<HistoryUsecase>();
    getHistory();
  }

  Future<void> getHistory({HistoryReq? historyReq}) async {
    var resp = await _historyUsecase.getHistory(historyReq ??
        HistoryReq(dateTimeGte: DateTimeUtils.getTimestamp(DateTime.now())));

    var res = resp.fold((l) {
      log(l.error);
      return state;
    }, (r) {
      _total = r.total;
      return _groupRelatedSchedules(r.histories);
    });
    state =
        (historyReq == null || historyReq.page == 1) ? res : [...state, ...res];
  }

  List<TutorHistoryEntity> _groupRelatedSchedules(
      List<HistoryEntity> histories) {
    List<TutorHistoryEntity> res = [];

    for (var history in histories) {
      var tutorId = history.tutorId;

      int index = res.indexWhere((element) {
        Duration duration = DateTime.fromMillisecondsSinceEpoch(
                history.scheduleDetailInfo.startPeriodTimestamp)
            .difference(
                DateTime.fromMillisecondsSinceEpoch(element.endTimestamp));

        return element.tutorInfo.id == tutorId &&
            duration.compareTo(const Duration(minutes: 5)) <= 0;
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

final historyProvider =
    StateNotifierProvider<HistoryNotifier, List<TutorHistoryEntity>>((ref) {
  return HistoryNotifier();
});
