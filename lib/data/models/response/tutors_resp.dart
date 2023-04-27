class TutorsResp {
  TutorsResp({
    required this.tutors,
    required this.favoriteTutor,
  });
  late final Tutors tutors;
  late final List<FavoriteTutor> favoriteTutor;

  TutorsResp.fromJson(Map<String, dynamic> json) {
    tutors = Tutors.fromJson(json['tutors']);
    favoriteTutor = List.from(json['favoriteTutor'])
        .map((e) => FavoriteTutor.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['tutors'] = tutors.toJson();
    data['favoriteTutor'] = favoriteTutor.map((e) => e.toJson()).toList();
    return data;
  }
}

class Tutors {
  Tutors({
    required this.count,
    required this.rows,
  });
  late final int count;
  late final List<Rows> rows;

  Tutors.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    rows = List.from(json['rows']).map((e) => Rows.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['count'] = count;
    data['rows'] = rows.map((e) => e.toJson()).toList();
    return data;
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
  late final String? google;
  late final String? facebook;
  late final String? apple;
  late final String? avatar;
  late final String name;
  late final String? country;
  late final String? phone;
  late final String? language;
  late final String? birthday;
  late final bool requestPassword;
  late final bool isActivated;
  late final bool? isPhoneActivated;
  late final String? requireNote;
  late final int? timezone;
  late final String? phoneAuth;
  late final bool isPhoneAuthActivated;
  late final String? studySchedule;
  late final bool canSendMessage;
  late final bool isPublicRecord;
  late final String? caredByStaffId;
  late final String createdAt;
  late final String updatedAt;
  late final String? deletedAt;
  late final String? studentGroupId;
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
  late final bool? isNative;
  late final int? price;
  late final bool? isOnline;

  Rows.fromJson(Map<String, dynamic> json) {
    level = null;
    email = json['email'];
    google = null;
    facebook = null;
    apple = null;
    avatar = json['avatar'];
    name = json['name'];
    country = json['country'];
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

    feedbacks = List.from(json['feedbacks'] ?? [])
        .map((e) => Feedbacks.fromJson(e))
        .toList();

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
    rating = json['rating'];
    isNative = null;
    price = json['price'];
    isOnline = json['isOnline'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['level'] = level;
    data['email'] = email;
    data['google'] = google;
    data['facebook'] = facebook;
    data['apple'] = apple;
    data['avatar'] = avatar;
    data['name'] = name;
    data['country'] = country;
    data['phone'] = phone;
    data['language'] = language;
    data['birthday'] = birthday;
    data['requestPassword'] = requestPassword;
    data['isActivated'] = isActivated;
    data['isPhoneActivated'] = isPhoneActivated;
    data['requireNote'] = requireNote;
    data['timezone'] = timezone;
    data['phoneAuth'] = phoneAuth;
    data['isPhoneAuthActivated'] = isPhoneAuthActivated;
    data['studySchedule'] = studySchedule;
    data['canSendMessage'] = canSendMessage;
    data['isPublicRecord'] = isPublicRecord;
    data['caredByStaffId'] = caredByStaffId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['studentGroupId'] = studentGroupId;
    data['feedbacks'] = feedbacks = feedbacks.map((e) => e.toJson()).cast<Feedbacks>().toList();
    data['id'] = id;
    data['userId'] = userId;
    data['video'] = video;
    data['bio'] = bio;
    data['education'] = education;
    data['experience'] = experience;
    data['profession'] = profession;
    data['accent'] = accent;
    data['targetStudent'] = targetStudent;
    data['interests'] = interests;
    data['languages'] = languages;
    data['specialties'] = specialties;
    data['resume'] = resume;
    data['rating'] = rating;
    data['isNative'] = isNative;
    data['price'] = price;
    data['isOnline'] = isOnline;
    return data;
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

  Feedbacks.fromJson(Map<String, dynamic> json) {
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
    final data = <String, dynamic>{};
    data['id'] = id;
    data['bookingId'] = bookingId;
    data['firstId'] = firstId;
    data['secondId'] = secondId;
    data['rating'] = rating;
    data['content'] = content;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['firstInfo'] = firstInfo.toJson();
    return data;
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
  late final String? apple;
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
  late final String? phoneAuth;
  late final bool isPhoneAuthActivated;
  late final String? studySchedule;
  late final bool canSendMessage;
  late final bool isPublicRecord;
  late final String? caredByStaffId;
  late final String createdAt;
  late final String updatedAt;
  late final String? deletedAt;
  late final String? studentGroupId;

  FirstInfo.fromJson(Map<String, dynamic> json) {
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
    final data = <String, dynamic>{};
    data['level'] = level;
    data['email'] = email;
    data['google'] = google;
    data['facebook'] = facebook;
    data['apple'] = apple;
    data['avatar'] = avatar;
    data['name'] = name;
    data['country'] = country;
    data['phone'] = phone;
    data['language'] = language;
    data['birthday'] = birthday;
    data['requestPassword'] = requestPassword;
    data['isActivated'] = isActivated;
    data['isPhoneActivated'] = isPhoneActivated;
    data['requireNote'] = requireNote;
    data['timezone'] = timezone;
    data['phoneAuth'] = phoneAuth;
    data['isPhoneAuthActivated'] = isPhoneAuthActivated;
    data['studySchedule'] = studySchedule;
    data['canSendMessage'] = canSendMessage;
    data['isPublicRecord'] = isPublicRecord;
    data['caredByStaffId'] = caredByStaffId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['studentGroupId'] = studentGroupId;
    return data;
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

  FavoriteTutor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstId = json['firstId'];
    secondId = json['secondId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    secondInfo = null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['firstId'] = firstId;
    data['secondId'] = secondId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['secondInfo'] = secondInfo;
    return data;
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
  late final String? google;
  late final String? facebook;
  late final String? apple;
  late final String avatar;
  late final String name;
  late final String country;
  late final String phone;
  late final String? language;
  late final String birthday;
  late final bool requestPassword;
  late final bool isActivated;
  late final bool? isPhoneActivated;
  late final String? requireNote;
  late final int timezone;
  late final String? phoneAuth;
  late final bool isPhoneAuthActivated;
  late final String? studySchedule;
  late final bool canSendMessage;
  late final bool isPublicRecord;
  late final String? caredByStaffId;
  late final String createdAt;
  late final String updatedAt;
  late final String? deletedAt;
  late final String? studentGroupId;
  late final TutorInfo tutorInfo;

  SecondInfo.fromJson(Map<String, dynamic> json) {
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
    final data = <String, dynamic>{};
    data['id'] = id;
    data['level'] = level;
    data['email'] = email;
    data['google'] = google;
    data['facebook'] = facebook;
    data['apple'] = apple;
    data['avatar'] = avatar;
    data['name'] = name;
    data['country'] = country;
    data['phone'] = phone;
    data['language'] = language;
    data['birthday'] = birthday;
    data['requestPassword'] = requestPassword;
    data['isActivated'] = isActivated;
    data['isPhoneActivated'] = isPhoneActivated;
    data['requireNote'] = requireNote;
    data['timezone'] = timezone;
    data['phoneAuth'] = phoneAuth;
    data['isPhoneAuthActivated'] = isPhoneAuthActivated;
    data['studySchedule'] = studySchedule;
    data['canSendMessage'] = canSendMessage;
    data['isPublicRecord'] = isPublicRecord;
    data['caredByStaffId'] = caredByStaffId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['studentGroupId'] = studentGroupId;
    data['tutorInfo'] = tutorInfo.toJson();
    return data;
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
  late final String? accent;
  late final String targetStudent;
  late final String interests;
  late final String languages;
  late final String specialties;
  late final String? resume;
  late final double? rating;
  late final bool isActivated;
  late final bool? isNative;
  late final String createdAt;
  late final String updatedAt;

  TutorInfo.fromJson(Map<String, dynamic> json) {
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
    final data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['video'] = video;
    data['bio'] = bio;
    data['education'] = education;
    data['experience'] = experience;
    data['profession'] = profession;
    data['accent'] = accent;
    data['targetStudent'] = targetStudent;
    data['interests'] = interests;
    data['languages'] = languages;
    data['specialties'] = specialties;
    data['resume'] = resume;
    data['rating'] = rating;
    data['isActivated'] = isActivated;
    data['isNative'] = isNative;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
