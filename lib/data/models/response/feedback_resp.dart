import 'package:tutor_flutter_app/data/models/response/tutors_resp.dart';

class FeedbackResp {
  FeedbackResp({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data data;

  FeedbackResp.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  Data({
    required this.count,
    required this.rows,
  });
  late final int count;
  late final List<Feedbacks> rows;

  Data.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    rows = List.from(json['rows']).map((e) => Feedbacks.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['count'] = count;
    data['rows'] = rows.map((e) => e.toJson()).toList();
    return data;
  }
}
