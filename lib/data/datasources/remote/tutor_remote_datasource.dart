import 'dart:convert';

import 'package:tutor_flutter_app/core/config/lettutor_config.dart';
import 'package:tutor_flutter_app/core/http/http_client.dart';
import 'package:tutor_flutter_app/data/models/request/search_tutor_req.dart';
import 'package:tutor_flutter_app/data/models/response/booking_resp.dart';
import 'package:tutor_flutter_app/data/models/response/feedback_resp.dart';
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

  Future<Tutors> search(String token, SearchTutorReq searchTutorReq) async {
    final Map<String, dynamic> data = await _httpClient.post(
        path: LettutorConfig.searchTutors,
        body: jsonEncode({
          "filters": {
            "specialties": searchTutorReq.specialities,
            "date": null,
            if (searchTutorReq.isVietnamese != null &&
                searchTutorReq.isVietnamese == true)
              "nationality": {"isVietNamese": true},
            "tutoringTimeAvailable": [null, null]
          },
          "search": searchTutorReq.name,
          "page": searchTutorReq.page,
          "perPage": searchTutorReq.perPage
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

  Future<BookingResp> bookSchedule(
      String token, String scheduleDetailId, String note) async {
    final Map<String, dynamic> data = await _httpClient.post(
        path: LettutorConfig.bookSchedule,
        body: jsonEncode({
          "scheduleDetailIds": [scheduleDetailId],
          "note": note
        }),
        auth: true,
        token: token);

    return BookingResp.fromJson(data);
  }

  Future<bool> toggleFavorite(String token, String tutorId) async {
    await _httpClient.post(
        path: LettutorConfig.toggleFavorite,
        body: jsonEncode({
          "tutorId": tutorId,
        }),
        auth: true,
        token: token);

    return true;
  }

  Future<FeedbackResp> getReviews(String token, String tutorId) async {
    final Map<String, dynamic> data = await _httpClient.get(
        path: "${LettutorConfig.getReviews}/$tutorId?page=1&perPage=100",
        auth: true,
        token: token);

    return FeedbackResp.fromJson(data);
  }
}
