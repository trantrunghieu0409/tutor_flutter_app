import 'dart:developer';

import 'package:riverpod/riverpod.dart';
import 'package:tutor_flutter_app/core/injection/injector.dart';
import 'package:tutor_flutter_app/data/models/request/past_history_req.dart';
import 'package:tutor_flutter_app/domain/entities/history/past_history_entity.dart';
import 'package:tutor_flutter_app/domain/usecases/past_history_usecase.dart';

class PastHistoryNotifier extends StateNotifier<List<PastHistoryEntity>> {
  late PastHistoryUsecase _pastHistoryUsecase;

  PastHistoryNotifier() : super([]) {
    _pastHistoryUsecase = Injector.resolve<PastHistoryUsecase>();
    getHistory();
  }

  Future<void> getHistory() async {
    var resp = await _pastHistoryUsecase.getPastHistory(PastHistoryReq());

    state = resp.fold((l) {
      log(l.error);
      return state;
    }, (r) => r);
  }
}

final pastHistoryProvider =
    StateNotifierProvider<PastHistoryNotifier, List<PastHistoryEntity>>((ref) {
  return PastHistoryNotifier();
});
