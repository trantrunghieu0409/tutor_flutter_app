class UserInfoResp {
  UserInfoResp({
    required this.user,
  });
  late final User user;
  
  UserInfoResp.fromJson(Map<String, dynamic> json){
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user.toJson();
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
    required this.country,
    required this.phone,
    required this.roles,
     this.language,
    required this.birthday,
    required this.isActivated,
    required this.tutorInfo,
    required this.walletInfo,
    required this.requireNote,
    required this.level,
    required this.learnTopics,
    required this.testPreparations,
    required this.isPhoneActivated,
    required this.timezone,
    required this.referralInfo,
    required this.studySchedule,
    required this.canSendMessage,
     this.studentGroup,
     this.studentInfo,
    required this.avgRating,
  });
  late final String id;
  late final String email;
  late final String name;
  late final String avatar;
  late final String country;
  late final String phone;
  late final List<String> roles;
  late final Null language;
  late final String birthday;
  late final bool isActivated;
  late final TutorInfo tutorInfo;
  late final WalletInfo walletInfo;
  late final String requireNote;
  late final String level;
  late final List<dynamic> learnTopics;
  late final List<TestPreparations> testPreparations;
  late final bool isPhoneActivated;
  late final int timezone;
  late final ReferralInfo referralInfo;
  late final String studySchedule;
  late final bool canSendMessage;
  late final Null studentGroup;
  late final Null studentInfo;
  late final int avgRating;
  
  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    email = json['email'];
    name = json['name'];
    avatar = json['avatar'];
    country = json['country'];
    phone = json['phone'];
    roles = List.castFrom<dynamic, String>(json['roles']);
    language = null;
    birthday = json['birthday'];
    isActivated = json['isActivated'];
    tutorInfo = TutorInfo.fromJson(json['tutorInfo']);
    walletInfo = WalletInfo.fromJson(json['walletInfo']);
    requireNote = json['requireNote'];
    level = json['level'];
    learnTopics = List.castFrom<dynamic, dynamic>(json['learnTopics']);
    testPreparations = List.from(json['testPreparations']).map((e)=>TestPreparations.fromJson(e)).toList();
    isPhoneActivated = json['isPhoneActivated'];
    timezone = json['timezone'];
    referralInfo = ReferralInfo.fromJson(json['referralInfo']);
    studySchedule = json['studySchedule'];
    canSendMessage = json['canSendMessage'];
    studentGroup = null;
    studentInfo = null;
    avgRating = json['avgRating'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['email'] = email;
    _data['name'] = name;
    _data['avatar'] = avatar;
    _data['country'] = country;
    _data['phone'] = phone;
    _data['roles'] = roles;
    _data['language'] = language;
    _data['birthday'] = birthday;
    _data['isActivated'] = isActivated;
    _data['tutorInfo'] = tutorInfo.toJson();
    _data['walletInfo'] = walletInfo.toJson();
    _data['requireNote'] = requireNote;
    _data['level'] = level;
    _data['learnTopics'] = learnTopics;
    _data['testPreparations'] = testPreparations.map((e)=>e.toJson()).toList();
    _data['isPhoneActivated'] = isPhoneActivated;
    _data['timezone'] = timezone;
    _data['referralInfo'] = referralInfo.toJson();
    _data['studySchedule'] = studySchedule;
    _data['canSendMessage'] = canSendMessage;
    _data['studentGroup'] = studentGroup;
    _data['studentInfo'] = studentInfo;
    _data['avgRating'] = avgRating;
    return _data;
  }
}

class TutorInfo {
  TutorInfo({
    required this.id,
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
    required this.rating,
    required this.isActivated,
    required this.isNative,
  });
  late final String id;
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
  late final int rating;
  late final bool isActivated;
  late final bool isNative;
  
  TutorInfo.fromJson(Map<String, dynamic> json){
    id = json['id'];
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
    isActivated = json['isActivated'];
    isNative = json['isNative'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
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
    return _data;
  }
}

class WalletInfo {
  WalletInfo({
    required this.amount,
    required this.isBlocked,
    required this.bonus,
  });
  late final String amount;
  late final bool isBlocked;
  late final int bonus;
  
  WalletInfo.fromJson(Map<String, dynamic> json){
    amount = json['amount'];
    isBlocked = json['isBlocked'];
    bonus = json['bonus'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['amount'] = amount;
    _data['isBlocked'] = isBlocked;
    _data['bonus'] = bonus;
    return _data;
  }
}

class TestPreparations {
  TestPreparations({
    required this.id,
    required this.key,
    required this.name,
  });
  late final int id;
  late final String key;
  late final String name;
  
  TestPreparations.fromJson(Map<String, dynamic> json){
    id = json['id'];
    key = json['key'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['key'] = key;
    _data['name'] = name;
    return _data;
  }
}

class ReferralInfo {
  ReferralInfo({
    required this.referralCode,
    required this.referralPackInfo,
  });
  late final String referralCode;
  late final ReferralPackInfo referralPackInfo;
  
  ReferralInfo.fromJson(Map<String, dynamic> json){
    referralCode = json['referralCode'];
    referralPackInfo = ReferralPackInfo.fromJson(json['referralPackInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['referralCode'] = referralCode;
    _data['referralPackInfo'] = referralPackInfo.toJson();
    return _data;
  }
}

class ReferralPackInfo {
  ReferralPackInfo({
    required this.earnPercent,
  });
  late final int earnPercent;
  
  ReferralPackInfo.fromJson(Map<String, dynamic> json){
    earnPercent = json['earnPercent'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['earnPercent'] = earnPercent;
    return _data;
  }
}