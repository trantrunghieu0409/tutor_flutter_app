class BookingResp {
  BookingResp({
    required this.message,
    required this.data,
  });
  late final String message;
  late final List<Data> data;

  BookingResp.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }
}

class Data {
  Data({
    required this.createdAtTimeStamp,
    required this.updatedAtTimeStamp,
    required this.id,
    required this.isDeleted,
    required this.userId,
    required this.scheduleDetailId,
    required this.studentRequest,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int createdAtTimeStamp;
  late final int updatedAtTimeStamp;
  late final String id;
  late final bool isDeleted;
  late final String userId;
  late final String scheduleDetailId;
  late final String studentRequest;
  late final String createdAt;
  late final String updatedAt;

  Data.fromJson(Map<String, dynamic> json) {
    createdAtTimeStamp = json['createdAtTimeStamp'];
    updatedAtTimeStamp = json['updatedAtTimeStamp'];
    id = json['id'];
    isDeleted = json['isDeleted'];
    userId = json['userId'];
    scheduleDetailId = json['scheduleDetailId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['createdAtTimeStamp'] = createdAtTimeStamp;
    data['updatedAtTimeStamp'] = updatedAtTimeStamp;
    data['id'] = id;
    data['isDeleted'] = isDeleted;
    data['userId'] = userId;
    data['scheduleDetailId'] = scheduleDetailId;
    return data;
  }
}
