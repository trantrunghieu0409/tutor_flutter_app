import 'package:tutor_flutter_app/core/config/lettutor_config.dart';
import 'package:tutor_flutter_app/core/http/http_client.dart';
import 'package:tutor_flutter_app/data/models/response/tutors_resp.dart';

class TutorRemoteDatasource {
  final HttpClient _httpClient;

  TutorRemoteDatasource(this._httpClient);

  Future<TutorsResp> getAll(String token) async {
    final Map<String, dynamic> data = await _httpClient.get(
        path: LettutorConfig.getAllTutors, auth: true, token: token);

    return TutorsResp.fromJson(data);
  }
}
