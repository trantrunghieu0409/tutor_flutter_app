class TutorsResp {
  TutorsResp({
    required this.tutors,
    required this.favoriteTutor,
  });
  late final Tutors tutors;
  late final List<FavoriteTutor> favoriteTutor;
  
  TutorsResp.fromJson(Map<String, dynamic> json){
    tutors = Tutors.fromJson(json['tutors']);
    favoriteTutor = List.from(json['favoriteTutor']).map((e)=>FavoriteTutor.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['tutors'] = tutors.toJson();
    _data['favoriteTutor'] = favoriteTutor.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Tutors {
  Tutors({
    required this.count,
    required this.rows,
  });
  late final int count;
  late final List<Rows> rows;
  
  Tutors.fromJson(Map<String, dynamic> json){
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
     this.level,
    required this.email,
     this.google,
     this.facebook,
     this.apple,
     this.avatar,
    required this.name,
     this.country,
     this.phone,
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
    required this.feedbacks,
    required this.id,
    required this.userId,
    required this.video,
    required this.bio,
    required this.education,
    required this.experience,
    required this.profession,
     this.accent,
    required this.targetStudent,
    required this.interests,
    required this.languages,
    required this.specialties,
     this.resume,
     this.rating,
     this.isNative,
    required this.price,
    required this.isOnline,
  });
  late final String? level;
  late final String email;
  late final Null google;
  late final Null facebook;
  late final Null apple;
  late final String? avatar;
  late final String name;
  late final String? country;
  late final String? phone;
  late final String? language;
  late final String? birthday;
  late final bool requestPassword;
  late final bool isActivated;
  late final Null isPhoneActivated;
  late final Null requireNote;
  late final int? timezone;
  late final Null phoneAuth;
  late final bool isPhoneAuthActivated;
  late final String? studySchedule;
  late final bool canSendMessage;
  late final bool isPublicRecord;
  late final Null caredByStaffId;
  late final String createdAt;
  late final String updatedAt;
  late final Null deletedAt;
  late final Null studentGroupId;
  late final List<Feedbacks> feedbacks;
  late final String id;
  late final String userId;
  late final String video;
  late final String bio;
  late final String education;
  late final String experience;
  late final String profession;
  late final String? accent;
  late final String targetStudent;
  late final String interests;
  late final String languages;
  late final String specialties;
  late final String? resume;
  late final double? rating;
  late final Null isNative;
  late final int price;
  late final bool isOnline;
  
  Rows.fromJson(Map<String, dynamic> json){
    level = null;
    email = json['email'];
    google = null;
    facebook = null;
    apple = null;
    avatar = null;
    name = json['name'];
    country = null;
    phone = null;
    language = null;
    birthday = null;
    requestPassword = json['requestPassword'];
    isActivated = json['isActivated'];
    isPhoneActivated = null;
    requireNote = null;
    timezone = null;
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
    feedbacks = List.from(json['feedbacks']).map((e)=>Feedbacks.fromJson(e)).toList();
    id = json['id'];
    userId = json['userId'];
    video = json['video'];
    bio = json['bio'];
    education = json['education'];
    experience = json['experience'];
    profession = json['profession'];
    accent = null;
    targetStudent = json['targetStudent'];
    interests = json['interests'];
    languages = json['languages'];
    specialties = json['specialties'];
    resume = null;
    rating = null;
    isNative = null;
    price = json['price'];
    isOnline = json['isOnline'];
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
    _data['feedbacks'] = feedbacks.map((e)=>e.toJson()).toList();
    _data['id'] = id;
    _data['userId'] = userId;
    _data['video'] = video;
    _data['bio'] = bio;
    _data['education'] = education;
    _data['experience'] = experience;
    _data['profession'] = profession;
    _data['accent'] = accent;
    _data['targetStudent'] = targetStudent;
    _data['interests'] = interests;
    _data['languages'] = languages;
    _data['specialties'] = specialties;
    _data['resume'] = resume;
    _data['rating'] = rating;
    _data['isNative'] = isNative;
    _data['price'] = price;
    _data['isOnline'] = isOnline;
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
  
  Feedbacks.fromJson(Map<String, dynamic> json){
    id = json['id'];
    bookingId = null;
    firstId = json['firstId'];
    secondId = json['secondId'];
    rating = json['rating'];
    content = json['content'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    firstInfo = FirstInfo.fromJson(json['firstInfo']);
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
    _data['firstInfo'] = firstInfo.toJson();
    return _data;
  }
}

class FirstInfo {
  FirstInfo({
     this.level,
    required this.email,
     this.google,
     this.facebook,
     this.apple,
    required this.avatar,
    required this.name,
     this.country,
     this.phone,
     this.language,
     this.birthday,
    required this.requestPassword,
    required this.isActivated,
     this.isPhoneActivated,
     this.requireNote,
    required this.timezone,
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
  late final String? level;
  late final String email;
  late final String? google;
  late final String? facebook;
  late final Null apple;
  late final String avatar;
  late final String name;
  late final String? country;
  late final String? phone;
  late final String? language;
  late final String? birthday;
  late final bool requestPassword;
  late final bool isActivated;
  late final bool? isPhoneActivated;
  late final String? requireNote;
  late final int timezone;
  late final Null phoneAuth;
  late final bool isPhoneAuthActivated;
  late final String? studySchedule;
  late final bool canSendMessage;
  late final bool isPublicRecord;
  late final Null caredByStaffId;
  late final String createdAt;
  late final String updatedAt;
  late final Null deletedAt;
  late final Null studentGroupId;
  
  FirstInfo.fromJson(Map<String, dynamic> json){
    level = null;
    email = json['email'];
    google = null;
    facebook = null;
    apple = null;
    avatar = json['avatar'];
    name = json['name'];
    country = null;
    phone = null;
    language = null;
    birthday = null;
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

class FavoriteTutor {
  FavoriteTutor({
    required this.id,
    required this.firstId,
    required this.secondId,
    required this.createdAt,
    required this.updatedAt,
     this.secondInfo,
  });
  late final String id;
  late final String firstId;
  late final String secondId;
  late final String createdAt;
  late final String updatedAt;
  late final SecondInfo? secondInfo;
  
  FavoriteTutor.fromJson(Map<String, dynamic> json){
    id = json['id'];
    firstId = json['firstId'];
    secondId = json['secondId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    secondInfo = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['firstId'] = firstId;
    _data['secondId'] = secondId;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['secondInfo'] = secondInfo;
    return _data;
  }
}

class SecondInfo {
  SecondInfo({
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
     this.language,
    required this.birthday,
    required this.requestPassword,
    required this.isActivated,
     this.isPhoneActivated,
     this.requireNote,
    required this.timezone,
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
    required this.tutorInfo,
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
  late final String? language;
  late final String birthday;
  late final bool requestPassword;
  late final bool isActivated;
  late final Null isPhoneActivated;
  late final Null requireNote;
  late final int timezone;
  late final Null phoneAuth;
  late final bool isPhoneAuthActivated;
  late final String? studySchedule;
  late final bool canSendMessage;
  late final bool isPublicRecord;
  late final Null caredByStaffId;
  late final String createdAt;
  late final String updatedAt;
  late final Null deletedAt;
  late final Null studentGroupId;
  late final TutorInfo tutorInfo;
  
  SecondInfo.fromJson(Map<String, dynamic> json){
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
    tutorInfo = TutorInfo.fromJson(json['tutorInfo']);
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
    _data['tutorInfo'] = tutorInfo.toJson();
    return _data;
  }
}

class TutorInfo {
  TutorInfo({
    required this.id,
    required this.userId,
    required this.video,
    required this.bio,
    required this.education,
    required this.experience,
    required this.profession,
     this.accent,
    required this.targetStudent,
    required this.interests,
    required this.languages,
    required this.specialties,
     this.resume,
     this.rating,
    required this.isActivated,
     this.isNative,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String userId;
  late final String video;
  late final String bio;
  late final String education;
  late final String experience;
  late final String profession;
  late final Null accent;
  late final String targetStudent;
  late final String interests;
  late final String languages;
  late final String specialties;
  late final Null resume;
  late final double? rating;
  late final bool isActivated;
  late final Null isNative;
  late final String createdAt;
  late final String updatedAt;
  
  TutorInfo.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['userId'];
    video = json['video'];
    bio = json['bio'];
    education = json['education'];
    experience = json['experience'];
    profession = json['profession'];
    accent = null;
    targetStudent = json['targetStudent'];
    interests = json['interests'];
    languages = json['languages'];
    specialties = json['specialties'];
    resume = null;
    rating = null;
    isActivated = json['isActivated'];
    isNative = null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['userId'] = userId;
    _data['video'] = video;
    _data['bio'] = bio;
    _data['education'] = education;
    _data['experience'] = experience;
    _data['profession'] = profession;
    _data['accent'] = accent;
    _data['targetStudent'] = targetStudent;
    _data['interests'] = interests;
    _data['languages'] = languages;
    _data['specialties'] = specialties;
    _data['resume'] = resume;
    _data['rating'] = rating;
    _data['isActivated'] = isActivated;
    _data['isNative'] = isNative;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}