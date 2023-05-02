class HistoryResp {
  HistoryResp({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data data;

  HistoryResp.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.count,
    required this.rows,
  });
  late final int count;
  late final List<Rows> rows;

  Data.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    rows = List.from(json['rows']).map((e) => Rows.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['count'] = count;
    _data['rows'] = rows.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Rows {
  Rows({
    required this.createdAtTimeStamp,
    required this.updatedAtTimeStamp,
    required this.id,
    required this.userId,
    required this.scheduleDetailId,
    required this.tutorMeetingLink,
    required this.studentMeetingLink,
    this.studentRequest,
    this.tutorReview,
    this.scoreByTutor,
    required this.createdAt,
    required this.updatedAt,
    this.recordUrl,
    this.cancelReasonId,
    this.lessonPlanId,
    this.cancelNote,
    this.calendarId,
    required this.isDeleted,
    required this.scheduleDetailInfo,
    this.classReview,
    required this.showRecordUrl,
    required this.studentMaterials,
    required this.feedbacks,
  });
  late final int createdAtTimeStamp;
  late final int updatedAtTimeStamp;
  late final String id;
  late final String userId;
  late final String scheduleDetailId;
  late final String tutorMeetingLink;
  late final String studentMeetingLink;
  late final String? studentRequest;
  late final Null tutorReview;
  late final Null scoreByTutor;
  late final String createdAt;
  late final String updatedAt;
  late final Null recordUrl;
  late final Null cancelReasonId;
  late final Null lessonPlanId;
  late final Null cancelNote;
  late final Null calendarId;
  late final bool isDeleted;
  late final ScheduleDetailInfo scheduleDetailInfo;
  late final Null classReview;
  late final bool? showRecordUrl;
  late final List<dynamic> studentMaterials;
  late final List<dynamic> feedbacks;

  Rows.fromJson(Map<String, dynamic> json) {
    createdAtTimeStamp = json['createdAtTimeStamp'];
    updatedAtTimeStamp = json['updatedAtTimeStamp'];
    id = json['id'];
    userId = json['userId'];
    scheduleDetailId = json['scheduleDetailId'];
    tutorMeetingLink = json['tutorMeetingLink'];
    studentMeetingLink = json['studentMeetingLink'];
    studentRequest = json['studentMeetingLink'];
    tutorReview = null;
    scoreByTutor = null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    recordUrl = null;
    cancelReasonId = null;
    lessonPlanId = null;
    cancelNote = null;
    calendarId = null;
    isDeleted = json['isDeleted'];
    scheduleDetailInfo =
        ScheduleDetailInfo.fromJson(json['scheduleDetailInfo']);
    classReview = null;
    showRecordUrl = json['showRecordUrl'];
    studentMaterials =
        List.castFrom<dynamic, dynamic>(json['studentMaterials'] ?? []);
    feedbacks = List.castFrom<dynamic, dynamic>(json['feedbacks'] ?? []);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['createdAtTimeStamp'] = createdAtTimeStamp;
    _data['updatedAtTimeStamp'] = updatedAtTimeStamp;
    _data['id'] = id;
    _data['userId'] = userId;
    _data['scheduleDetailId'] = scheduleDetailId;
    _data['tutorMeetingLink'] = tutorMeetingLink;
    _data['studentMeetingLink'] = studentMeetingLink;
    _data['studentRequest'] = studentRequest;
    _data['tutorReview'] = tutorReview;
    _data['scoreByTutor'] = scoreByTutor;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['recordUrl'] = recordUrl;
    _data['cancelReasonId'] = cancelReasonId;
    _data['lessonPlanId'] = lessonPlanId;
    _data['cancelNote'] = cancelNote;
    _data['calendarId'] = calendarId;
    _data['isDeleted'] = isDeleted;
    _data['scheduleDetailInfo'] = scheduleDetailInfo.toJson();
    _data['classReview'] = classReview;
    _data['showRecordUrl'] = showRecordUrl;
    _data['studentMaterials'] = studentMaterials;
    _data['feedbacks'] = feedbacks;
    return _data;
  }
}

class ScheduleDetailInfo {
  ScheduleDetailInfo({
    required this.startPeriodTimestamp,
    required this.endPeriodTimestamp,
    required this.id,
    required this.scheduleId,
    required this.startPeriod,
    required this.endPeriod,
    required this.createdAt,
    required this.updatedAt,
    required this.scheduleInfo,
  });
  late final int startPeriodTimestamp;
  late final int endPeriodTimestamp;
  late final String id;
  late final String scheduleId;
  late final String startPeriod;
  late final String endPeriod;
  late final String createdAt;
  late final String updatedAt;
  late final ScheduleInfo scheduleInfo;

  ScheduleDetailInfo.fromJson(Map<String, dynamic> json) {
    startPeriodTimestamp = json['startPeriodTimestamp'];
    endPeriodTimestamp = json['endPeriodTimestamp'];
    id = json['id'];
    scheduleId = json['scheduleId'];
    startPeriod = json['startPeriod'];
    endPeriod = json['endPeriod'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    scheduleInfo = ScheduleInfo.fromJson(json['scheduleInfo']);
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
    _data['scheduleInfo'] = scheduleInfo.toJson();
    return _data;
  }
}

class ScheduleInfo {
  ScheduleInfo({
    required this.date,
    required this.startTimestamp,
    required this.endTimestamp,
    required this.id,
    required this.tutorId,
    required this.startTime,
    required this.endTime,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.tutorInfo,
  });
  late final String date;
  late final int startTimestamp;
  late final int endTimestamp;
  late final String id;
  late final String tutorId;
  late final String startTime;
  late final String endTime;
  late final bool isDeleted;
  late final String createdAt;
  late final String updatedAt;
  late final TutorInfo tutorInfo;

  ScheduleInfo.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    startTimestamp = json['startTimestamp'];
    endTimestamp = json['endTimestamp'];
    id = json['id'];
    tutorId = json['tutorId'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    tutorInfo = TutorInfo.fromJson(json['tutorInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['date'] = date;
    _data['startTimestamp'] = startTimestamp;
    _data['endTimestamp'] = endTimestamp;
    _data['id'] = id;
    _data['tutorId'] = tutorId;
    _data['startTime'] = startTime;
    _data['endTime'] = endTime;
    _data['isDeleted'] = isDeleted;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['tutorInfo'] = tutorInfo.toJson();
    return _data;
  }
}

class TutorInfo {
  TutorInfo({
    required this.id,
    required this.level,
    required this.email,
    this.google,
    this.facebook,
    this.apple,
    required this.avatar,
    required this.name,
    this.country,
    required this.phone,
    this.language,
    this.birthday,
    required this.requestPassword,
    required this.isActivated,
    this.isPhoneActivated,
    this.requireNote,
    this.timezone,
    this.phoneAuth,
    required this.isPhoneAuthActivated,
    this.studySchedule,
    required this.canSendMessage,
    required this.isPublicRecord,
    this.caredByStaffId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.studentGroupId,
  });
  late final String id;
  late final String level;
  late final String email;
  late final Null google;
  late final Null facebook;
  late final Null apple;
  late final String avatar;
  late final String name;
  late final String? country;
  late final String phone;
  late final Null language;
  late final String? birthday;
  late final bool requestPassword;
  late final bool isActivated;
  late final Null isPhoneActivated;
  late final Null requireNote;
  late final int? timezone;
  late final Null phoneAuth;
  late final bool isPhoneAuthActivated;
  late final Null studySchedule;
  late final bool canSendMessage;
  late final bool isPublicRecord;
  late final Null caredByStaffId;
  late final String createdAt;
  late final String updatedAt;
  late final Null deletedAt;
  late final Null studentGroupId;

  TutorInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
    email = json['email'];
    google = null;
    facebook = null;
    apple = null;
    avatar = json['avatar'];
    name = json['name'];
    country = json['country'];
    phone = json['phone'];
    language = null;
    birthday = json['birthday'];
    requestPassword = json['requestPassword'];
    isActivated = json['isActivated'];
    isPhoneActivated = null;
    requireNote = null;
    timezone = json['timezone'];
    phoneAuth = null;
    isPhoneAuthActivated = json['isPhoneAuthActivated'];
    studySchedule = null;
    canSendMessage = json['canSendMessage'];
    isPublicRecord = json['isPublicRecord'];
    caredByStaffId = null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = null;
    studentGroupId = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['level'] = level;
    _data['email'] = email;
    _data['google'] = google;
    _data['facebook'] = facebook;
    _data['apple'] = apple;
    _data['avatar'] = avatar;
    _data['name'] = name;
    _data['country'] = country;
    _data['phone'] = phone;
    _data['language'] = language;
    _data['birthday'] = birthday;
    _data['requestPassword'] = requestPassword;
    _data['isActivated'] = isActivated;
    _data['isPhoneActivated'] = isPhoneActivated;
    _data['requireNote'] = requireNote;
    _data['timezone'] = timezone;
    _data['phoneAuth'] = phoneAuth;
    _data['isPhoneAuthActivated'] = isPhoneAuthActivated;
    _data['studySchedule'] = studySchedule;
    _data['canSendMessage'] = canSendMessage;
    _data['isPublicRecord'] = isPublicRecord;
    _data['caredByStaffId'] = caredByStaffId;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['deletedAt'] = deletedAt;
    _data['studentGroupId'] = studentGroupId;
    return _data;
  }
}
