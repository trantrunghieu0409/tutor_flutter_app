import 'package:tutor_flutter_app/data/datasources/local/account_local_datasource.dart';
import 'package:tutor_flutter_app/data/datasources/remote/history_remote_datasource.dart';
import 'package:tutor_flutter_app/data/models/request/cancel_schedule_req.dart';
import 'package:tutor_flutter_app/data/models/request/history_req.dart';
import 'package:tutor_flutter_app/data/models/response/history_resp.dart';

class HistoryRepository {
  final HistoryRemoteDatasource _historyRemoteDatasource;
  final AccountLocalDatasource _accountLocalDatasource;

  HistoryRepository(
      this._historyRemoteDatasource, this._accountLocalDatasource);

  Future<HistoryResp> getHistory(HistoryReq historyReq) async {
    var token = await _accountLocalDatasource.getToken();
    var resp =
        await _historyRemoteDatasource.getHistory(token.token, historyReq);

    return resp;
  }

  Future<int> getTotalLessonTime() async {
    var token = await _accountLocalDatasource.getToken();
    var resp = await _historyRemoteDatasource.getTotalLessonTime(token.token);

    return resp;
  }

  Future<bool> cancelSchedule(CancelScheduleReq cancelScheduleReq) async {
    var token = await _accountLocalDatasource.getToken();
    var resp = await _historyRemoteDatasource.cancelSchedule(
        token.token, cancelScheduleReq);

    return resp;
  }
}
