import 'package:tutor_flutter_app/domain/entities/tutor/first_info_entity.dart';

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
    this.firstInfo,
  });
  late final String id;
  late final String? bookingId;
  late final String firstId;
  late final String secondId;
  late final int rating;
  late final String content;
  late final String createdAt;
  late final String updatedAt;
  late final InfoEntity? firstInfo;
}
