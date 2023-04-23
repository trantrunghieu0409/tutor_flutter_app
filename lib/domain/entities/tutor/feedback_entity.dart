import 'package:tutor_flutter_app/data/models/response/tutors_resp.dart';

class FeedbackEntity {
  FeedbackEntity({
    required this.id,
     this.bookingId,
    required this.firstId,
    required this.secondId,
    required this.rating,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.firstInfo,
  });
  late final String id;
  late final String? bookingId;
  late final String firstId;
  late final String secondId;
  late final int rating;
  late final String content;
  late final String createdAt;
  late final String updatedAt;
  late final FirstInfo firstInfo;
}