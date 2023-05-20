import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tutor_flutter_app/core/config/lettutor_config.dart';
import 'package:tutor_flutter_app/core/http/dio_client.dart';
import 'package:tutor_flutter_app/core/http/http_client.dart';
import 'package:tutor_flutter_app/data/models/request/become_tutor_req.dart';
import 'package:tutor_flutter_app/data/models/request/update_user_req.dart';
import 'package:tutor_flutter_app/data/models/response/login_resp.dart';
import 'package:tutor_flutter_app/data/models/response/user_info_resp.dart';

class AccountRemoteDatasource {
  final HttpClient _httpClient;
  final DioClient _dioClient;

  AccountRemoteDatasource(this._httpClient, this._dioClient);

  Future<LoginResp> login(
      {required String email, required String password}) async {
    final Map<String, dynamic> data = await _httpClient.post(
        path: LettutorConfig.login,
        body: jsonEncode({"email": email, "password": password}));

    return LoginResp.fromJson(data);
  }

  Future<void> register(
      {required String email, required String password}) async {
    await _httpClient.post(
        path: LettutorConfig.register,
        body: jsonEncode({"email": email, "password": password}));
  }

  Future<void> forgotPassword(String email) async {
    await _httpClient.post(
        path: LettutorConfig.forgotPassword,
        body: jsonEncode({"email": email}));
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

  Future<bool> uploadAvatar(String token, XFile avatar) async {
    FormData formData = FormData.fromMap({
      "avatar": await MultipartFile.fromFile(avatar.path,
          filename: avatar.path.split("/").last),
    });
    await _dioClient.post(
        path: LettutorConfig.uploadAvatar,
        body: formData,
        auth: true,
        token: token);

    return true;
  }

  Future<bool> becomeTutor(String token, BecomeTutorReq becomeTutorReq) async {
    FormData formData = FormData.fromMap({
      "name": becomeTutorReq.name,
      "interests": becomeTutorReq.interests,
      "education": becomeTutorReq.education,
      "bio": becomeTutorReq.bio,
      "price": 50000,
      if (becomeTutorReq.avatar != null)
        "avatar": await MultipartFile.fromFile(becomeTutorReq.avatar!.path,
            filename: becomeTutorReq.avatar!.path.split("/").last),
    });
    await _dioClient.post(
        path: LettutorConfig.becomeTutor,
        body: formData,
        auth: true,
        token: token);

    return true;
  }
}
