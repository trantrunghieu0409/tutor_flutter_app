class BookingEntity {
  BookingEntity({
    required this.id,
    required this.isDeleted,
    required this.userId,
    required this.scheduleDetailId,
  });
  late final String id;
  late final bool isDeleted;
  late final String userId;
  late final String scheduleDetailId;
}
