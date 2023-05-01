class PastHistoryResp {
  PastHistoryResp({
    required this.count,
    required this.rows,
  });
  late final int count;
  late final List<Rows> rows;
  
  PastHistoryResp.fromJson(Map<String, dynamic> json){
    count = json['count'];
    rows = List.from(json['rows']).map((e)=>Rows.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['count'] = count;
    _data['rows'] = rows.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Rows {
  Rows({
    required this.id,
    required this.studentId,
    required this.tutorId,
     this.videoUrl,
    required this.startTime,
    required this.endTime,
    required this.isReviewed,
    required this.isTutorReviewed,
    required this.createdAt,
    required this.updatedAt,
     this.note,
    required this.tutorInfo,
    required this.during,
  });
  late final String id;
  late final String studentId;
  late final String tutorId;
  late final String? videoUrl;
  late final String startTime;
  late final String endTime;
  late final bool isReviewed;
  late final bool isTutorReviewed;
  late final String createdAt;
  late final String updatedAt;
  late final String? note;
  late final TutorInfo tutorInfo;
  late final String during;
  
  Rows.fromJson(Map<String, dynamic> json){
    id = json['id'];
    studentId = json['studentId'];
    tutorId = json['tutorId'];
    videoUrl = json['videoUrl'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    isReviewed = json['isReviewed'];
    isTutorReviewed = json['isTutorReviewed'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    note = json['note'];
    tutorInfo = TutorInfo.fromJson(json['tutorInfo']);
    during = json['during'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['studentId'] = studentId;
    _data['tutorId'] = tutorId;
    _data['videoUrl'] = videoUrl;
    _data['startTime'] = startTime;
    _data['endTime'] = endTime;
    _data['isReviewed'] = isReviewed;
    _data['isTutorReviewed'] = isTutorReviewed;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['note'] = note;
    _data['tutorInfo'] = tutorInfo.toJson();
    _data['during'] = during;
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
    required this.country,
    required this.phone,
    required this.language,
    required this.birthday,
    required this.requestPassword,
    required this.isActivated,
     this.isPhoneActivated,
     this.requireNote,
    required this.timezone,
     this.phoneAuth,
    required this.isPhoneAuthActivated,
    required this.studySchedule,
    required this.canSendMessage,
    required this.isPublicRecord,
     this.caredByStaffId,
    required this.createdAt,
    required this.updatedAt,
     this.deletedAt,
     this.studentGroupId,
    required this.feedbacks,
  });
  late final String id;
  late final String level;
  late final String email;
  late final Null google;
  late final Null facebook;
  late final Null apple;
  late final String avatar;
  late final String name;
  late final String country;
  late final String phone;
  late final String language;
  late final String birthday;
  late final bool requestPassword;
  late final bool isActivated;
  late final Null isPhoneActivated;
  late final Null requireNote;
  late final int timezone;
  late final Null phoneAuth;
  late final bool isPhoneAuthActivated;
  late final String studySchedule;
  late final bool canSendMessage;
  late final bool isPublicRecord;
  late final Null caredByStaffId;
  late final String createdAt;
  late final String updatedAt;
  late final Null deletedAt;
  late final Null studentGroupId;
  late final List<Feedbacks> feedbacks;
  
  TutorInfo.fromJson(Map<String, dynamic> json){
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
    language = json['language'];
    birthday = json['birthday'];
    requestPassword = json['requestPassword'];
    isActivated = json['isActivated'];
    isPhoneActivated = null;
    requireNote = null;
    timezone = json['timezone'];
    phoneAuth = null;
    isPhoneAuthActivated = json['isPhoneAuthActivated'];
    studySchedule = json['studySchedule'];
    canSendMessage = json['canSendMessage'];
    isPublicRecord = json['isPublicRecord'];
    caredByStaffId = null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = null;
    studentGroupId = null;
    feedbacks = List.from(json['feedbacks']).map((e)=>Feedbacks.fromJson(e)).toList();
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
    _data['feedbacks'] = feedbacks.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Feedbacks {
  Feedbacks({
    required this.id,
     this.bookingId,
    required this.firstId,
    required this.secondId,
    required this.rating,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.secondInfo,
  });
  late final String id;
  late final String? bookingId;
  late final String firstId;
  late final String secondId;
  late final int rating;
  late final String content;
  late final String createdAt;
  late final String updatedAt;
  late final SecondInfo secondInfo;
  
  Feedbacks.fromJson(Map<String, dynamic> json){
    id = json['id'];
    bookingId = null;
    firstId = json['firstId'];
    secondId = json['secondId'];
    rating = json['rating'];
    content = json['content'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    secondInfo = SecondInfo.fromJson(json['secondInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['bookingId'] = bookingId;
    _data['firstId'] = firstId;
    _data['secondId'] = secondId;
    _data['rating'] = rating;
    _data['content'] = content;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['secondInfo'] = secondInfo.toJson();
    return _data;
  }
}

class SecondInfo {
  SecondInfo({
    required this.level,
    required this.email,
     this.google,
     this.facebook,
     this.apple,
    required this.avatar,
    required this.name,
    required this.country,
    required this.phone,
    required this.language,
    required this.birthday,
    required this.requestPassword,
    required this.isActivated,
     this.isPhoneActivated,
     this.requireNote,
    required this.timezone,
     this.phoneAuth,
    required this.isPhoneAuthActivated,
    required this.studySchedule,
    required this.canSendMessage,
    required this.isPublicRecord,
     this.caredByStaffId,
    required this.createdAt,
    required this.updatedAt,
     this.deletedAt,
     this.studentGroupId,
  });
  late final String level;
  late final String email;
  late final Null google;
  late final Null facebook;
  late final Null apple;
  late final String avatar;
  late final String name;
  late final String country;
  late final String phone;
  late final String language;
  late final String birthday;
  late final bool requestPassword;
  late final bool isActivated;
  late final Null isPhoneActivated;
  late final Null requireNote;
  late final int timezone;
  late final Null phoneAuth;
  late final bool isPhoneAuthActivated;
  late final String studySchedule;
  late final bool canSendMessage;
  late final bool isPublicRecord;
  late final Null caredByStaffId;
  late final String createdAt;
  late final String updatedAt;
  late final Null deletedAt;
  late final Null studentGroupId;
  
  SecondInfo.fromJson(Map<String, dynamic> json){
    level = json['level'];
    email = json['email'];
    google = null;
    facebook = null;
    apple = null;
    avatar = json['avatar'];
    name = json['name'];
    country = json['country'];
    phone = json['phone'];
    language = json['language'];
    birthday = json['birthday'];
    requestPassword = json['requestPassword'];
    isActivated = json['isActivated'];
    isPhoneActivated = null;
    requireNote = null;
    timezone = json['timezone'];
    phoneAuth = null;
    isPhoneAuthActivated = json['isPhoneAuthActivated'];
    studySchedule = json['studySchedule'];
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