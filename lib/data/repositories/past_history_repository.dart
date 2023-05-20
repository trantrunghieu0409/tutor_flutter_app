import 'package:tutor_flutter_app/data/datasources/local/account_local_datasource.dart';
import 'package:tutor_flutter_app/data/datasources/remote/past_history_remote_datasource.dart';
import 'package:tutor_flutter_app/data/models/request/past_history_req.dart';
import 'package:tutor_flutter_app/data/models/response/past_history_resp.dart';

class PastHistoryRepository {
  final PastHistoryRemoteDatasource _pastHistoryRemoteDatasource;
  final AccountLocalDatasource _accountLocalDatasource;

  PastHistoryRepository(
      this._pastHistoryRemoteDatasource, this._accountLocalDatasource);

  Future<PastHistoryResp> getPastHistory(PastHistoryReq pastHistoryReq) async {
    var token = await _accountLocalDatasource.getToken();
    var resp = await _pastHistoryRemoteDatasource.getPastHistory(
        token.token, pastHistoryReq);

    return resp;
  }
}
