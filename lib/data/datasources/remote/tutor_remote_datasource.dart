import 'dart:convert';

import 'package:tutor_flutter_app/core/config/lettutor_config.dart';
import 'package:tutor_flutter_app/core/http/http_client.dart';
import 'package:tutor_flutter_app/data/models/response/schedule_resp.dart';
import 'package:tutor_flutter_app/data/models/response/tutors_resp.dart';

class TutorRemoteDatasource {
  final HttpClient _httpClient;

  TutorRemoteDatasource(this._httpClient);

  Future<TutorsResp> getAll(String token) async {
    final Map<String, dynamic> data = await _httpClient.get(
        path: LettutorConfig.getAllTutors, auth: true, token: token);

    return TutorsResp.fromJson(data);
  }

  Future<Tutors> search(String token, List<String> specialities, String name,
      bool? isVietnamese) async {
    final Map<String, dynamic> data = await _httpClient.post(
        path: LettutorConfig.searchTutors,
        body: jsonEncode({
          "filters": {
            "specialties": specialities,
            "date": null,
            if (isVietnamese != null && isVietnamese == true)
              "nationality": {"isVietNamese": true},
            "tutoringTimeAvailable": [null, null]
          },
          "search": name,
          "page": "1",
          "perPage": 10
        }),
        auth: true,
        token: token);

    return Tutors.fromJson(data);
  }

  Future<ScheduleResp> getScheduleByTutorId(String token, String tutorId,
      int startTimestamp, int endTimestamp) async {
    final Map<String, dynamic> data = await _httpClient.get(
        path:
            "${LettutorConfig.scheduleByTutorIdPath}?tutorId=$tutorId&startTimestamp=$startTimestamp&endTimestamp=$endTimestamp",
        auth: true,
        token: token);

    return ScheduleResp.fromJson(data);
  }
}
