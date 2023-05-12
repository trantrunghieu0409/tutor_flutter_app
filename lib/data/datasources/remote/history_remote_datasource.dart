import 'dart:convert';

import 'package:tutor_flutter_app/core/config/lettutor_config.dart';
import 'package:tutor_flutter_app/core/http/http_client.dart';
import 'package:tutor_flutter_app/data/models/request/cancel_schedule_req.dart';
import 'package:tutor_flutter_app/data/models/request/history_req.dart';
import 'package:tutor_flutter_app/data/models/response/history_resp.dart';

class HistoryRemoteDatasource {
  final HttpClient _httpClient;

  HistoryRemoteDatasource(this._httpClient);

  Future<HistoryResp> getHistory(String token, HistoryReq historyReq) async {
    final Map<String, dynamic> data = await _httpClient.get(
        path:
            "${LettutorConfig.getHistory}?page=${historyReq.page}&perPage=${historyReq.perPage}"
            "&dateTimeGte=${historyReq.dateTimeGte}&orderBy=${historyReq.orderBy}&sortBy=${historyReq.sortBy}",
        auth: true,
        token: token);

    return HistoryResp.fromJson(data);
  }

  Future<int> getTotalLessonTime(String token) async {
    final Map<String, dynamic> data = await _httpClient.get(
        path: LettutorConfig.getTotalLessonTime, auth: true, token: token);

    return data['total'] ?? 0;
  }

  cancelSchedule(String token, CancelScheduleReq cancelScheduleReq) async {
    await _httpClient.delete(
        path: LettutorConfig.cancelSchedule,body: jsonEncode({
          "scheduleDetailId": cancelScheduleReq.scheduleDetailId,
          "cancelInfo": {
            "cancelReasonId": cancelScheduleReq.cancelReasonId
          }
        }), auth: true, token: token);
    return true;
  }
}
