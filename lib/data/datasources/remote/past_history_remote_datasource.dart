import 'package:tutor_flutter_app/core/config/lettutor_config.dart';
import 'package:tutor_flutter_app/core/http/http_client.dart';
import 'package:tutor_flutter_app/data/models/request/past_history_req.dart';
import 'package:tutor_flutter_app/data/models/response/past_history_resp.dart';

class PastHistoryRemoteDatasource {
  final HttpClient _httpClient;

  PastHistoryRemoteDatasource(this._httpClient);

  Future<PastHistoryResp> getPastHistory(
      String token, PastHistoryReq pastHistoryReq) async {
    final Map<String, dynamic> data = await _httpClient.get(
        path:
            "${LettutorConfig.getPastHistory}?page=${pastHistoryReq.page}&perPage=${pastHistoryReq.perPage}&isTutor=${pastHistoryReq.isTutor}",
        auth: true,
        token: token);

    return PastHistoryResp.fromJson(data);
  }
}
