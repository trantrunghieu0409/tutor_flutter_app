
class CancelScheduleReq {
  final String scheduleDetailId;
  final int cancelReasonId;
  CancelScheduleReq({
    required this.scheduleDetailId,
    required this.cancelReasonId,
  });
}
