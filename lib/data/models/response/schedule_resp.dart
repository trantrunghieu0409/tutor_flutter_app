class ScheduleResp {
  ScheduleResp({
    required this.message,
    required this.scheduleOfTutor,
  });
  late final String message;
  late final List<ScheduleOfTutor> scheduleOfTutor;
  
  ScheduleResp.fromJson(Map<String, dynamic> json){
    message = json['message'];
    scheduleOfTutor = List.from(json['scheduleOfTutor']).map((e)=>ScheduleOfTutor.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['scheduleOfTutor'] = scheduleOfTutor.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ScheduleOfTutor {
  ScheduleOfTutor({
    required this.id,
    required this.tutorId,
    required this.startTime,
    required this.endTime,
    required this.startTimestamp,
    required this.endTimestamp,
    required this.createdAt,
    required this.isBooked,
    required this.scheduleDetails,
  });
  late final String id;
  late final String tutorId;
  late final String startTime;
  late final String endTime;
  late final int startTimestamp;
  late final int endTimestamp;
  late final String createdAt;
  late final bool isBooked;
  late final List<ScheduleDetails> scheduleDetails;
  
  ScheduleOfTutor.fromJson(Map<String, dynamic> json){
    id = json['id'];
    tutorId = json['tutorId'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    startTimestamp = json['startTimestamp'];
    endTimestamp = json['endTimestamp'];
    createdAt = json['createdAt'];
    isBooked = json['isBooked'];
    scheduleDetails = List.from(json['scheduleDetails']).map((e)=>ScheduleDetails.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['tutorId'] = tutorId;
    _data['startTime'] = startTime;
    _data['endTime'] = endTime;
    _data['startTimestamp'] = startTimestamp;
    _data['endTimestamp'] = endTimestamp;
    _data['createdAt'] = createdAt;
    _data['isBooked'] = isBooked;
    _data['scheduleDetails'] = scheduleDetails.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ScheduleDetails {
  ScheduleDetails({
    required this.startPeriodTimestamp,
    required this.endPeriodTimestamp,
    required this.id,
    required this.scheduleId,
    required this.startPeriod,
    required this.endPeriod,
    required this.createdAt,
    required this.updatedAt,
    required this.bookingInfo,
    required this.isBooked,
  });
  late final int startPeriodTimestamp;
  late final int endPeriodTimestamp;
  late final String id;
  late final String scheduleId;
  late final String startPeriod;
  late final String endPeriod;
  late final String createdAt;
  late final String updatedAt;
  late final List<BookingInfo> bookingInfo;
  late final bool isBooked;
  
  ScheduleDetails.fromJson(Map<String, dynamic> json){
    startPeriodTimestamp = json['startPeriodTimestamp'];
    endPeriodTimestamp = json['endPeriodTimestamp'];
    id = json['id'];
    scheduleId = json['scheduleId'];
    startPeriod = json['startPeriod'];
    endPeriod = json['endPeriod'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    bookingInfo = List.from(json['bookingInfo']).map((e)=>BookingInfo.fromJson(e)).toList();
    isBooked = json['isBooked'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['startPeriodTimestamp'] = startPeriodTimestamp;
    _data['endPeriodTimestamp'] = endPeriodTimestamp;
    _data['id'] = id;
    _data['scheduleId'] = scheduleId;
    _data['startPeriod'] = startPeriod;
    _data['endPeriod'] = endPeriod;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['bookingInfo'] = bookingInfo.map((e)=>e.toJson()).toList();
    _data['isBooked'] = isBooked;
    return _data;
  }
}

class BookingInfo {
  BookingInfo({
    required this.createdAtTimeStamp,
    required this.updatedAtTimeStamp,
    required this.id,
    required this.isDeleted,
    required this.createdAt,
    required this.scheduleDetailId,
    required this.updatedAt,
     this.cancelReasonId,
    required this.userId,
  });
  late final int createdAtTimeStamp;
  late final int updatedAtTimeStamp;
  late final String id;
  late final bool isDeleted;
  late final String createdAt;
  late final String scheduleDetailId;
  late final String updatedAt;
  late final int? cancelReasonId;
  late final String userId;
  
  BookingInfo.fromJson(Map<String, dynamic> json){
    createdAtTimeStamp = json['createdAtTimeStamp'];
    updatedAtTimeStamp = json['updatedAtTimeStamp'];
    id = json['id'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    scheduleDetailId = json['scheduleDetailId'];
    updatedAt = json['updatedAt'];
    cancelReasonId = null;
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['createdAtTimeStamp'] = createdAtTimeStamp;
    _data['updatedAtTimeStamp'] = updatedAtTimeStamp;
    _data['id'] = id;
    _data['isDeleted'] = isDeleted;
    _data['createdAt'] = createdAt;
    _data['scheduleDetailId'] = scheduleDetailId;
    _data['updatedAt'] = updatedAt;
    _data['cancelReasonId'] = cancelReasonId;
    _data['userId'] = userId;
    return _data;
  }
}