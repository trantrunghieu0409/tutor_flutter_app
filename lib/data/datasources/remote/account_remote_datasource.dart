import 'dart:convert';

import 'package:tutor_flutter_app/core/config/lettutor_config.dart';
import 'package:tutor_flutter_app/core/http/http_client.dart';
import 'package:tutor_flutter_app/data/models/response/login_resp.dart';

class AccountRemoteDatasource {
  final HttpClient _httpClient;

  AccountRemoteDatasource(this._httpClient);

  Future<LoginResp> login(
      {required String email, required String password}) async {
    final Map<String, dynamic> data = await _httpClient.post(
        path: LettutorConfig.login,
        body: jsonEncode({"email": email, "password": password}));
   
    return LoginResp.fromJson(data);
  }
}
