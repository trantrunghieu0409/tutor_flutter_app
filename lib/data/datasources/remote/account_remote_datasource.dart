import 'dart:convert';

import 'package:tutor_flutter_app/core/config/lettutor_config.dart';
import 'package:tutor_flutter_app/core/http/http_client.dart';
import 'package:tutor_flutter_app/data/models/request/update_user_req.dart';
import 'package:tutor_flutter_app/data/models/response/login_resp.dart';
import 'package:tutor_flutter_app/data/models/response/user_info_resp.dart';

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

  Future<UserInfoResp> getUserInfo(String token) async {
    final Map<String, dynamic> data = await _httpClient.get(
        path: LettutorConfig.getUserInfo, auth: true, token: token);

    return UserInfoResp.fromJson(data);
  }

  Future<UserInfoResp> updateUserInfo(
      String token, UpdateUserReq updateUserReq) async {
    final Map<String, dynamic> data = await _httpClient.put(
        path: LettutorConfig.putUserInfo,
        body: jsonEncode(updateUserReq.toJson()),
        auth: true,
        token: token);

    return UserInfoResp.fromJson(data);
  }
}
